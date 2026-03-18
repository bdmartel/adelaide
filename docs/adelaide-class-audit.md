# Adelaide Restaurant - Class & Variable Audit
## Comprehensive Cleanup Guide

**Site:** Adelaide SANDBOXED  
**Total Classes:** 433  
**Total Variables:** 37 (28 original + 9 new)  
**Audit Date:** February 11, 2026

---

## EXECUTIVE SUMMARY

Your class system has significant bloat from rapid development. Main issues:
- **30+ auto-generated class names** (`Div Block 67`, `Image 12`)
- **Massive duplication** in combo class variations
- **23 "centered page" variations** (should be 2-3 max)
- **12 "our location" variations** (should be 1-2 max)
- **30+ "foodmenu" combo classes** (consolidation opportunity)
- **Inconsistent naming** mixing BEM-style, descriptive, and auto-gen

**Good news:** Variables are well-started for typography. Colors and spacing need extension.

---

## PHASE 1: VARIABLES (Completed ✅)

### New Variables Created
```
SPACING SCALE:
├── space-xs: 0.25rem (4px)
├── space-sm: 0.5rem (8px)
├── space-md: 1rem (16px)
├── space-lg: 1.5rem (24px)
└── space-xl: 2rem (32px)

COLORS:
└── border-subtle: hsla(345, 6.06%, 12.94%, 0.53)

TYPOGRAPHY:
├── weight-light: 300
└── weight-semibold: 600

UTILITIES:
└── bg-transparent: transparent
```

### Existing Variables (Keep)
```
COLORS:
├── dark: #35190d (primary text)
├── backgroundColor: #e6e2de
├── tanbg: rgba(155, 99, 43, 0.06)
├── dark-fader: rgba(53, 25, 13, 0.54)
├── colorBlue: hsla(217, 82.57%, 30.02%, 1.00)
├── colorGray: #6b7280
└── colorWhite: #FFFFFF

FONTS:
├── fontBody: Montserrat
├── fontScript: Saint Andrews Queen Adelaide Stanneqn
├── font8px: 0.5rem
├── font9px: 0.5625rem
├── font12px: 0.75rem
├── font14px: 0.875rem
├── font15px: 0.9375rem
├── font16px: 1rem
├── font18px: 1.125rem
├── font24px: 1.5rem
└── font56px: 3.5rem

WEIGHTS:
├── weight-regular: 400
├── weight-bold: 700
└── Link Weight: 600

SPACING:
├── distance from nav: 4rem
├── footeroffset: -6vh
├── container-max-width: 800px
└── maxcontw: 39.6875rem
```

### Variable Adoption Tasks

**Priority: Replace hardcoded values with variables**

1. **Border Colors**
   - Find all: `border-color: hsla(345, 6.06%, 12.94%, 0.53)`
   - Replace with: `border-subtle` variable

2. **Margins/Padding**
   - `margin-bottom: 10px` → use `space-sm` or `space-md`
   - `margin-bottom: 20px` → use `space-lg`
   - `margin-bottom: 30px` → use `space-xl`

3. **Font Weights**
   - `font-weight: 300` → use `weight-light`
   - `font-weight: 600` → use `weight-semibold`

4. **Backgrounds**
   - `background-color: transparent` → use `bg-transparent`

---

## PHASE 2: HIGH-PRIORITY CLASS CONSOLIDATION

### Problem 1: "Centered Page" Explosion 💥
**23 variations**: `centered page 2` through `centered page 24`

**What they are:** Different margin/padding configurations for centered content areas.

**Consolidation Strategy:**
```
KEEP THESE 3:
├── centered-page (base: max-width, auto margins)
├── centered-page--narrow (width: 280-380px)
└── centered-page--wide (max-width: 900px)

DELETE: centered page 3-24
```

**How to consolidate:**
1. Create 3 new classes with consistent naming
2. Search & replace in Designer:
   - Small width variants → `centered-page--narrow`
   - Large width variants → `centered-page--wide`
   - Standard → `centered-page`
3. Delete old numbered classes

---

### Problem 2: "Our Location" Proliferation 📍
**12 variations**: `our location 2` through `our location 13`

