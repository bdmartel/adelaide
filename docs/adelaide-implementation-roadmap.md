# Adelaide Restaurant - Cleanup Implementation Roadmap
**Strategic Plan with Time Estimates & Impact Analysis**

---

## IMPACT vs. EFFORT MATRIX

```
HIGH IMPACT, LOW EFFORT (Do First) ⭐⭐⭐
├── Adopt new variables in top 20 classes (2 hrs)
├── Consolidate "centered page" variants (2 hrs)
├── Consolidate "our location" variants (1 hr)
└── Delete obvious duplicates (1 hr)

HIGH IMPACT, MEDIUM EFFORT (Do Second) ⭐⭐
├── Standardize menu component classes (3 hrs)
├── Clean up "foodmenu" combo classes (3 hrs)
├── Rename top 15 auto-generated divs (2 hrs)
└── Create utility class system (2 hrs)

MEDIUM IMPACT, LOW EFFORT (Do Third) ⭐
├── Rename image/text classes (1 hr)
├── Consolidate form classes (1 hr)
└── Clean up navigation classes (1 hr)

LOW PRIORITY (Nice to Have)
├── Perfect BEM across entire site (4 hrs)
└── Create comprehensive utility system (3 hrs)
```

---

## WEEK-BY-WEEK PLAN

### WEEK 1: Foundation (6 hours)
**Goal:** Get variables working, biggest wins

#### Session 1: Variable Adoption (2 hours)
```
TASK: Replace hardcoded values with variables in top 20 classes

PROCESS:
1. Open Style Manager → Sort by usage
2. Top 20 most-used classes, update:
   ├── margin-bottom values → space variables
   ├── font-weight values → weight variables
   ├── color values → color variables
   └── background-color → bg variables

CLASSES TO UPDATE:
- body (default-body)
- menu_item
- menu_label
- centered page 2
- navlink

EXPECTED REDUCTION: 0 classes, but foundation for future
TIME: 2 hours
```

#### Session 2: "Centered Page" Consolidation (2 hours)
```
TASK: Reduce 23 "centered page" variants to 3

STEP BY STEP:
1. Create new classes:
   ├── container (base: max-width 700px, margin auto)
   ├── container--narrow (max-width 380px)
   └── container--wide (max-width 900px)

2. Migration table:
   centered page 2-7    → container
   centered page 8-14   → container--narrow
   centered page 15-24  → container--wide

3. For each old class:
   - Select all elements using it (right-click)
   - Add new class
   - Remove old class
   - Delete old class from Style Manager

EXPECTED REDUCTION: ~20 classes
TIME: 2 hours
```

#### Session 3: "Our Location" Consolidation (1 hour)
```
TASK: Reduce 12 "our location" variants to 2

CREATE:
├── location-block (base styles)
└── location-block--compact (tighter spacing)

MIGRATE:
our location 2-7   → location-block
our location 8-13  → location-block--compact

EXPECTED REDUCTION: ~10 classes
TIME: 1 hour
```

#### Session 4: Quick Wins (1 hour)
```
TASK: Delete obviously unused/duplicate classes

TARGETS:
- Empty "foodmenu" combos with 0 properties
- Unused "Copy" variants
- Classes with 0 elements

PROCESS:
1. Style Manager → Sort alphabetically
2. Look for "Copy" in name
3. Check element count
4. If 0 → Delete
5. If >0 → Add to migration list

EXPECTED REDUCTION: ~15 classes
TIME: 1 hour
```

**WEEK 1 TOTAL:**
- Time: 6 hours
- Classes Reduced: ~45 (10% reduction)
- Variables Adopted: 20+ classes updated

---

### WEEK 2: Menu System Overhaul (8 hours)
**Goal:** Clean menu component structure

#### Session 1: Menu Component Analysis (1 hour)
```
TASK: Document all menu-related classes and their usage

DELIVERABLE: Spreadsheet showing:
- Class name
- Properties
- Element count
- Breakpoint styles
- Proposed new name
```

#### Session 2: Create New Menu System (2 hours)
```
TASK: Build clean BEM-based menu classes

CREATE:
menu-section
├── menu-section__header
├── menu-section__title
└── menu-section__subtitle

menu-item
├── menu-item__name
├── menu-item__price
├── menu-item__description
└── menu-item--featured

menu-item--beverage (modifier for drinks)
menu-item--dessert (modifier for sweets)
```

