# Adelaide Restaurant

Restaurant website for Adelaide in Woodcliff Lake, NJ. Migrating from Webflow to self-hosted, Google Sheets-powered menu system.

## Current Status

**Phase:** V2 — Building Sheets-powered menu site to replace Webflow
**Live URL (staging):** https://benmartel.com/sandbox/
**Production:** https://adelaidenj.com (still Webflow, Feb 19 version)
**Google Sheet:** https://docs.google.com/spreadsheets/d/14GOE6KlWWyvh0LvwXsK_R4g7haVHteIlGJj0cwl0FD4/edit

### Team
- **Annie & Jack O'Connor** — co-founders
- **Kristen Cahill** (Shebang Studio) — designer/UX lead
- **Ben Martel** — web dev (you)

### Confirmed Decisions
- Google Sheets API v4 for menu data (not gviz hack)
- API key: `AIzaSyCft5UbAmq_e6ttyjVZwRCh_DvsKdJo4Ho` (GCP project: screenshot-a-sheet, restricted to benmartel.com)
- Section-grouped layout: rows grouped by Section column into separate divs
- Print-friendly CSS (Cmd+P gives clean B&W output)
- XSS-safe: all cell values escaped via textContent

### Blocked / Waiting On
- [ ] Actual Adelaide menu data in the Google Sheet (currently has sample data)
- [ ] Adelaide domain/subdomain for hosting (currently on benmartel.com/sandbox/)
- [ ] API key referrer restriction needs updating when domain changes
- [ ] Design direction from Kristen for v2 look & feel

## Tech Stack
- Single-file HTML, vanilla JS (no frameworks)
- Google Sheets API v4 with browser API key
- Hosted on DigitalOcean droplet (178.128.155.186)
- Nginx serving static files
- Google Sheets MCP for Claude: custom OAuth flow (`~/.claude/sheets-oauth-flow.py`), refresh with `~/.claude/refresh-sheets-token.sh`

## Project Files
```
adelaide/
  v2/
    sheet-sync/
      index.html        ← live menu page (deployed to benmartel.com/sandbox/)
  docs/                 ← Kristen's specs, annotated PDFs
  qa-sheet.html         ← QA checklist (v1 Webflow)
  qa.html               ← sprint dashboard (v1)
  review-tracker.html   ← 37-item tracker (v1)
  links.html            ← link hub (v1)
  tracker.html          ← deliverable tracker (v1)
  incoming/             ← pages delivered from indesign-to-web pipeline (integrate then move to incoming/processed/)
```

## Cross-Project: InDesign to Web Pipeline
- **Engine project:** `~/projects/indesign-to-web/`
- **Handoff:** Engine copies completed HTML to `adelaide/incoming/` + its own `sent/`
- **Integration:** Review incoming page, integrate into site, move to `incoming/processed/`
- Pages are single-file HTML with embedded CSS, overlay tool, and print-ready output

## Key References
- GCP Console (API key): https://console.cloud.google.com/apis/credentials?project=screenshot-a-sheet
- Webflow staging (v1): https://adelaide-2713ba.webflow.io
- Adelaide menu sheet (real data): `1KQh4BZ5k9ldMAsI8TmDZOF_EzoP47OSt99EFnRRHcqY`
- Sandbox test sheet: `14GOE6KlWWyvh0LvwXsK_R4g7haVHteIlGJj0cwl0FD4`

## Workspace Controller (`./ws`)

Shell script for managing the cmux workspace tab — themed to Adelaide's brand instead of default blue.

### Brand Palette (from v2/index.html CSS vars)
| Token | Hex | Use |
|---|---|---|
| `--dark` | `#35190d` | Deep espresso (text, dark accents) |
| `ADELAIDE_BROWN` | `#9b632b` | Warm amber-brown (tab pill, progress) |
| `--backgroundcolor` | `#e6e2de` | Warm beige (page background) |

### Quick Reference
```
./ws theme              # Apply Adelaide brown to workspace tab
./ws progress 45        # Set progress to 45%
./ws progress 60 "QA"   # Set progress with label
./ws label "Food menu"  # Update label only
./ws status Building    # Change status pill text
./ws icon hammer        # Change icon (any SF Symbol)
./ws clear              # Remove progress bar
./ws reset              # Reset to Adelaide defaults
./ws show               # Current state
```

### How Claude Should Use This
When working on tracked milestones, update the progress bar:
```
cmux set-progress 0.35 --label "Food menu build (35%)"
cmux set-status claude_code "Building" --icon hammer --color "#9b632b"
```
When finishing a session, set status to idle:
```
cmux set-status claude_code "Idle" --icon moon.fill --color "#9b632b"
```
Always use `#9b632b` for color — never revert to default blue.

### State
Progress state persists in `.ws-state` (gitignored). The script reads/writes this so progress survives across `./ws` calls.
