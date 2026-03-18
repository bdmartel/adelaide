# Adelaide — Implementation Spec from Kristen Call
**Date:** March 18, 2026 | **Source:** Zoom screen share + InDesign walkthrough
**Participants:** Kristen Cahill (Shebang Studio), Ben Martel
**PDF:** Adelaide_WEB_MenuAdditions_R1_02.pdf
**Transcript:** kristen-call-transcript.md | **Frames:** call-frames/

---

## 1. WEBSITE — Desktop Navigation

**Current:** MENU | HOURS | LOCATION | PRIVATE EVENTS | CONTACT
**New behavior:**

- "Menu" stays in nav, lighter weight (current state)
- **Hover:** Menu text bolds
- **Click:** Drops down two sub-links — **Food** and **Beverage** (no "s")
- **Click Menu again:** Hides the dropdown
- **Active state:** When on Food or Beverage page, that sub-link is bold AND "Menu" parent is also bold
- Food links to existing today's menu page (no change to that page URL)
- Beverage links to new beverage page (see Section 2)

> *[00:28–02:30] — Kristen walks through the click/hover/bold behavior*
> *[frame-00-30.jpg] — Current mobile nav showing existing MENU item*

---

## 2. WEBSITE — Mobile Navigation

**Current:** RESERVATIONS | MENU | HOURS/LOCATION | PRIVATE EVENTS | CONTACT
**New:** Replace "Menu" with two separate items: **Food** and **Beverage**

- No dropdown on mobile — direct links
- This is a "for now" solution; client knows if they add brunch etc., they may revert to "Menu" → landing page pattern
- Client explicitly wants "Beverage" visible immediately in mobile nav — they want customers to know they serve alcohol

> *[04:07–05:14] — Kristen explains mobile rationale*
> *[frame-04-17.jpg] — Original mobile nav labeled "original"*

---

## 3. WEBSITE — New Beverage Page

Create a new page, designed identically to the existing food/today's menu page, with this content structure:

```
"Beverage" (script heading — same script font as Adelaide brand)

COCKTAILS (underlined category heading)
  Addy Spritz — Oka Gin, St-Germain, Lillet Rosé, Bitters, Topo Chico
  Stoned Ape — Power's Irish Whiskey, Crème de Banane, Absinthe Ordinaire
  Concord Cosmo — Wodka Vodka, Italicus, Concord Grape, Lime
  Shirley — Beefeater, Heering Cherry, St-Germain, Meyer Lemono
  Espresso Martini — Espresso, Vodka, Carpano Bianco, Cynar, Almond Foam
  Olive Oil Martini — Partanna OO washed Gin, Carpano Bianco, Olive Jam Olives
  Negroni — Oka Gin, Caffo Red Bitter, Crème de Noyaux
  Margarita — Del Maguey Vida, Cointreau, Lillet Blanc, Lime

WINES BY THE GLASS (underlined category heading)
  "white" (script font sub-heading)
    Ashbrook Estate Chardonnay 2023 — Margaret River, AU
    Eastern Daylight Dry Riesling 2023 — Finger Lakes, NY
    Von Winning "SB II Trocken" Sauvignon Blanc 2024 — Pfalz, DE
    Domaine Les Enfants Sauvages Muscat 2023 — Côtes Catalanes, FR

  "sparkling" (script font sub-heading)
    Contessa "1925" Prosecco — Veneto, IT - NV

  "red" (script font sub-heading)
    Bonny Doon "Le Cigare Orange" 2023 — Central Coast, CA
    Manzone Giovanni "Le Ciliegie" Barbera 2023 — Alba, Piedmont, IT
    Tatomer Pinot Noir 2023 — Santa Barbara County, CA
    Ravines Cabernet Franc 2023 — Finger Lakes, NY
    Januik Cabernet Sauvignon 2022 — Columbia Valley, WA

BEER (underlined category heading)
  Head High — IPA - Kane
  The Crisp — Pilsner - SixPoint

*Corkage Fee — We welcome guests to bring their own special bottles
for a $50 corkage fee per 750ml bottle of wine not available on our wine list,
with a two-bottle maximum per party.
```