#### Session 3: Migrate Menu Items (3 hours)
```
TASK: Apply new classes to all menu elements

PROCESS:
1. Find all elements with old menu_ classes
2. Group by component (labels, items, prices, etc)
3. Apply appropriate new class
4. Remove old classes
5. Test on menu page
6. Test responsive

PAGES TO CHECK:
- Food menu
- Beverage menu  
- Dessert menu
- Print versions
```

#### Session 4: Clean Up Foodmenu Combos (2 hours)
```
TASK: Eliminate 30+ foodmenu combo class instances

STRATEGY:
- Most combos have 1-2 properties only
- Move unique properties to semantic classes
- Delete empty combos

EXPECTED REDUCTION: ~25 classes
```

**WEEK 2 TOTAL:**
- Time: 8 hours
- Classes Reduced: ~40 (9% additional)
- Menu system: Clean, maintainable structure

---

### WEEK 3: Auto-Generated Cleanup (6 hours)
**Goal:** Replace generic names with semantic ones

#### Session 1: Div Block Audit (1 hour)
```
TASK: Identify what each "Div Block X" actually does

PROCESS:
1. Click each Div Block class in Style Manager
2. See what elements use it
3. Note purpose (e.g., "flex container for menu items")
4. Create migration plan

OUTPUT: List of:
Div Block 67 → menu-item-wrapper
Div Block 93 → flex-row-spaced
etc.
```

#### Session 2: Rename Top 15 Divs (2 hours)
```
PRIORITY DIVS (most-used):
1. Div Block 31 → (check purpose)
2. Div Block 42 → (check purpose)
3. Div Block 44 → (check purpose)
...

PROCESS:
- Create new semantic class
- Apply to all elements
- Remove old class
- Delete old class
- Update component documentation
```

#### Session 3: Image & Text Classes (1 hour)
```
RENAME:
Image 12 → logo-header
Image 14 → menu-background
Image 27 → footer-accent

Text Block 2 → description-text
Text Block 19 → address-line
Text Block 21 → heading-large

EXPECTED REDUCTION: ~20 classes consolidated
```

#### Session 4: Form & Field Cleanup (2 hours)
```
TASK: Consolidate form-related classes

CURRENT MESS:
- field, farmfield
- Form Block, Form Block baseline
- Field Label, Field Label 2, Field Label 3
- inquire, inquireforminputtextarea

CREATE:
form
├── form__field
├── form__label
├── form__input
├── form__textarea
└── form__button

EXPECTED REDUCTION: ~10 classes
```

**WEEK 3 TOTAL:**
- Time: 6 hours
- Classes Reduced: ~30 (7% additional)
- Readability: Massively improved

---

### WEEK 4: Polish & Documentation (4 hours)
**Goal:** Final cleanup, testing, docs

#### Session 1: Utility Classes (1 hour)
```
CREATE STANDARD UTILITIES:

Spacing:
mb-sm, mb-md, mb-lg, mb-xl (margin-bottom)
mt-sm, mt-md, mt-lg, mt-xl (margin-top)
p-sm, p-md, p-lg, p-xl (padding)

Typography:
text-sm, text-md, text-lg (font sizes)
font-light, font-regular, font-bold (weights)
tracking-tight, tracking-normal, tracking-wide (letter-spacing)

Display:
hidden, visible
screen-only, print-only

EXPECTED ADDITION: ~15 utility classes
(But eliminates need for 30+ one-off classes)
```

#### Session 2: Unused Class Purge (1 hour)
```
TASK: Delete any remaining unused classes

PROCESS:
1. Style Manager → Sort by element count
2. All classes with 0 elements → Review
3. Confirm not used anywhere
4. Delete

EXPECTED REDUCTION: ~15 classes
```

#### Session 3: Responsive Testing (1 hour)
```
TASK: Verify nothing broke across breakpoints

TEST ON:
- Desktop (1920px, 1440px, 1280px)
- Tablet (991px)
- Mobile Landscape (767px)
- Mobile Portrait (478px)

PAGES TO CHECK:
- Home
- Menu
- Hours & Location
- Contact Form
- 404/Utility pages

FIX: Any issues found
```

#### Session 4: Update Documentation (1 hour)
```
TASK: Create final class reference

DELIVERABLES:
1. Updated style guide
2. Component library screenshot
3. Variable reference card
4. Naming convention guide
5. "Don't repeat this" lessons learned

SHARE WITH: Designer for alignment
```

