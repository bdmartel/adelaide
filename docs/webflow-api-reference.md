# Webflow MCP + API Reference
**Compiled:** 2026-03-24 | **For:** Adelaide project + future Webflow work
**Sources:** Webflow MCP guide tool, Webflow AI, developer docs

---

## Table of Contents
1. [Authentication](#authentication)
2. [Data API Endpoints](#data-api-endpoints)
3. [Designer Tools (Bridge App)](#designer-tools-bridge-app)
4. [CMS Workflow](#cms-workflow)
5. [Tool Usage Guidelines](#tool-usage-guidelines)
6. [Publishing](#publishing)
7. [Known Limitations](#known-limitations)
8. [Adelaide-Specific Details](#adelaide-specific-details)

---

## Authentication

### Token Types

| Type | Scope | Plan | Use Case |
|------|-------|------|----------|
| **Site API Token** | One site, configurable scopes | All plans | MCP server, direct API access |
| **Workspace Token** | `workspace_activity:read` only | Enterprise only | Audit logs only — NOT for site data |
| **OAuth Token** | User-scoped, multi-site | All plans | Remote MCP (`mcp.webflow.com/mcp`) |

**For MCP server: always use a Site API Token.**

### Generating a Site API Token
1. Webflow Dashboard → click gear icon on site → **Site Settings**
2. Left sidebar → **Apps & Integrations**
3. Scroll to **API access** → **Generate API token**
4. Select scopes (enable read+write on all for full MCP access)
5. Copy immediately — cannot view again after leaving page

### Token Expiry
- Expires after **365 consecutive days of inactivity**
- Any API call resets the timer
- Limit: 5 tokens per site

### Claude Code Config
```bash
# Add/replace MCP server
claude mcp remove webflow-local -s user
claude mcp add webflow-local -s user -e WEBFLOW_TOKEN=YOUR_TOKEN -- npx -y webflow-mcp-server@latest
```

---

## Data API Endpoints

### Sites
| Method | Path | Description |
|--------|------|-------------|
| `GET` | `/v2/sites` | List all accessible sites |
| `GET` | `/v2/sites/{site_id}` | Get site details |
| `POST` | `/v2/sites/{site_id}/publish` | Publish site to specified domains |

### Pages
| Method | Path | Description |
|--------|------|-------------|
| `GET` | `/sites/{site_id}/pages` | List all pages |
| `GET` | `/pages/{page_id}` | Get page metadata |
| `PUT` | `/pages/{page_id}/custom_code` | Add custom code to a page |

### CMS Collections
| Method | Path | Description |
|--------|------|-------------|
| `POST` | `/sites/{site_id}/collections` | Create new collection |
| `POST` | `/collections/{collection_id}/fields` | Create field in collection |
| `PATCH` | `/collections/{collection_id}/fields/{field_id}` | Update a field |
| `DELETE` | `/collections/{collection_id}/fields/{field_id}` | Remove a field |

### CMS Items
| Method | Path | Description |
|--------|------|-------------|
| `POST` | `/collections/{collection_id}/items` | Create draft item |
| `POST` | `/collections/{collection_id}/items/live` | Create and publish item directly |
| `PATCH` | `/collections/{collection_id}/items` | Update item (draft) |
| `PATCH` | `/collections/{collection_id}/items/live` | Update and publish item directly |
| `POST` | `/collections/{collection_id}/items/publish` | Publish specific items by ID |
| `DELETE` | `/collections/{collection_id}/items/live` | Unpublish items |

### Assets
| Method | Path | Description |
|--------|------|-------------|
| `GET` | `/sites/{site_id}/assets` | List all assets |
| `POST` | `/sites/{site_id}/assets` | Create asset metadata |
| `DELETE` | `/assets/{asset_id}` | Remove asset |
| `GET` | `/sites/{site_id}/asset_folders` | List asset folders |
| `POST` | `/sites/{site_id}/asset_folders` | Create asset folder |
| `GET` | `/asset_folders/{asset_folder_id}` | Get folder details |

### Forms
| Method | Path | Description |
|--------|------|-------------|
| `GET` | `/sites/{site_id}/forms` | List all forms |
| `GET` | `/forms/{form_id}` | Get form schema |
| `GET` | `/forms/{form_id}/submissions` | List form submissions |
| `GET` | `/form_submissions/{id}` | Get specific submission |
| `PATCH` | `/form_submissions/{id}` | Update submission |

### Custom Code
| Method | Path | Description |
|--------|------|-------------|
| `GET` | `/sites/{site_id}/registered_scripts` | List registered scripts |
| `POST` | `/sites/{site_id}/registered_scripts/inline` | Register inline script |
| `POST` | `/sites/{site_id}/registered_scripts/hosted` | Register hosted script |
| `PUT` | `/sites/{site_id}/custom_code` | Add site-wide custom code |

---

## Designer Tools (Bridge App)

### What Is the Bridge App
A companion app that connects to the Webflow Designer, enabling programmatic control of the visual canvas through MCP tools. Required for all Designer-side operations.

### How to Connect
1. Open site in Webflow Designer
2. Open Apps panel (press `E`)
3. Launch "Webflow MCP Bridge App"
4. Wait for "Connected to the MCP server"
5. If prompted for connection URL → call `get_designer_app_connection_info` tool

**Requirement:** Designer tab must be active and foregrounded.

### Designer vs Data API

| Feature | Designer Tools | Data API Tools |
|---------|---------------|----------------|
| Connection | Requires open Designer + Bridge App | Works independently |
| Interaction | Real-time visual changes | Background operations |
| Context | Context-aware (current page/component) | Context-independent |
| Use Case | Active design work, element manipulation | CMS, metadata, publishing |
| Feedback | Immediate visual feedback | Programmatic responses only |

### Available Designer Tools

#### `de_page_tool`
- `create_page` — Create new page (auto-switches to it)
- `create_page_folder` — Create page folders
- `get_current_page` — Check current page context
- `switch_page` — Navigate to a different page

#### `element_tool`
- `get_selected_element` — Inspect currently selected element
- `select_element` — Select element by ID
- `get_all_elements` — Get all elements on page (set `include_style_properties: false` to avoid data overload)
- `add_or_update_attribute` — Set attributes (only if `canHaveAttributes: true`)
- `remove_attribute` — Remove an attribute
- `update_id_attribute` — Set custom DOM ID (no `#` prefix)
- `set_style` — Apply one or more existing styles (combo classes)
- `set_link` — Set link on Button/TextLink/LinkBlock
- `set_image_asset` — Set image on Image element (needs valid `asset_id`)
- `set_heading_level` — Set h1-h6 level

#### `element_builder`
- Create new elements by type
- After creation, use `element_tool > select_element` to inspect/modify
- **Cannot create Collection Lists** — must do manually in Designer

#### `style_tool`
- `create_style` — Create new style; pass `parent_style_name` for combo classes
- `update_style` — Update properties; defaults to main breakpoint, noPseudo
- `get_styles` — List existing styles (can return lots of data, use filters)

**Breakpoint cascade:**
| Breakpoint | Applies to |
|------------|-----------|
| `xxl` (1920px) | Screens ≥ 1920px |
| `xl` (1440px) | Screens ≥ 1440px |
| `large` (1280px) | Screens ≥ 1280px |
| `main` | All devices (unless overridden) |
| `medium` (tablet) | Screens ≤ 991px |
| `small` (mobile landscape) | Screens ≤ 767px |
| `tiny` (mobile portrait) | Screens ≤ 478px |

#### `variable_tool`
- `create_variable_collection` / `get_variable_collections`
- `create_variable_mode` — Modes within a collection
- `create_color_variable` / `create_size_variable` / `create_number_variable` / `create_percentage_variable` / `create_font_family_variable`
- `update_*_variable` — Update any variable type
- `get_variables` — Retrieve variables (use filters)
- Variables function like CSS custom properties

#### `de_component_tool`
- `get_all_components` — List all components
- `transform_element_to_component` — Convert element to component
- `insert_component_instance` — Add component instance to page
- `open_component_view` / `close_component_view` — Enter/exit component editing
- `check_if_inside_component_view` — Check editing context
- `rename_component` — Change component name

---

## CMS Workflow

### Complete Lifecycle
```
Create Collection → Add Fields → Create Items → Publish Items
                                    ↓
                          (Draft or Live)
```

### 1. Create Collection
```json
{
  "displayName": "Blog Posts",
  "singularName": "Blog Post",
  "slug": "blog-posts"
}
```

### 2. Add Fields

**Static fields** (text, number, date):
```json
{
  "displayName": "Title",
  "slug": "title",
  "fieldType": "text",
  "isRequired": true,
  "isUnique": true
}
```

**Option fields** (predefined choices):
```json
{
  "displayName": "Category",
  "slug": "category",
  "options": ["News", "Tutorial", "Case Study"],
  "isRequired": true
}
```

**Reference fields** (relationships):
```json
{
  "displayName": "Author",
  "slug": "author",
  "referencedCollectionId": "AUTHOR_COLLECTION_ID",
  "isRequired": true
}
```

### 3. Create Items

**Draft item** (`collections_items_create_item`):
```json
{
  "fieldData": {
    "name": "Item Name",
    "slug": "item-name",
    "description": "Item description"
  }
}
```

**Live item** (`collections_items_create_item_live`) — same structure, publishes immediately.

**Key:** `fieldData` keys must match field slugs defined in the collection.

### 4. Update Items

**Draft update** (`collections_items_update_items`):
```json
{
  "isDraft": true,
  "fieldData": {
    "name": "Updated Name"
  }
}
```

**Live update** (`collections_items_update_items_live`) — updates and publishes in one step.

### 5. Publish Items
```json
{
  "itemIds": ["ITEM_ID_1", "ITEM_ID_2"]
}
```

### Item States

| Status | `lastPublished` | `isDraft` | Description |
|--------|----------------|-----------|-------------|
| Published | exists | `false` | Live and visible |
| Draft Changes | exists | `true` | Live with unpublished changes |
| Draft | `null` | `true` | Never published |
| Queued | `null` | `false` | Will publish on next site-wide publish |

---

## Tool Usage Guidelines

### General Rules
- Data Tools = REST API calls; Designer Tools = UI tools. Use the correct one.
- **No CSS shorthand.** Use longhand: `margin-top`, `padding-left`, `border-width` (not `margin`, `padding`, `border`)
- Don't assume site ID — pass it explicitly
- Always plan actions before calling tools
- After creating/updating an element, it's NOT auto-selected — use `element_tool > select_element`
- Reuse existing styles unless user explicitly wants new ones

### Element Creation Rules
1. Create styles FIRST if you plan to apply them during element creation
2. Plan out actions before calling `element_builder`
3. After creation, use `element_tool > select_element` to inspect/modify
4. Only Container, Section, DivBlock, and some valid DOM elements can have children

### Context Awareness
- `create_page` auto-switches to the new page
- `open_component_view` changes editing context — subsequent element ops affect the component, not the page
- Always verify context with `get_current_page` or `check_if_inside_component_view` before operations

---

## Publishing

### Staging vs Live
- **Staging:** Draft content, preview-only, not visible on live site
- **Live:** Published and visible to visitors
- A live item can have staged changes that don't affect the published version

### Publishing Methods

**Publish specific CMS items:**
```
collections_items_publish_items → pass itemIds array
```

**Publish entire site (to staging subdomain only):**
```
sites_publish → publishToWebflowSubdomain: true, customDomains: []
```

**Publish to production:**
```
sites_publish → publishToWebflowSubdomain: true, customDomains: ["domain_id_1", "domain_id_2"]
```

**Rate limiting:** ~1 minute cooldown between publishes.

---

## Known Limitations

1. **Body element** cannot have styles applied directly — wrap content in a Section
2. **Publishing** has aggressive rate limiting (~1 min cooldown)
3. **Designer API** requires foreground browser tab with Bridge App connected
4. **`element_builder`** cannot create Collection Lists — manual Designer work required
5. **MCP snapshot tool** renders at ~300px width regardless of container size
6. **Designer Pages tool** cannot modify existing page structure, only create new pages; no deletion (use Data API)
7. **Components:** Cannot edit nested components directly; limited property configuration
8. **`element_builder`** times out after ~35 minutes of sustained use (~50 calls)

---

## Adelaide-Specific Details

### IDs
- **Site ID:** `691d06adc60866495ed99c9e`
- **Workspace ID:** `691d05e3b57d2d3754b22b61`

### Custom Domains
- `adelaidenj.com` (ID: `695b136d01f7dfdad347433c`)
- `www.adelaidenj.com` (ID: `695b136c01f7dfdad3474336`)

### Designer URL
- Base: `https://adelaide-2713ba.design.webflow.com`
- With Bridge App: append `?app=dc8209c65e3ec02254d15275ca056539c89f6d15741893a0adf29ad6f381eb99`

### Design System
- **Heading font:** Saint Andrews Queen Adelaide Stanneqn
- **Body font:** Montserrat
- **Primary text:** #35190d
- **Background:** #e6e2de
- **Tan accent:** rgba(155, 99, 43, 0.06)
- **433 Webflow classes** (as of launch)

### Connected Apps
- WhaleSync 2-Way Sync (Google Sheets ↔ CMS)
- Webflow MCP Bridge App

### Webhooks Active
- `collection_item_changed` → Make.com
- `site_publish`, `collection_item_created`, `collection_item_changed`, `collection_item_deleted`, `collection_item_unpublished` → WhaleSync

### MCP Token
- Token name: `claude-mcp2` (Site API token)
- Generated: 2026-03-24 by John O'Conner
- Scopes: Full read+write (Assets, CMS, Comments, Components, Custom Code, Pages, Sites, Site config, User Accounts, Workspace) + read-only (App Subscriptions, Authorized user, Branches, Site activity)

---

## Reference Links
- [Webflow Data API Structure](https://developers.webflow.com/data/reference/structure-1)
- [MCP Data Tools — Sites](https://developers.webflow.com/mcp/reference/data/sites)
- [MCP Data Tools — CMS](https://developers.webflow.com/mcp/reference/data/cms)
- [MCP Data Tools — CMS Collections](https://developers.webflow.com/mcp/reference/data/cms/collections)
- [MCP Data Tools — CMS Fields](https://developers.webflow.com/mcp/reference/data/cms/fields)
- [MCP Data Tools — CMS Items](https://developers.webflow.com/mcp/reference/data/cms/items)
- [MCP Designer Tools — Pages](https://developers.webflow.com/mcp/v1.0.0-beta/reference/designer/pages)
- [MCP Designer Tools — Components](https://developers.webflow.com/mcp/v1.0.0-beta/reference/designer/components)
- [CMS Publishing Guide](https://developers.webflow.com/data/docs/working-with-the-cms/publishing)
- [Authentication Guide](https://developers.webflow.com/data/reference/authentication)
- [Site Token Docs](https://developers.webflow.com/data/reference/authentication/site-token)
- [Webflow MCP FAQs](https://developers.webflow.com/mcp/faqs)
- [MCP Getting Started](https://developers.webflow.com/mcp/reference/getting-started)
- [GitHub — webflow/mcp-server](https://github.com/webflow/mcp-server)