**Consolidation Strategy:**
```
KEEP THESE 2:
├── location-block (base container styles)
└── location-block--compact (smaller spacing variation)

DELETE: our location 2-13
```

---

### Problem 3: "Foodmenu" Combo Class Chaos 🍝
**30+ combo instances** of `foodmenu`

**Analysis:** Most are empty or have 1-2 properties each. These should be:
- Combined into semantic class names
- Or applied as separate utility classes

**Example Cleanup:**
```
INSTEAD OF:
├── foodmenu (empty)
├── foodmenu (font-size: 10.67px)
├── foodmenu (margin-bottom: 16px)
└── foodmenu (letter-spacing: 0.06em)

USE:
├── menu-item (base styles)
├── text-sm (font-size utility)
├── mb-md (margin-bottom utility)
└── tracking-wide (letter-spacing utility)
```

---

### Problem 4: Menu Item Variations 🍽️
**Multiple similar classes:**
```
├── menu_item
├── menu_item bev
├── menu_item Copy
├── menu_item Copy Copy
├── menu_item-name
├── menu_item-name Copy
├── menu_item-price
├── menu_item-price Copy
├── menu_item-desc
└── menu_item-desc Copy
```

**Consolidation Strategy:**
```
STANDARDIZE TO BEM:
├── menu-item (block)
├── menu-item__name (element)
├── menu-item__price (element)
├── menu-item__desc (element)
└── menu-item--beverage (modifier)

DELETE: All "Copy" versions
```

---

### Problem 5: "Web Version" Duplicates 🌐
**7 variations**: `web version` through `web version 7`

**Analysis:** Mostly empty or minimal differences

**Consolidation Strategy:**
```
KEEP:
├── screen-only (display rules for web)
└── print-hidden (hide in print)

DELETE: web version 2-7
```

---

## PHASE 3: NAMING STANDARDIZATION

### Recommended Convention: Modified BEM

**Why BEM-ish?**
- Clear hierarchy (block__element--modifier)
- Easy to scan
- Scales well
- You're already using it partially

**Pattern:**
```
block-name              (e.g., menu-item)
block-name__element     (e.g., menu-item__price)
block-name--modifier    (e.g., menu-item--featured)
```

### Current Naming Patterns to Migrate

**From:**
```
menu_item              → menu-item
menu_item-price        → menu-item__price
foodmenu               → menu-section
centered page 15       → container--centered
our location 3         → location-block
```

**Keep These Patterns:**
```
✓ Utilities: hide, last, bottom (semantic single-purpose)
✓ Layout: container, wrapper, grid
✓ Components with clear BEM: nav-wrapper, footer-text
```

---

## PHASE 4: AUTO-GENERATED CLASS CLEANUP

### Classes to Rename (Priority Order)

**Divs (30+ instances):**
```
Div Block 67  → [describe its purpose]
Div Block 93  → [describe its purpose]
Div Block 99  → [describe its purpose]
...etc
```

**Strategy:**
1. Click element in Designer
2. See what it contains/does
3. Rename to describe purpose:
   - `Div Block 67` → `menu-separator`
   - `Div Block 93` → `flex-row-spaced`

**Images (15+ instances):**
```
Image 12 → logo-header
Image 14 → menu-background
Image 27 → footer-accent
```

**Text Blocks (10+ instances):**
```
Text Block 2  → description-text
Text Block 19 → address-line
```

---

## TOOLS & TECHNIQUES

### Finding & Replacing Classes

1. **Designer Navigator**
   - Right-click class → "Select all with this class"
   - Apply new class to all
   - Remove old class

2. **Style Manager**
   - See all classes alphabetically
   - Delete unused classes (will show warning if in use)

3. **Find/Replace in Classes**
   - No bulk find/replace exists
   - Must do page-by-page or element-by-element

### Safe Consolidation Process

```
FOR EACH CLASS TO CONSOLIDATE:
1. Document what it does
2. Create replacement class with new name
3. Find all elements using old class
4. Apply new class to all elements
5. Remove old class from elements
6. Verify nothing broke (check responsive)
7. Delete old class from Style Manager
```

---

## SPECIFIC CLASS MIGRATION TABLE

### High-Value Consolidations

