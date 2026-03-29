# Adelaide Menu Additions — Task Tracker
**Created:** 2026-03-19 | **Target:** 2026-03-24 | **Last updated:** 2026-03-22

---

## Status Key
- `[ ]` — Not started
- `[~]` — In progress
- `[?]` — Blocked / needs answer
- `[x]` — Done
- `[!]` — Verified (reviewed by Ben or Kristen)

---

## Phase 0: Resolve Blockers

### 0.1 — Confirm pricing on web beverage page
- **Status:** `[x]`
- **Owner:** Ben
- **Answer:** No prices on web beverage page. Live food page shows zero prices on any item — this is intentional (upscale pattern). Mockup is consistent: no prices except one stray `(23/115)` on Prosecco (copy-paste artifact from print). Print menus show prices; web does not.
- **Impact:** No price-hiding mechanism needed. CMS template simply omits price field, same as food page.
- **Resolved:** 2026-03-22

### 0.2 — Confirm URL structure for beverage page
- **Status:** `[x]`
- **Owner:** Ben
- **Answer:** Root-level pages (CMS collection occupies `/menu/` path):
  - `/beverage` — new public beverage page
  - `/food` — public food page (moved from `/todays-menu`)
  - `/resources/printable-menus/...` — print-only views, unchanged
- **Impact:** Food page URL change requires 301 redirect from old path → `/food`. All nav links must point to new paths.
- **Resolved:** 2026-03-22 | **Slugs set in Webflow:** 2026-03-22

### 0.3 — Cost confirmation from client
- **Status:** `[x]`
- **Owner:** Kristen → client
- **Answer:** Client approved. Total budget: **$1,500**.
- **Resolved:** 2026-03-22

### 0.4 — SecBev v03 actual content
- **Status:** `[?]`
- **Owner:** Kristen
- **Context:** Today's revised `ADELAIDE_SecBev_3Page_03.pdf` only rendered title/cover/divider pages. Actual menu layouts didn't come through. InDesign source files incoming separately.
- **Impact:** Blocks print work only. Does NOT block web work.
- **Notes:**

---

## Phase 1: Beverage Page Build (Webflow — staging only)

### 1.1 — Upload SVG assets to Webflow
- **Status:** `[ ]`
- **Owner:** Claude + Ben
- **Assets to upload:**
  - [ ] `Header_Brown_Beverage.svg` — script "Beverage" page header
  - [ ] `Underline__Brown_cocktails.svg` — COCKTAILS section underline
  - [ ] `Underline__Brown_winesbytheglass.svg` — WINES BY THE GLASS underline
  - [ ] `Underline_Brown_beer.svg` — BEER section underline
  - [ ] `Wine_white.svg` — "white" script sub-heading
  - [ ] `Wine_sparkling.svg` — "sparkling" script sub-heading
  - [ ] `Wine_red.svg` — "red" script sub-heading
  - [ ] `Wine_rose.svg` — "rosé" (for toggle)
  - [ ] `Wine_sparklingrose.svg` — "sparkling rosé" (for toggle)
- **Notes:**

