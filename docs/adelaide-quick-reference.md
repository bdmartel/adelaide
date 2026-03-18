# Adelaide Restaurant - Quick Reference Card
**Keep this handy for class creation & variable usage**

---

## VARIABLES REFERENCE

### Colors
```
dark                → Primary text (#35190d)
backgroundColor     → Page background (#e6e2de)
border-subtle       → Standard borders
tanbg               → Subtle tan background
bg-transparent      → Transparent backgrounds
colorBlue           → Links/accents
colorWhite          → White
```

### Typography
```
FAMILIES:
fontBody            → Montserrat (body text)
fontScript          → Saint Andrews Queen Adelaide (headings)

SIZES:
font8px   (0.5rem)     font15px (0.9375rem)   font56px (3.5rem)
font9px   (0.5625rem)  font16px (1rem)
font12px  (0.75rem)    font18px (1.125rem)
font14px  (0.875rem)   font24px (1.5rem)

WEIGHTS:
weight-light      (300)
weight-regular    (400)
weight-semibold   (600)
weight-bold       (700)
```

### Spacing Scale (8px base)
```
space-xs    0.25rem    4px     → Tight spacing
space-sm    0.5rem     8px     → Small gaps
space-md    1rem       16px    → Standard spacing
space-lg    1.5rem     24px    → Section spacing  
space-xl    2rem       32px    → Large gaps
```

### Layout
```
container-max-width     800px
distance from nav       4rem
footeroffset           -6vh
```

---

## NAMING CONVENTIONS

### BEM Pattern (Preferred)
```
block-name                  Base component
block-name__element         Child element
block-name--modifier        Variation

EXAMPLES:
menu-item                   Container for menu item
menu-item__title            Item name
menu-item__price            Item price
menu-item--featured         Featured variation
menu-item--beverage         Beverage-specific
```

### Utility Classes (Single Purpose)
```
DISPLAY:
hide, show
screen-only, print-only

SPACING:
mb-{size}    margin-bottom
mt-{size}    margin-top
p-{size}     padding

STATE:
last         Last in sequence (no bottom margin)
bottom       Anchored to bottom
```

### Layout Classes
```
container            Max-width centered container
container--narrow    Narrow width variant
container--wide      Wide width variant
grid                 Grid container
flex-row             Flex row container
flex-col             Flex column container
```

---

## CLASS CREATION CHECKLIST

Before creating a new class, ask:

1. **Does it already exist?**
   → Search Style Manager first

2. **Is this a variation of an existing component?**
   → Use BEM modifier: `component--variant`

3. **Is this a spacing/sizing change?**
   → Use utility class or variable instead

4. **Is this reusable or one-off?**
   → One-off = inline style or combo class
   → Reusable = new semantic class

5. **Does the name describe what it IS, not WHERE it is?**
   ✓ Good: `menu-item`, `hero-title`
   ✗ Bad: `div-block-67`, `homepage-thing`

---

## COMMON PATTERNS

### Menu System
```
menu-container       → Overall menu wrapper
menu-section         → Section of menu (apps, entrees, etc)
menu-section__title  → Section heading
menu-item            → Individual menu item
menu-item__name      → Dish name
menu-item__price     → Price
menu-item__desc      → Description
```

### Navigation
```
nav                  → Main navigation
nav__wrapper         → Container
nav__link            → Nav link
nav__link--active    → Active state
```

### Forms
```
form                 → Form container
form__field          → Input wrapper
form__label          → Field label
form__input          → Input field
form__button         → Submit button
```

---

## QUICK WINS

### Instead of creating new classes, use:

**Margins:**
```
Don't:  .my-special-spacing { margin-bottom: 20px; }
Do:     Use space-lg variable on existing class
```

**Colors:**
```
Don't:  .dark-text-2 { color: #35190d; }
Do:     Use 'dark' variable
```

**Typography:**
```
Don't:  .small-text-2 { font-size: 12px; }
Do:     Use font12px variable
```

**Borders:**
```
Don't:  .border-thing { border: 1px solid hsla(...); }
Do:     Use border-subtle variable
```

---

## RED FLAGS 🚩

**NEVER DO THIS:**
- Create "Copy" or "Copy 2" classes
- Use auto-generated names (Div Block X, Image Y)
- Hardcode colors/sizes that have variables
- Create single-use classes for simple variations
- Mix naming conventions in related components

**ALWAYS DO THIS:**
- Use semantic, descriptive names
- Apply variables for all repeated values
- Check for existing classes first
- Follow BEM for components
- Delete unused classes regularly

---

## DECISION TREE

```
Need styling?
│
├─ Spacing only?
│  └─ Use variable (space-md, space-lg)
│
├─ One element only?
│  └─ Inline style or reuse existing class
│
├─ Used 2+ places?
│  │
│  ├─ Part of component?
│  │  └─ BEM: component__element
│  │
│  └─ Standalone?
│     └─ Semantic name: what-it-is
│
└─ Variation of existing?
   └─ BEM modifier: component--modifier
```

---

## WEBFLOW TIPS

### Finding Classes
- Style Manager (left panel) → See all classes
- Right-click class → "Select all" → See usage
- Navigator → Shows class hierarchy

### Safe Deletion
1. Select class in Style Manager
2. Webflow shows "X elements" using it
3. If 0 elements → Safe to delete
4. If >0 → Migrate elements first

### Combo Classes
- Show as: `class-1 class-2 class-3`
- Each combination creates separate style entry
- Minimize combos → Better performance

---

## EMERGENCY FIXES

### "I created a mess, how do I clean it up?"

1. **Too many combo classes:**
   - Create a single new class with all styles
   - Apply to all elements
   - Remove old combo classes

2. **Wrong name:**
   - Create correct class
   - Apply to all elements using old
   - Delete old class

3. **Want to change global spacing:**
   - Update the variable value
   - Changes apply everywhere automatically

---

**Last Updated:** February 11, 2026  
**For:** Adelaide Restaurant (Sandbox)
