# Webflow MCP Local Setup Guide
**Created:** 2026-03-23 | **For:** Adelaide project + all future Webflow work

---

## Why Local > Remote

| | Remote (current) | Local (target) |
|---|---|---|
| Auth | OAuth browser popup, expires, causes loops | Direct API token in config, no popups |
| Reliability | Depends on mcp-remote package + Webflow SSE | Direct connection, one less moving part |
| Speed | Round-trip to mcp.webflow.com | Local process, faster tool calls |
| Designer tools | Needs Bridge App | Still needs Bridge App (same either way) |

## Prerequisites

- Node.js 22.3.0+ (`node -v` to check)
- NPM (`npm -v` to check)
- Webflow account with site access

## Step 1: Generate Webflow API Token

1. Go to: https://developers.webflow.com/data/reference/token/authorized-by
2. Log in with your Webflow account
3. Generate a token — copy it from the Request Generator
4. **Save this token securely** — you'll need it for the config

Alternative: Webflow Dashboard → Site Settings → Apps & Integrations → Generate API Token

## Step 2: Remove Current Remote MCP

```bash
claude mcp remove webflow
```

Also clean up the stale OAuth cache:
```bash
rm -rf ~/.mcp-auth
```

## Step 3: Add Local MCP Server

```bash
claude mcp add webflow -e WEBFLOW_TOKEN=YOUR_TOKEN_HERE -- npx -y webflow-mcp-server@latest
```

This tells Claude Code to:
- Start a local `webflow-mcp-server` process
- Pass the API token via environment variable
- No OAuth, no browser popups, no token expiry loops

## Step 4: Verify Connection

Start a new Claude Code session and run:
```
claude mcp list
```

Should show:
```
webflow: npx -y webflow-mcp-server@latest - ✓ Connected
```

Then test a tool call (e.g., list sites) to confirm data access works.

## Step 5: Designer Tools (Bridge App)

The local MCP handles Data API (CMS, pages, sites, publishing). For Designer tools (visual canvas editing, elements, styles), you still need the Bridge App:

1. Open site in Webflow Designer
2. Open Apps panel (press `E`)
3. Launch "Webflow MCP Bridge App"
4. Wait for "Connected to the MCP server"

**New with local MCP:** If the Bridge App prompts for a connection URL, the local server provides it. Call the `get_designer_app_connection_info` tool and paste the returned `http://localhost:<port>` URL into the Bridge App.

## Step 6: Confirm Everything Works

Test these in order:
1. **Data API:** Ask Claude to list sites or CMS collections
2. **Designer:** Ask Claude to get current page or take a snapshot
3. **CMS write:** Ask Claude to list collection items

## Troubleshooting

### Token not working
- Regenerate at https://developers.webflow.com/data/reference/token/authorized-by
- Make sure the token has access to the Adelaide site

### Server won't start
```bash
npm cache clean --force
node -v  # must be 22.3.0+
```

### Bridge App won't connect
- Ensure Designer tab is active (foreground, not minimized)
- Call `get_designer_app_connection_info` and paste the URL into the Bridge App

### Reset everything
```bash
claude mcp remove webflow
rm -rf ~/.mcp-auth
npm cache clean --force
# Then re-add per Step 3
```

---

## Adelaide-Specific Notes

- Site ID: `691d06adc60866495ed99c9e`
- Site name: Adelaide
- Designer launch URL: `https://adelaide-2713ba.design.webflow.com`
- Bridge App URL: append `?app=dc8209c65e3ec02254d15275ca056539c89f6d15741893a0adf29ad6f381eb99`