### 1.2 — Create beverage page
- **Status:** `[ ]`
- **Owner:** Claude + Ben
- **Spec:** Clone food page structure. Same background (#e6e2de), same typography hierarchy, same footer, same nav.
- **URL:** `/beverage`
- **Depends on:** 0.2 ✓ | **Slug set in Webflow**
- **Notes:**

### 1.3 — Build beverage page content
- **Status:** `[ ]`
- **Owner:** Claude + Ben
- **Content structure:**
  - [ ] "Beverage" script header (SVG from 1.1)
  - [ ] COCKTAILS section (underline + 8 cocktails)
  - [ ] WINES BY THE GLASS section (underline + white/sparkling/red sub-headings + wines)
  - [ ] BEER section (underline + 2 beers)
  - [ ] Corkage fee footnote
- **Depends on:** 1.1, 1.2
- **Content reference:**

```
COCKTAILS
  Addy Spritz — Oka Gin, St-Germain, Lillet Rosé, Bitters, Topo Chico
  Stoned Ape — Power's Irish Whiskey, Crème de Banane, Absinthe Ordinaire
  Concord Cosmo — Wodka Vodka, Italicus, Concord Grape, Lime
  Shirley — Beefeater, Heering Cherry, St-Germain, Meyer Lemono
  Espresso Martini — Espresso, Vodka, Carpano Bianco, Cynar, Almond Foam
  Olive Oil Martini — Partanna OO washed Gin, Carpano Bianco, Olive Jam Olives
  Negroni — Oka Gin, Caffo Red Bitter, Crème de Noyaux
  Margarita — Del Maguey Vida, Cointreau, Lillet Blanc, Lime

WINES BY THE GLASS
  white
    Ashbrook Estate Chardonnay 2023 — Margaret River, AU
    Eastern Daylight Dry Riesling 2023 — Finger Lakes, NY
    Von Winning "SB II Trocken" Sauvignon Blanc 2024 — Pfalz, DE
    Domaine Les Enfants Sauvages Muscat 2023 — Côtes Catalanes, FR
  sparkling
    Contessa "1925" Prosecco — Veneto, IT · NV
  red
    Bonny Doon "Le Cigare Orange" 2023 — Central Coast, CA
    Manzone Giovanni "Le Ciliegie" Barbera 2023 — Alba, Piedmont, IT
    Tatomer Pinot Noir 2023 — Santa Barbara County, CA
    Ravines Cabernet Franc 2023 — Finger Lakes, NY
    Januik Cabernet Sauvignon 2022 — Columbia Valley, WA

BEER
  Head High IPA — Kane
  The Crisp Pilsner — SixPoint

*Corkage Fee — We welcome guests to bring their own special bottles
for a $50 corkage fee per 750ml bottle of wine not available on our
wine list, with a two-bottle maximum per party.
```
<!-- NOTE: Prices exist in print menus but are intentionally excluded from web.
   See 0.1 resolution. Print prices preserved in call spec Section 3. -->

### 1.4 — Publish beverage page to staging
- **Status:** `[ ]`
- **Owner:** Claude
- **Rule:** `publishToWebflowSubdomain: true, customDomains: []` — NEVER live.
- **Depends on:** 1.3
- **Notes:**

### 1.5 — Review beverage page on staging
- **Status:** `[ ]`
- **Owner:** Ben
- **Checklist:**
  - [ ] Layout matches Kristen's mockup (page 8-9 of WEB_MenuAdditions PDF)
  - [ ] Typography correct (Montserrat body, script headings)
  - [ ] Background matches food page
  - [ ] Responsive: desktop, tablet, mobile
  - [ ] All content accurate (names, descriptions, prices if applicable)
  - [ ] Corkage footnote present
  - [ ] Footer matches food page
- **Notes:**

---

## Phase 2: Navigation & URL Changes (Webflow — staging only)

### 2.0 — Move food page to `/food`
- **Status:** `[~]`
- **Owner:** Claude + Ben
- **Spec:**
  - ~~Change food page slug~~ ✓ Done — slug set to `food`
  - Set up 301 redirect: `/todays-menu` → `/food` (and `/rev/todays-menu` if applicable)
  - Verify redirect works on staging before proceeding
- **Impact:** Existing links (Google index, RESY, bookmarks) must not break.
- **Notes:** Slug changed 2026-03-22. Redirect still needed before go-live.

### 2.1 — Desktop nav: MENU dropdown
- **Status:** `[ ]`
- **Owner:** Claude + Ben
- **Spec:**
  - MENU stays in nav bar (lighter weight default)
  - Hover: MENU text bolds
  - Click: dropdown reveals FOOD + BEVERAGE sub-links
  - Click MENU again: hides dropdown
  - Active state: when on Food or Beverage page, that sub-link is bold AND "Menu" parent is bold
  - FOOD links to `/food`
  - BEVERAGE links to `/beverage`
- **Depends on:** 1.2, 2.0
- **Notes:**

### 2.2 — Mobile nav: FOOD + BEVERAGE buttons
- **Status:** `[ ]`
- **Owner:** Claude + Ben
- **Spec:**
  - Replace single MENU button with two buttons: FOOD and BEVERAGE
  - Direct links, no dropdown
  - Same button style as existing nav items (bordered rectangles)
  - Order: RESERVATIONS, FOOD, BEVERAGE, HOURS/LOCATION, PRIVATE EVENTS, CONTACT
- **Depends on:** 1.2
- **Notes:**

### 2.3 — Test all nav states
- **Status:** `[ ]`
- **Owner:** Ben
- **Checklist:**
  - [ ] Desktop: default state (MENU not bold)
  - [ ] Desktop: hover on MENU (bolds)
  - [ ] Desktop: click MENU (dropdown appears with FOOD + BEVERAGE)
  - [ ] Desktop: click MENU again (dropdown hides)
  - [ ] Desktop: on food page (FOOD bold, MENU bold)
  - [ ] Desktop: on beverage page (BEVERAGE bold, MENU bold)
  - [ ] Desktop: on other page (no bold on MENU or sub-links)
  - [ ] Mobile: FOOD and BEVERAGE buttons present
  - [ ] Mobile: FOOD links to food page
  - [ ] Mobile: BEVERAGE links to beverage page
  - [ ] Mobile: button styling matches existing nav buttons
- **Notes:**

### 2.4 — Publish nav changes to staging
- **Status:** `[ ]`
- **Owner:** Claude
- **Depends on:** 2.1, 2.2
- **Notes:**

---

## Phase 3: Food Page Update

### 3.1 — Update food page footnote
- **Status:** `[ ]`
- **Owner:** Claude + Ben
- **Change:** Remove drinks mention from seasonal desserts line.
  - **Before:** "Drinks and seasonal desserts available in house" (or similar)
  - **After:** "*Seasonal Desserts available in-house"
- **Notes:**

### 3.2 — Publish food page update to staging
- **Status:** `[ ]`
- **Owner:** Claude
- **Notes:**

---

## Phase 4: Google Sheets Integration

### 4.1 — Audit current master sheet
- **Status:** `[ ]`
- **Owner:** Ben
- **Check:** Confirm cocktails, wines by the glass, beer categories exist in "Adelaide Menus (Master List)" sheet.
- **Notes:**

### 4.2 — Design sparkling/rosé toggle
- **Status:** `[ ]`
- **Owner:** Ben
- **Context:** Kristen deferred this to Ben. Client wants ability to switch "Sparkling" to "Sparkling / Rosé" or combined. Affects web + all print.
- **Options:**
  - A) Editable cell in sheet where client types category name
  - B) Dropdown with preset options (Sparkling, Rosé, Sparkling Rosé)
  - C) Separate rows that can be shown/hidden