**Key details:**
- Script sub-headings (white, sparkling, red) use the Adelaide script font (Saint Andrews Queen Adelaide)
- Corkage Fee goes at the bottom, styled similar to the "seasonal desserts" footnote on current food page
- Food page update: Change "Drinks and seasonal desserts available in house" → just "Seasonal desserts are available" (since drinks now have their own page)
- All content synced from the same Google Sheets master list

> *[03:12–04:06] — Kristen describes beverage page structure*
> *[frame-03-25.jpg] — Beverage page zoomed: cocktails + wines by the glass*
> *[frame-03-45.jpg] — Full beverage page with corkage fee at bottom*

---

## 4. SPARKLING / ROSÉ TOGGLE (Cross-cutting concern)

Client wants the ability to switch the "Sparkling" wine category to "Sparkling / Rosé" — or have them as a combined category. This affects:
- The website beverage page
- The printed food menu
- The cocktail lounge menu
- The secondary beverage menu

**Implementation approach (Ben to solve):**
- In Google Sheets, provide a way for the client to toggle or type the category name
- Could be a dropdown, a separate cell they edit, or just a text field
- Kristen deferred this to Ben: "I'm going to let you sort that out"

> *[05:17–06:52] — Extended discussion about sparkling/rosé flexibility*
> *[frame-05-33.jpg] — Beverage page showing sparkling section*
> *[frame-08-44.jpg] — Food menu with "ability to rename >>>" annotation*

---

## 5. PRINT — Food Menu Updates

The printed food menu (portrait, 8.5x11) has small changes:

