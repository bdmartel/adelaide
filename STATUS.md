# Adelaide Restaurant - Project Status

## Overview
- **Client:** Adelaide Restaurant (New Jersey)
- **Domain:** adelaidenj.com
- **Platform:** Webflow (CMS-powered menus synced from Google Sheets)
- **Launched:** February 8, 2026
- **Soft opening:** ~February 15-17, 2026
- **Role:** Ben Martel = web developer, Kristen Cahill (Shebang Studio) = designer/UX

## Team Contacts

| Name | Role | Email | Phone |
|------|------|-------|-------|
| Annie O'Connor | Co-founder | annie@adelaidenj.com | 201.390.4427 |
| Jack O'Connor | Co-founder | Jack@adelaidenj.com | |
| Matt Colvin | (Operations?) | Matt@adelaidenj.com / mattcolvin0224@gmail.com | |
| Margie Colvin | | margie@adelaidenj.com | |
| Ralph Elalfy | | Ralph@adelaidenj.com | |
| Kristen Cahill | Designer (Shebang Studio) | kristencahill@shebangstudio.com | |
| Ben Martel | Web developer | bdmartel@gmail.com | 603.801.3344 |

## Technical Details

### Site Architecture
- **Webflow CMS** with Google Sheets sync for menus ("Adelaide Menus (Master List)")
- Menu categories managed via spreadsheet: starters, entrees, pasta, desserts, cocktails, wines by the glass, beer, spirits
- Private events inquiry form sends to info@adelaidenj.com
- Desktop: email/phone NOT clickable; Mobile: clickable (tap to call/email)
- Webflow form submissions don't send confirmation to customer

### Design System
- **Heading font:** Saint Andrews Queen Adelaide Stanneqn
- **Body font:** Montserrat
- **Primary text:** #35190d (dark)
- **Background:** #e6e2de
- **Tan accent:** rgba(155, 99, 43, 0.06)
- **433 Webflow classes**

### Print Menus
- Main menu: portrait orientation
- Dessert menu: landscape orientation
- Print from browser (Cmd+P), actual size, no margins
- Disclosure/footnote statements required on printed menus (not on web)

### Key URLs
- Live site: https://adelaidenj.com
- Menu page: https://adelaidenj.com/rev/todays-menu
- Printable menus: https://adelaidenj.com/resources/printable-menus/main
- Private events: https://adelaidenj.com/private-events

## Timeline

### Build & Launch (Feb 6-9, 2026)
- Feb 6: RESY link integration, menu sheet sync live
- Feb 7: Dessert menu margins, Matt Colvin given sheet access
- **Feb 8: SITE LAUNCHED** (adelaidenj.com is live)
- Feb 8-9: Post-launch QA (private events form, contact info, hours page 404, phone number corrections)
- Feb 9: Kristen confirmed all Ben's post-launch fixes, Annie approved

###Post-Soft-Opening Updates (Feb 16 - Mar 5, 2026)
- Feb 16-20: Urgent menu update (disclosure statements not displaying on live site, print troubleshooting via Zoom)
- Feb 24: Annie requested: (1) add cocktails/wines by the glass to website, (2) expand secondary beverage menu to book-style print
- Feb 26: Ben estimated $500 for web piece, 4-6 hrs for print piece, looped in Kristen
- Mar 2: Annie approved #1 (web beverages); Ben quoted $800 total for both
- Mar 4: Kristen chimed in - recommended design-first approach, flagged navigation/UX dominos
- Mar 5: Kristen sent detailed analysis, estimated Ben's time at $500-$1200
- Mar 5: Ben agreed with Kristen's approach, no work started

### Current Status (Mar 18, 2026)
- Restaurant has been open ~2 months, site is live and stable
- Next round of site changes in progress — Kristen is finalizing designs
- Waiting on final design rounds from Kristen before implementation begins
- Webflow MCP server connected to Claude Code (configured 2026-03-18) for direct site management


## Docs
- `docs/adelaide-quick-reference.md` - Variable/naming quick reference card