- **SVGs available:** `Wine_sparkling.svg`, `Wine_rose.svg`, `Wine_sparklingrose.svg`
- **Notes:**

### 4.3 — Connect beverage page to CMS
- **Status:** `[ ]`
- **Owner:** Claude + Ben
- **Context:** If beverage content should be CMS-driven like the food page, need to bind page elements to collection fields.
- **Depends on:** 4.1
- **Notes:**

### 4.4 — Test sheet → web sync
- **Status:** `[ ]`
- **Owner:** Ben
- **Checklist:**
  - [ ] Change a cocktail name in sheet → appears on staging
  - [ ] Change a wine in sheet → appears on staging
  - [ ] Toggle sparkling/rosé → correct label appears
- **Notes:**

---

## Phase 5: Print Menus (separate workstream, not Webflow)

### 5.1 — Food menu: reposition raw disclaimer
- **Status:** `[ ]`
- **Owner:** Ben
- **Spec:** Move "Consuming raw or undercooked meats..." from very bottom to bottom-left below food column. More spacing above than between regular items. Should NOT feel like part of last food item.
- **Reference:** `ADELAIDE_FoodMenu_8.5x11_02.pdf` page 2 (annotated version)
- **Notes:**

### 5.2 — Cocktail lounge menu: confirm layout
- **Status:** `[ ]`
- **Owner:** Kristen (design) + Ben (print template)
- **Reference:** `ADELAIDE_CocktailLounge_11x8.5_02.pdf`
- **Notes:** Same format as existing dessert menu (landscape). Two columns: wines+beer left, cocktails+light bites right.

### 5.3 — Secondary beverage menu: get full content
- **Status:** `[x]`
- **Owner:** Kristen
- **Context:** Full content confirmed in `ADELAIDE_SecBev_3Page_03.pdf` (5 pages). Page 4: non-alcoholic side (cocktails, wines, beer, soft drinks). Page 5: wines by the bottle + neat/on the rocks spirits (two-column layout).
- **Resolved:** 2026-03-25
- **Notes:**

### 5.4 — Add Light Bites category to Google Sheets
- **Status:** `[ ]`
- **Owner:** Ben
- **Context:** Light Bites appears on cocktail lounge print menu only (not web). Confirm if this needs a sheet category or is managed separately.
- **Items (from cocktail lounge PDF):**
  - Roasted Cauliflower w. black fig spread & almonds (15)
  - Crunchy Baby Eggplant w. cherry tomato salsa (15)
  - Summer Squash over house-smoked ham, sheep's yogurt, shishito relish w. crunchy cornbread (17)
  - Fennel Salad w. grilled peaches, cucumber & basil vinegar (16)