| Current | Count | Replace With | Notes |
|---------|-------|--------------|-------|
| `centered page 2-24` | 23 | `container`, `container--narrow`, `container--wide` | Max-width variations |
| `our location 2-13` | 12 | `location-block`, `location-block--compact` | Layout variations |
| `web version 2-7` | 6 | `screen-only` | Display utilities |
| `foodmenu` (combos) | 30+ | Semantic menu classes | Break into proper components |
| `mobilehome` variants | 4 | `hero`, `hero--mobile` | Home page sections |
| `menu_item` variants | 10+ | `menu-item`, `menu-item__*` | BEM structure |
| `Div Block X` | 30+ | Semantic names | Case by case |

---

## IMPLEMENTATION TIMELINE

### Week 1: Foundation
- [x] Create spacing variables
- [x] Create weight variables
- [ ] Update 10 most-used classes to use new variables
- [ ] Document class usage with screenshots

### Week 2: Major Consolidation
- [ ] Consolidate "centered page" variants (2-3 hours)
- [ ] Consolidate "our location" variants (1 hour)
- [ ] Consolidate "menu" variants (3 hours)

### Week 3: Naming Cleanup
- [ ] Rename top 20 auto-generated classes (2 hours)
- [ ] Standardize menu component classes to BEM (2 hours)
- [ ] Clean up combo class redundancy (2 hours)

### Week 4: Polish & Test
- [ ] Final variable adoption pass (1 hour)
- [ ] Delete unused classes (1 hour)
- [ ] Responsive testing across breakpoints (2 hours)
- [ ] Document final class system (1 hour)

**Total Time Estimate: 18-20 hours**

---

## MAINTENANCE GUIDELINES

### Going Forward: Class Naming Rules

1. **Use BEM for components**
   ```
   menu-item
   menu-item__title
   menu-item__price
   menu-item--featured
   ```

2. **Use semantic utilities for spacing**
   ```
   mb-sm   (margin-bottom: space-sm)
   mt-md   (margin-top: space-md)
   p-lg    (padding: space-lg)
   ```

3. **Never create "Copy" classes**
   - If you need variation, create a modifier: `--modifier`

4. **Delete auto-generated names immediately**
   - Don't let `Div Block 108` make it to staging

5. **Check for existing classes first**
   - Search Style Manager before creating new

6. **Use variables for all:**
   - Colors
   - Typography (sizes, weights, families)
   - Spacing (margins, padding)
   - Common values (border radius, shadows)

---

## APPENDIX: Complete Class List by Category

### Layout Classes (45 total)
```
Container variants: Container 4, Container 5
Centered variants: centered page 2-24 (23 total)
Location variants: our location 2-13 (12 total)
Positioning: center on page, modal, modal-container
...
```

### Component Classes (120 total)
```
Menu: menu_item, menu_block, menu_label, menu_grid, menu_list (40+ variants)
Navigation: navlink, nav-wrapper, navbar, menunavres (15+ total)
Form: field, farmfield, farmrows, inquire (20+ total)
...
```

### Utility Classes (35 total)
```
Display: hide, screen-only, print
Spacing: bottom, last, collection item padding bottom
State: hover (implied via pseudo)
...
```

### Auto-Generated (30+ total)
```
Div Block 6, 14, 16, 17, 22, 23, 24, 26, 27, 28, 31, 33, 34, 35, 36, 37, 38, 39, 42, 44, 45, 47, 48, 52, 53, 54, 55, 56, 57, 59, 60, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 75, 76, 81, 83, 89, 90, 91, 92, 93, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107

Image 9, 10, 11, 12, 13, 14, 15, 17, 18, 19, 20, 21, 22, 24, 25, 26, 27

Text Block 2, 3, 7, 10, 16, 17, 19, 21, 22, 25, 28

Form Block, Form Block baseline
Field Label, Field Label 2, Field Label 3
...
```

---

## FINAL RECOMMENDED CLASS COUNT

**Current: 433 classes**  
**Target: ~120 classes** (72% reduction)

**Breakdown:**
- Layout: ~15 classes
- Components: ~60 classes
- Typography: ~15 classes
- Utilities: ~20 classes
- States/Modifiers: ~10 classes

This is **achievable** by consolidating duplicates and using variables + utility classes instead of creating unique classes for minor variations.