**WEEK 4 TOTAL:**
- Time: 4 hours
- Classes Reduced: ~15 more
- Documentation: Complete

---

## CUMULATIVE RESULTS

```
STARTING POINT:
├── Total Classes: 433
├── Variables: 28
└── Maintainability: Low

AFTER 4 WEEKS (24 hours):
├── Total Classes: ~130 (70% reduction)
├── Variables: 37 (all key values)
├── Naming: Consistent BEM
├── Utilities: Standard set
└── Maintainability: High

CLASS BREAKDOWN:
Before → After
├── Layout:        45 → 15
├── Components:   120 → 60
├── Typography:    35 → 15
├── Utilities:     35 → 20
├── Auto-generated: 30 → 0
└── Duplicates:   168 → 0
```

---

## MEASURING SUCCESS

### Metrics to Track

**Quantitative:**
- Total class count (goal: <150)
- Classes using variables (goal: 100%)
- Combo class instances (goal: <20)
- Auto-generated names (goal: 0)
- Classes per component (goal: <5)

**Qualitative:**
- Can you find a class when you need it?
- Is the purpose of each class obvious?
- Can the designer maintain this?
- Would a new dev understand the system?

---

## RISK MITIGATION

### What Could Go Wrong?

**Risk: Breaking live site**
- Mitigation: Working in sandbox ✓
- Mitigation: Test thoroughly before prod
- Mitigation: Keep screenshots of before/after

**Risk: Losing designer's custom styles**
- Mitigation: Document all changes
- Mitigation: Review with designer before deletion
- Mitigation: Keep backup of pre-cleanup site

**Risk: Time overrun**
- Mitigation: Stick to high-impact items first
- Mitigation: Can stop after Week 2 with major wins achieved
- Mitigation: Each week delivers value independently

**Risk: Forgetting what old classes did**
- Mitigation: Screenshot before renaming
- Mitigation: Document in migration table
- Mitigation: Git-style "commit messages" for each change

---

## STOPPING POINTS

You don't have to do all 4 weeks. Each week is independently valuable:

**After Week 1 (6 hrs):**
- Variables in place
- Biggest duplicates removed
- 45 fewer classes
- **Ready to stop here if needed**

**After Week 2 (14 hrs):**
- Menu system clean
- 85 fewer classes
- Core components standardized
- **Good stopping point**

**After Week 3 (20 hrs):**
- All auto-generated names gone
- 115 fewer classes
- Fully semantic naming
- **Recommended minimum**

**After Week 4 (24 hrs):**
- Complete system
- 130 classes (target achieved)
- Full documentation
- **Ideal endpoint**

---

## NEXT STEPS

### Start Tomorrow:

1. **Review this plan** with designer
2. **Block 2 hours** on calendar
3. **Start Week 1, Session 1** (Variable Adoption)
4. **Track progress** in spreadsheet
5. **Document wins** with screenshots

### Success Looks Like:

- Finding any class in <10 seconds
- Adding new features without creating new classes
- Designer can maintain system independently
- Onboarding new devs takes minutes not hours

---

## APPENDIX: Session Templates

### Session Template
```
BEFORE:
- Screenshot of Style Manager (class count)
- Screenshot of element using old classes

DURING:
- List of changes made
- Any issues encountered
- Time spent vs. estimate

AFTER:
- Screenshot of Style Manager (new count)
- Screenshot of element with new classes
- Responsive check: ✓ Desktop ✓ Tablet ✓ Mobile
- Notes for next session
```

### Change Log Template
```
[DATE] Session X: [TITLE]

CHANGES:
Old Class → New Class (X elements affected)
- class-old-1 → class-new-1 (23 elements)
- class-old-2 → class-new-2 (15 elements)

DELETED:
- class-unused-1 (0 elements)
- class-duplicate-1 (merged into class-new-1)

VARIABLES ADOPTED:
- margin-bottom: 20px → space-lg (in 5 classes)
- color: #35190d → dark (in 8 classes)

TIME: 2 hours (estimated 2 hours)
STATUS: ✓ Complete

NEXT SESSION: [TITLE]
```

---

**Remember:** This is a marathon, not a sprint. Even Week 1 alone will make a massive difference. You've got this! 🎉