- **Note:** These are identical to the Starters on the food menu. May just be a label change.
- **Notes:**

---

## Phase 6: Go Live

### 6.1 — Ben staging review
- **Status:** `[ ]`
- **Owner:** Ben
- **Checklist:**
  - [ ] Beverage page complete and accurate
  - [ ] Nav works on desktop (dropdown behavior)
  - [ ] Nav works on mobile (direct links)
  - [ ] Food page footnote updated
  - [ ] All responsive breakpoints look correct
  - [ ] Google Sheets sync working
- **Notes:**

### 6.2 — Kristen design review
- **Status:** `[ ]`
- **Owner:** Kristen
- **Send staging link for review**
- **Notes:**

### 6.3 — Publish to production
- **Status:** `[ ]`
- **Owner:** Ben (decision) + Claude (execution)
- **Command:** Publish to staging + custom domains
- **Depends on:** 6.1, 6.2
- **Notes:**

### 6.4 — Post-launch smoke test
- **Status:** `[ ]`
- **Owner:** Ben
- **Checklist:**
  - [ ] adelaidenj.com loads correctly
  - [ ] Desktop nav dropdown works
  - [ ] Mobile nav shows FOOD + BEVERAGE
  - [ ] Beverage page content correct
  - [ ] Food page footnote updated
  - [ ] All links functional
  - [ ] No broken pages/404s
- **Notes:**

---

## Files Reference

```
adelaide/docs/
├── Adelaide_WEB_MenuAdditions_R1_02.pdf   — Website mockup spec (13pp)
├── ADELAIDE_CocktailLounge_11x8.5_02.pdf  — Print cocktail lounge (3pp)
├── ADELAIDE_FoodMenu_8.5x11_02.pdf        — Print food menu (2pp)
├── ADELAIDE_SecBev_3Page_03.pdf            — Print sec. beverage v03 (3pp)
├── indesigns/
│   ├── Header_Brown_Beverage (.ai/.png/.svg)
│   ├── Underline__Brown_cocktails (.ai/.png/.svg)
│   ├── Underline__Brown_winesbytheglass (.ai/.png/.svg)
│   ├── Underline_Brown_beer (.ai/.png/.svg)
│   ├── Wine_white (.ai/.png/.svg)
│   ├── Wine_sparkling (.ai/.png/.svg)
│   ├── Wine_red (.ai/.png/.svg)
│   ├── Wine_rose (.ai/.png/.svg)
│   └── Wine_sparklingrose (.ai/.png/.svg)
├── kristen-call-spec-2026-03-18.md        — Detailed spec from Zoom call
├── adelaide-implementation-roadmap.md     — Webflow class cleanup (separate)
└── adelaide-quick-reference.md            — Variables/naming reference
```

---

## Changelog

| Date | Phase.Task | Action |
|---|---|---|
| 2026-03-19 | — | Task tracker created. All source materials gathered and reviewed. |
| 2026-03-22 | 0.1 | Resolved: no prices on web (confirmed via live food page + mockup + call spec). Stripped prices from 1.3 content ref. |
| 2026-03-22 | 0.2 | Resolved: `/menu/beverage` + `/menu/food` (food page moving from `/rev/todays-menu`). Added task 2.0 for redirect. |
| 2026-03-22 | 0.3 | Resolved: client approved $1,500 total budget. |
| 2026-03-22 | 1.1 | All 9 SVG assets uploaded to Webflow. |
| 2026-03-22 | 1.2 | Beverage page slug set to `/beverage`. Food page slug set to `/food`. |
| 2026-03-22 | 1.3 | Header SVG wired, section underlines wired (combo classes), wine sub-headings styled. Menu items still needed (CMS Collection Lists). |
| 2026-03-23 | 1.3 | Cocktails CMS Collection List wired (Sheet1, filtered COCKTAILS, 8 items). New bev-* classes created (no shared classes modified). |
| 2026-03-23 | 1.3 | Wine sub-headings converted from SVG images to live script font text (Saint Andrews Queen Adelaide). |
| 2026-03-23 | 1.3 | Header fixed: bev-header combo class (220px, centered). bev-stacked combo class (flex column). bev-full-width (content 100%). |
| 2026-03-23 | — | NEXT UP: Clone dessert print page → new cocktail lounge print menu (/resources/printable-menus/cocktail-lounge). Then wire remaining 4 beverage sections. |