### 5a. Raw Disclaimer Repositioned
- Move "Consuming raw or undercooked meats..." disclaimer from the very bottom of the page to **bottom-left, below the food column**
- Should have MORE spacing above it than between regular menu items (it's a footnote, not a menu item)
- Should NOT feel like it's part of the last food item (e.g., ribeye)
- Labeled "raw >>>" in Kristen's annotations

### 5b. Sparkling/Rosé Category Option
- See Section 4 above

### 5c. Max SKU Counts
- Kristen has communicated max item counts to the client per category
- The current layout is at maximum capacity — can't go smaller font or tighter spacing
- Margins: .065" from left, .066" from center, .05" from right (visible in annotations)

> *[07:17–12:03] — Food menu walkthrough*
> *[frame-07-37.jpg] — Food menu showing repositioned "raw" and full layout*
> *[frame-08-44.jpg] — Annotations showing "ability to rename" + "raw" callouts*
> *[frame-10-49.jpg] — Margin measurements: .065" left, .066" center, .05" right*

---

## 6. PRINT — New Cocktail Lounge Menu

**Format:** Same size and template as the existing dessert menu (landscape, smaller than 8.5x11)

### Layout: Two Columns

**LEFT COLUMN — Wines by the Glass + Beer:**
```
WINES BY THE GLASS
  white (script)
    [same wines as food menu]
  sparkling (script)  ← or sparkling/rosé
    [same wines as food menu]
  red (script)
    [same wines as food menu]
BEER
  [same beers as food menu]
```

**RIGHT COLUMN — Cocktails + Light Bites:**
```
COCKTAILS
  Addy Spritz...
  Stoned Ape...
  [etc. — same cocktails as food menu right column]

LIGHT BITES
  Roasted Cauliflower — w. black fig spread & almonds (15)
  Crunchy Baby Eggplant — w. cherry tomato salsa (15)
  Summer Squash — over house-smoked ham, sheep's yogurt, shishito relish
    w. crunchy cornbread (17)
  Fennel Salad — w. grilled peaches, cucumber & basil vinegar (16)
```

**Key details:**
- Left column content is IDENTICAL to what's on the printed food menu (wine by the glass + beer)
- Right column cocktails are the same as on the food menu
- Light Bites is a NEW category — different from starters (Kristen used starter items as placeholders)
- Font sizes and line heights match the food menu
- BUT: spacing between major categories (cocktails → wines → beer → light bites) has MORE distance than on the food menu, because here they're distinct sections vs. being squeezed together
- The script font category heading + name-on-one-line, description-on-next-line format for cocktails (centered, not left-justified like on food menu)
- Raw disclaimer: NOT included now. Kristen will add when needed and bill separately.

> *[12:07–24:58] — Cocktail lounge menu walkthrough*
> *[frame-15-50.jpg] — Full cocktail lounge layout: two columns*
> *[frame-18-06.jpg] — Side-by-side: InDesign lounge + food menu PDF comparison*
> *[frame-18-23.jpg] — Highlighted matching content across menus*
> *[frame-22-00.jpg] — Spacing discussion between categories*
> *[frame-24-30.jpg] — File browser showing project structure + zoomed lounge layout*

---

## 7. PRINT — Secondary Beverage Menu (Book Format)

- Brown leather-bound book with brass button closures
- Multi-page (at least 5 pages)
- Kristen was about to walk through this but Zoom time expired at ~27:00
- She planned to call back on phone to finish
- File: ADELAIDE_SecBev_3Page (visible in her Finder)

**STATUS:** Incomplete walkthrough — needs follow-up from Kristen or review of PDF

> *[25:02–27:05] — Started showing secondary beverage, cut short*
> *[frame-25-13.jpg] — Leather book cover with "ADELAIDE" branding*

---

## 8. GOOGLE SHEETS — Sync Strategy

**Goal:** One master spreadsheet pushing to all outputs (web + all print menus)

**Key questions to solve:**
1. Can wine-by-the-glass content from one sheet source push to both the food menu print layout AND the cocktail lounge menu print layout?
2. Sparkling/Rosé toggle mechanism (see Section 4)
3. Light Bites: new category needed in the sheet — only appears on cocktail lounge menu
4. If single-source isn't possible, client is OK with copy-pasting between tabs

---

## 9. TIMELINE

- Client wants it ASAP (wait staff telling customers "we also have rosé" manually)
- No hard deadline
- Kristen to tell client: "working on it next week"
- **Target: by Tuesday March 24, 2026** — hopefully sooner

> *[26:04–26:57] — Timeline discussion*

---

## 10. FILES FROM KRISTEN

Visible in her project folder (frame-24-30.jpg):
```
06_MECHANICALS/
├── 01_FoodMenu_8.5x11
├── 02_Dessert_11x8.5
├── 03_vendor options
├── 03_Second...rage_8.5x11  (Secondary Beverage)
├── ADELAIDE_F...11_01.indd
├── ADELAIDE_F...x11_01.pdf
├── ADELAIDE_CocktailLounge_11x8.5_01.indd
07_RawDisclaimer/
08_SecondaryBev_3Page/
09_CocktailLounge/
```

PDFs sent/to be sent:
- Adelaide_WEB_MenuAdditions_R1_02.pdf (website mockups — in this call)
- ADELAIDE_FoodMenu_8.5x11_02.pdf (food menu print)
- ADELAIDE_CocktailLounge (cocktail lounge print)
- ADELAIDE_SecBev_3Page (secondary beverage book — walkthrough incomplete)

---

## IMPLEMENTATION ORDER (Recommended)

1. **Website nav changes** (desktop dropdown + mobile split) — highest visibility
2. **New beverage web page** — builds on nav change
3. **Food page text update** (remove drinks mention from seasonal desserts line)
4. **Google Sheets** — add sparkling/rosé toggle + light bites category
5. **Print food menu** — reposition raw disclaimer
6. **Print cocktail lounge menu** — new template based on dessert menu
7. **Print secondary beverage** — pending Kristen's complete walkthrough
