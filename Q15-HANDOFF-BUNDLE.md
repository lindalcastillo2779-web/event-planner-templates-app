# Q15-HANDOFF-BUNDLE — single-file handoff package
# Claude Code: your FIRST task is to split this bundle into its component
# files at the exact paths in each BEGIN marker, byte-for-byte, then delete
# this bundle file. Do not edit any content while splitting.

<<<<<<<<<< BEGIN FILE: quince/BRIEF-Q15-001.md >>>>>>>>>>
# BRIEF-Q15-001 — Quinceañera Planner: Build Slice 1
_Executor: Claude Code (or equivalent) with `planner_factory.py`, `kit_builder.py`, `kits_library.py`, and the 10 quince recipe JSONs in context · Reviewer: Chief Product Architect · Reference: QUINCE-ARCH-001.md (full architecture) · Owner has no coding experience — executor handles all setup and explains each step in one plain sentence._

## Decisions locked (paste into DECISIONS.log)
- **D-019** · Tiara cover ornament approved for build; added to the factory's ornament set (`arch | wreath | rings | minimal | tiara`). All 10 quince recipes will switch `cover_ornament` to `tiara` after it ships. — Owner
- **D-020** · Launch with 3 colorways: Royal Blue & Gold, Black & Gold, Mexican Heritage Fiesta. Remaining 7 follow in v1.1 (QA + listing photos only; recipes already exist). — Owner
- **D-021** · First two add-on kits: Court of Honor Kit + Vals & Choreography Kit. Padrinos and Day-Of kits deferred to v1.2. Kit choice intentionally matches the two custom modules — each module ships in the core planner AND its kit. — Owner

## Goal
Everything needed to render the full core planner (EN+ES, hyperlinked, printable) in the **Royal Blue & Gold** recipe: translation table, shared content file, two addon modules, and the tiara ornament. One colorway proven end-to-end before the other two launch SKUs are generated.

## Task order (do not reorder — each step gates the next)

### 1. Translation table — `q15.*` keys
- Key convention: `q15.<tab>.<page>.<element>` per QUINCE-ARCH-001 §8. Add abbreviation sub-keys for badge-constrained strings (e.g. `q15.court.roles.chambelan_abbr`).
- Write ALL English strings first from the page specs in QUINCE-ARCH-001 §4, then Spanish for every key. Hard rules: checklist row strings ≤ 55 chars EN; no key ships with an empty ES cell (add a build-time check that fails on any empty translation).
- Flag the full ES column for the owner's native-speaker review pass before final SKU generation — quince vocabulary is regional (damas, chambelanes, recuerdos, última muñeca, cambio de zapatos must read natural, never machine-translated).

### 2. Shared content file — `quince_content.json`
- Typed `extra_pages` blocks for every no-code page listed in QUINCE-ARCH-001 §8 (checklists with dueOffsetDays, budget trackers, guest/RSVP, padrinos assignment, attire, venue/mass, vendors, food, decor, notes, gift tracker, playlists, run-of-show, ceremony-order text pages, emergency kit).
- Colors referenced ONLY by role (`primary`, `accent`, `metallic`, `highlight`, `neutral`, `background`, `ink`). Zero hardcoded hex — grep proves it.
- Before building the seating chart page: check `kits_library.py` and existing Sage & Rose recipes for an existing seating module. Reuse if present; only note it for step 4 if absent.

### 3. Tiara ornament
- Inspect the existing ornament implementations (arch/wreath/minimal) in `planner_factory.py` first; the tiara must match their function signature, stroke weight, and color-role usage exactly.
- Geometry (in a unit box, then scaled; overall aspect ≈ 2:1 width:height):
  - Base: one shallow arc spanning the full ornament width, chord rise ≈ 12% of width.
  - Five peaks rising from the arc: center peak tallest (full ornament height), inner pair ≈ 72%, outer pair ≈ 50%. Each peak is two gently inward-curving strokes (béziers) meeting at a point — elegant, not zigzag.
  - One small circle finial (radius ≈ 3% of width) atop each of the five peaks.
- Stroke color: `metallic` role. No fills, no gradients — pure linework so it inherits every colorway.
- Verify render on all three launch palettes' backgrounds; must sit balanced above the title block at cover scale.

### 4. Addon module — `court_roster.py`
- Roster table, ~10 rows/page: columns name / phone / pair / dress-suit size, all as write-in lines.
- Role badge per row (dama, chambelán, + honor variants) pulled from translation keys; if the ES label overflows the badge, fall back automatically to the `_abbr` key.
- Signature element: 4-checkbox status strip per row — confirmed / measured / fitted / rehearsed — with tiny labels from translation keys. Checkboxes drawn in `ink` (must survive B&W print), rules in `neutral`, header band in `primary`.
- Used by: Court tab (4 pages) + Court of Honor Kit.

### 5. Addon module — `waltz_grid.py`
- Dance-floor rectangle (landscape box within the portrait page) with a faint positioning grid in `neutral`; numbered position dots (default 16, configurable count) in `primary`.
- Below the floor: 8 write-in count lines labeled from translation keys ("Count 1–8" / "Conteo 1–8").
- Two page variants: entrance formation and vals formation (differ only in title key).
- Used by: Music & Waltz tab (2 pages) + Vals & Choreography Kit.

### 6. Build + QA — Royal Blue & Gold only
- Generate the full planner from the Royal Blue & Gold recipe with `quince_content.json` merged in.
- QA checklist: every page links to all 12 tabs + dashboard; EN↔ES toggle works on every page; the 5 ES-overflow surfaces from QUINCE-ARCH-001 §4 render clean (checklist rows, budget headers, role badges, venue-comparison headers, playlist labels); `highlight` color never sits behind body text; ornaments render in `metallic`/`ink` only.
- Test open in GoodNotes on iPhone, a stock Android PDF viewer, and desktop Acrobat.

## Acceptance criteria (reviewer checks all)
1. Translation table complete: zero empty ES cells (enforced by the build check), abbreviation keys present for all badge strings.
2. `grep` of `quince_content.json` and both new modules finds zero hex codes.
3. Tiara renders correctly on all three launch palettes and matches existing ornament stroke style side-by-side.
4. Royal Blue & Gold PDF: no dead links, toggle on every page, all 5 flagged ES surfaces clean, checkboxes ≥ 5 mm.
5. Both modules produce identical layout across colorways (spot-check by swapping the recipe).
6. A one-paragraph plain-language note to the owner explaining how to regenerate the PDF herself.

## Out of scope for this slice
Black & Gold and Fiesta SKU generation (Slice 2, trivial once RB&G passes) · printables extraction · kit assembly (Slice 3) · Etsy listing production (Slice 4) · the remaining 7 colorways (v1.1) · Padrinos and Day-Of kits (v1.2).

## Slice roadmap after this
- **Slice 2:** generate + QA Black & Gold and Mexican Heritage Fiesta; switch all recipes to `cover_ornament: "tiara"`.
- **Slice 3:** assemble Court of Honor Kit and Vals & Choreography Kit from the shared content blocks via `kit_builder.py`.
- **Slice 4:** listing production per QUINCE-ARCH-001 marketing notes (first three images: toggle demo, court roster spread, ceremony-order page).
<<<<<<<<<< END FILE: quince/BRIEF-Q15-001.md >>>>>>>>>>

<<<<<<<<<< BEGIN FILE: quince/QUINCE-ARCH-001.md >>>>>>>>>>
# QUINCE-ARCH-001 — Bilingual Quinceañera Digital Planner
_Full product architecture · Built for the existing Planner Factory pipeline (Python/ReportLab, recipe-driven) · Etsy digital download, no hosting, no accounts · v1.0_

---

## Outcome first

You're shipping **one shared content structure that powers 10 launch-ready colorway SKUs**: a ~110-page-per-language, hyperlinked, tabbed, fillable **AND** printable Quinceañera Planner in English + Spanish with a per-page toggle — the exact combination no Etsy competitor offers (they top out at 45–95 pages, English-only, print-only). The moat isn't the colorways; it's **court-of-honor + padrinos depth, quince-specific traditions coverage (vals, última muñeca, cambio de zapatos, coronación), and true bilingual navigation**. Around it: **4 standalone add-on kits** that upsell individually and roll into a deluxe bundle, mirroring the Sage & Rose ladder. Roughly 80% of pages build as typed `extra_pages` (no code); two custom addon modules are needed (court roster, waltz formation grid); and **yes — build the tiara cover ornament** (spec below). Price at or above the top of the current quince listing range; the listing headline earns it.

---

## 1. Product vision

The only quinceañera planner on Etsy that works the way real quince planning works: **bilingually, across a whole family**. One purchase, one PDF — mamá plans the budget in Spanish, the quinceañera builds her court and vals in English, and every page toggles between the two with one tap. It's a full hyperlinked digital planner for GoodNotes/Notability on any device *and* a print-ready US Letter planner in the same file, with the deepest court-of-honor, padrinos/madrinas, and traditions coverage in the category — the sections every competitor skips and every family actually fights over. Ten premium colorways, from Royal Blue & Gold to Mexican Heritage Fiesta, all from one locked design system.

**Core promise (listing language):** *"Everything for her quince, in both languages, on every device — from padrinos to the last waltz."*

---

## 2. User roles

| Role | Primary sections | Notes |
|---|---|---|
| **The quinceañera** (teen) | Theme & decor, moodboard, dress, court roster, vals & choreography, playlist | Most likely to use it digitally on a phone — phone-size legibility gates on her pages |
| **Mother / lead planner** | Checklist, budget, guest list & RSVP, vendors, venue & mass, day-of timeline | Most likely to print; the printable set is largely *her* set |
| **Padrinos & madrinas** | Padrinos assignment + contribution pages (often shown/shared, not owned) | These pages get photographed and texted — must read standalone, both languages visible logic below |
| **Tías, godparents, helpers** | Guest list, food & cake, decor tasks, recuerdos | Checkbox-heavy, low-text pages |
| **Mixed-language households** | Everything | The defining buyer. One household, two languages, one PDF — this is the listing's first image |

---

## 3. Page & tab architecture

Mirrors the existing side-tabs + dashboard structure. **12 tabs** — the proven max that stays tappable at phone width. Tab labels are locked to ≤ 12 characters in *both* languages (ES length audit inline).

**Dashboard block (before tabs):** Cover → How to use / Cómo usar (1 pg) → Event Overview & Countdown (1 pg) → Tab index.

| # | Tab EN | Tab ES | Pages inside | Core / Kit overlap |
|---|---|---|---|---|
| 1 | Checklist | Pendientes | 12–9 mo · 8–6 · 5–3 · 2–1 · month-of · week-of · day-before (7 pgs, dueOffsetDays pattern) | Core |
| 2 | Budget | Presupuesto | Budget summary · category worksheets ×2 · payment tracker · padrinos contribution cross-ref (5 pgs) | Core |
| 3 | Guests | Invitados | Guest list ×4 (25 rows ea) · RSVP tracker · invitation timeline · seating chart (7 pgs) | Core |
| 4 | Court | Corte | Court overview · damas roster · chambelanes roster · padrinos/madrinas assignments ×2 · measurements & fittings · rehearsal attendance (7 pgs) | **Core + spins into Kits 1 & 3** |
| 5 | Attire | Vestuario | Dress vision · fitting log · accessories (tiara, shoes for the cambio, jewelry) · damas dress coordination (4 pgs) | Core |
| 6 | Church & Venue | Misa y Salón | Mass planning (readings, ofrendas, church requirements) · venue comparison · venue detail · layout notes (4 pgs) | Core |
| 7 | Vendors | Proveedores | Vendor comparison · vendor detail cards ×3 · contracts & deposits log (5 pgs) | Core |
| 8 | Food & Cake | Comida | Menu planner · catering quotes · cake design · drinks & brindis (4 pgs) | Core |
| 9 | Music & Waltz | Música y Vals | DJ/band planner · playlist (entrada, vals, father-daughter, surprise dance) · choreography planner ×2 · rehearsal schedule (5 pgs) | **Core + spins into Kit 2** |
| 10 | Decor | Decoración | Theme board · color palette · centerpieces · recuerdos/favors · photo inspiration/moodboard ×2 (6 pgs) | Core |
| 11 | The Big Day | El Gran Día | Run-of-show timeline ×2 · ceremony order (coronación, cambio de zapatos, última muñeca, brindis) · day-of vendor contacts · emergency kit checklist (5 pgs) | **Core + spins into Kit 4** |
| 12 | Notes | Notas | Lined ×2 · dot grid ×2 · documents log · gift tracker (6 pgs) | Core |

**Per language: ~61 content pages + dashboard block.** With EN + ES built into one PDF (existing toggle system): ~125+ total pages — comfortably above the 95-page competitor ceiling, and every page is *navigable*, which none of them are.

**ES tab-length audit:** "Presupuesto" (11) ✓ · "Proveedores" (11) ✓ · "Misa y Salón" (12) ✓ · "El Gran Día" (11) ✓ · "Decoración" (10) ✓ · "Pendientes" (10) ✓. Nothing exceeds 12 chars; no tab redesign needed.

---

## 4. Page-by-page content spec

Legend: **T** = typed fields (lines) · **C** = checkbox · **F** = free space / open box · **⚠ES** = Spanish-length risk on fixed elements.

**Dashboard**
- *How to use* — text page: toggle explanation, tab map, print notes. Both languages. No fields.
- *Event overview* — T: name, date, church, venue, theme, colors, court size; F: one-line vision. Countdown ring is decorative (no live math in a PDF — it's a fill-in "days to go" line, framed warmly).

**1 · Checklist** — 7 chronological pages, each: C rows (18–22/page) + T "due by" column + F margin notes. Content pre-written (not blank) — this is a differentiator; competitor checklists are generic wedding lists with "bride" swapped out. ⚠ES: checklist row text is the highest-risk overflow surface; cap EN strings at ~55 chars so ES fits one line.

**2 · Budget** — Summary: T category/estimate/actual/paid table + totals row. Category worksheets: T itemized rows grouped (attire, venue, food, music, decor, photo, transport, church). Payment tracker: T vendor/amount/due/paid-C. **Padrinos contribution cross-ref: T padrino name → sponsored item → amount → linked C "confirmed"** — the page that makes this planner different. ⚠ES: column headers ("Cantidad", "Pagado") — verify at table column widths.

**3 · Guests** — Guest list: T name/count/side/phone + C invited/confirmed. RSVP tracker: T + tally boxes. Invitation timeline: C milestones with dueOffsetDays alignment. Seating chart: reuse the existing seating module if Sage & Rose has one; otherwise round-table diagram page (see modules, §8).

**4 · Court** — Overview: T counts + F pairing map. Damas/chambelanes rosters: T name/phone/pair/dress-suit size + C confirmed/measured/fitted/rehearsed (the 4-checkbox status strip is the signature of these pages). Padrinos pages: T name/relationship/sponsored item/contact + C asked/confirmed/thanked. Measurements page: T grid. Rehearsal attendance: C grid (names × dates). ⚠ES: role labels ("Chambelán de honor") in badge elements — badges must autosize or use abbreviations defined in the translation table.

**5 · Attire** — Dress vision: F sketch/paste box + T details. Fitting log: T date/location/notes ×6 rows. Accessories: C + T (explicitly includes **flats + heels for the cambio de zapatos**). Damas coordination: T color/style/vendor/deadline.

**6 · Church & Venue** — Mass planning: T readings/readers/music/ofrendas + C church requirement checkboxes (baptism & communion certificates, pláticas — real requirements competitor planners omit). Venue comparison: T 3-column grid. ⚠ES: comparison column headers.

**7 · Vendors** — Comparison grid (3 quotes side-by-side): T. Vendor cards: T contact/quote/deposit/balance/due + C booked/paid. Contracts log: T + C received.

**8 · Food & Cake** — Menu: T courses + C dietary flags. Cake: F design box + T tiers/flavors/servings. Brindis page: T toast giver + F toast draft space (sweet, shareable — photographs well in listings).

**9 · Music & Waltz** — Playlist pages: T song/artist/moment. Choreography: **formation grid module** (numbered positions) + T count/step lines. Rehearsal schedule: T date/location + C attendance link to Court tab. ⚠ES: "Vals de sorpresa" vs "Surprise dance" labels — fine at line width.

**10 · Decor** — Theme board: F. Palette: 5 open swatch circles + T hex/name lines (meta: customers write their own colors *inside* your colorway — nice). Centerpieces/recuerdos: T + C quantity/assembled. Moodboard: F full-bleed paste pages.

**11 · The Big Day** — Run-of-show: T time/moment/who/notes rows, pre-seeded with the traditional order as light placeholder text (entrada, brindis, vals, cambio de zapatos, última muñeca, baile sorpresa, cake). Ceremony order page doubles as a **traditions explainer** — 2–3 lines each on what/why, both languages. This page is marketing gold: screenshot it for the listing. Emergency kit: C list (quince-specific: bobby pins, hem tape, flats, phone chargers, sewing kit, stain pen, snacks for the court).

**12 · Notes** — Standard. Gift tracker: T gift/from + C thank-you sent.

---

## 5. Printable template set

All portrait unless noted. Every printable ships in **decorative** (colorway ornaments, tinted headers) and **minimal** (ink-only rules) versions — the minimal version *is* the B&W-friendly version, so no third variant is needed.

| Printable | Orientation | B&W notes | Decorative + minimal? |
|---|---|---|---|
| Budget worksheet | Portrait | Table rules in `ink` only; no tinted fills behind write-in cells | Yes |
| Guest list sheet | Portrait | High row count; keep checkboxes ≥ 5 mm for pen use | Yes |
| Vendor comparison | **Landscape** | 3 columns need the width | Yes |
| Master checklist (condensed) | Portrait ×2 | Pure ink; this is the fridge-door page | Yes |
| Court member planner | Portrait | Status checkboxes must survive B&W — use shape (☐/✓) not color | Yes |
| Padrinos assignment sheet | Portrait | Shared/photographed — put both EN & ES *on the same sheet* (split header) for this one only | Yes |
| Day-of timeline | Portrait | Time column in `ink`, generous row height for handwriting | Yes |
| Seating chart | **Landscape** | Table circles as outlines, not fills | Yes |
| Gift & thank-you tracker | Portrait | Simple | Minimal only |
| Notes page | Portrait | Simple | Minimal only |

---

## 6. Add-on kit proposals (4 — same format as the existing 25)

| Kit | Contents (~pages) | Why it sells alone |
|---|---|---|
| **1 · Padrinos & Madrinas Kit** | Assignment planner, sponsorship item menu (traditional list: vals shoes, tiara, último muñeca, cake, limo…), contribution tracker, "how to ask" scripts EN/ES, thank-you tracker (~14) | The genuine category gap you identified. Also the kit an *aunt* buys as a gift — a second buyer persona for the same content |
| **2 · Vals & Choreography Kit** | Song shortlist, formation grids ×6, count sheets, rehearsal calendar, choreographer vendor card, day-of music cue sheet (~12) | Searched independently ("quinceanera waltz planner" has listings ranking with almost no competition) |
| **3 · Court of Honor Kit** | Rosters, measurement grids, fitting schedule, rehearsal attendance, court contact sheet, group-communication template (~12) | The coordination headache that involves 14+ teenagers; sells to the mom of a dama too |
| **4 · Quince Day-Of Kit** | Run-of-show, ceremony order + traditions explainer, emergency checklist, vendor day-of contacts, "hand this to your MC" sheet (~10) | Impulse-priced late-stage purchase — catches buyers whose quince is in 3 weeks and who won't buy a full planner |

Launch priority: **1 and 2 first** (widest gap + independent search demand), 3 and 4 as fast follows. All four bundle into the **Deluxe Quince Bundle** (planner + 4 kits), mirroring Sage & Rose's ladder: printable planner → digital planner → deluxe bundle → mega PDF.

---

## 7. Design direction (palettes locked — confirmation + typography + motifs)

All 10 read premium **provided two guardrails hold**: (a) `highlight` colors never sit behind body text — fills and thin bands only; (b) ornament linework stays in `metallic` or `ink`, never `accent`. Palette-by-palette:

| Edition | Premium check | Typography (existing style option) | Motif notes (no new drawing infra) |
|---|---|---|---|
| Royal Blue & Gold | ✓ Strongest — matches the #1 trend (~22% of quinces). Flagship SKU; build/QA here first | editorial | Arch ornament + gold hairline double-rules under page titles; starburst feel via letterspaced small-caps headers |
| Blush & Ivory | ✓ Watch: keep `#E8C9D0` fills ≤ 12% coverage or it drifts young | romantic | Wreath; rounded corner ticks on frames |
| Emerald & Gold | ✓ Reads luxe naturally | classic | Minimal; gold rules carry it |
| Sapphire & Silver | ✓ The "modern" outlier — good for winter quinces | modern | Minimal; wider margins, lighter rules |
| Burgundy & Gold | ✓ Rich; ensure `#6E1F2A` headers pass AA on `#FAF4F1` (they do at display sizes) | editorial | Arch |
| Lavender & Sage | ⚠ Highest scrapbook risk. Mitigate: romantic type + generous whitespace + metallic (not accent) ornaments | romantic | Wreath, thin |
| Mexican Heritage Fiesta | ✓ if disciplined: `#F4D35E` highlight is the loudest hex in the line — restrict to thin banner bands and tab fills. Papel picado is *suggested* via a scallop-edged header band in accent color (a rectangle row — no new drawing helpers), not literal cut-paper art | editorial | Arch + scallop band |
| Rose Gold & Blush | ✓ | romantic | Wreath |
| Black & Gold | ✓ Most premium of the ten; likely #2 seller. Ink `#0F0F10` on `#F7F5F0` is the best contrast in the line | classic | Minimal; this SKU proves the "not childish" positioning in listing photos |
| Champagne & Dusty Rose | ✓ House-brand adjacent (shares ProPlanners gold `#C0A062`) — the natural "signature edition" | romantic | Minimal; could carry a small tiara ornament as its only flourish |

### Cover ornament gap — recommendation: **build the tiara. It's worth it.**

Rationale: the tiara is *the* category icon (it appears in essentially every top quince listing's artwork), it goes on the cover of **10 SKUs at once**, and it's reusable for any future sweet-16 / pageant / birthday-crown line — the cost amortizes across the whole catalog. Build spec (consistent with existing line-art ornaments): five-point tiara as stroked arcs — a shallow base arc, five peaks (center tallest), a small circle finial on each peak — drawn in the `metallic` role at the same stroke weight as `arch`/`wreath`, ~2:1 width:height, centered above the title block. No fills, no gradients — pure linework, so it inherits every colorway automatically.

Interim mapping if you defer it (matches the recipes as locked): editorial → arch · romantic → wreath · classic/modern → minimal. But given 10 covers, I'd build it before generating final SKUs — it's one drawing helper.

---

## 8. Recipe & content structure (write once, drop into all 10)

**One shared content file** — `quince_content.json` — merged into each of the 10 recipes unchanged. Colors only ever referenced by role (`primary`, `accent`, `metallic`, `highlight`, `neutral`, `background`, `ink`).

**Translation key convention:** `q15.<tab>.<page>.<element>` (e.g. `q15.court.padrinos.col_sponsored`, `q15.bigday.ceremony.tradition_muneca_body`). One flat table, EN + ES columns, no untranslated key ships (see §11). Abbreviation sub-keys for badge-constrained strings: `q15.court.roles.chambelan_abbr`.

**Typed `extra_pages` (no code) — ~80% of the planner:**
- All 7 checklist pages (checklist block + dueOffsetDays)
- All budget pages except none — full tab is tracker/form blocks
- Guest list, RSVP, invitation timeline (tracker/checklist)
- Padrinos assignment + contributions (tracker)
- All attire, venue/mass, vendors, food, decor, notes, gift-tracker pages (form/tracker/checklist/notes)
- Playlist + rehearsal schedule pages
- Run-of-show, ceremony order (form + text blocks), emergency kit (checklist)
- How-to-use + traditions explainer (text blocks)

**Custom addon modules (code) — 2, maybe 1:**
1. `court_roster.py` — multi-column roster with the 4-state checkbox strip (confirmed/measured/fitted/rehearsed) and role badges with abbreviation fallback. Used on 4 pages + Kit 1/3.
2. `waltz_grid.py` — formation diagram: dance-floor rectangle + 16 numbered position dots + count lines beneath. Used on 2 pages + Kit 2.
3. Seating chart — **reuse the existing Sage & Rose seating module if one exists** (check `kits_library.py` first); only build if it doesn't.

Everything else that *looks* custom (scallop band, swatch circles, countdown frame) composes from existing drawing helpers per the motif notes above.

---

## 9. MVP vs later

| Phase | Contents |
|---|---|
| **MVP — first listing** | Full planner, EN+ES toggle, digital (hyperlinked) + printable in one product, all 12 tabs, minimal-version printables included, **launch in 3 colorways**: Royal Blue & Gold, Black & Gold, Mexican Heritage Fiesta (covers the three trend clusters: #1 theme, premium, heritage). Fewer SKUs at launch = cleaner reviews concentration and faster listing-photo production |
| **v1.1 (weeks, not months)** | Remaining 7 colorways (recipes are done — this is QA + listing photos, not build) · decorative printable variants · Kit 1 (Padrinos) + Kit 2 (Vals) |
| **v2 / upsell** | Kits 3 + 4 · Deluxe Bundle (planner + 4 kits) · Mega Quince PDF · "signature edition" push on Champagne & Dusty Rose cross-promoted from the wedding line |

---

## 10. Build sequence (using the existing pipeline)

1. **Translation table first.** Write all `q15.*` strings EN+ES before any page work — bilingual completeness becomes a build input, not a QA scramble. This is also where the 55-char checklist cap and badge abbreviations get enforced.
2. **Typed `extra_pages`** for the full core planner, built and iterated in **one recipe only** (Royal Blue & Gold).
3. **`court_roster.py` module** (highest differentiation, unblocks Court tab + Kits 1/3).
4. **`waltz_grid.py` module** (+ seating-chart reuse check).
5. **Tiara ornament** helper (pending your go — see decision list).
6. **Generate all 10 recipes**, visual QA pass per §7 guardrails (highlight coverage, ornament roles, ES overflow).
7. **Printables extraction** (minimal versions for MVP).
8. **Kits 1–2 assembly** from the shared content blocks.
9. **Etsy listings** — see marketing notes.

---

## 11. Acceptance criteria — "done well" means

**Bilingual completeness**
- Zero keys missing an ES value (script-enforced: build fails on empty translation cell).
- No fixed element (tab, badge, table header, checkbox row) clips or wraps badly in ES — verified on the 5 flagged surfaces (§4 ⚠ES) at final render.
- A native-Spanish read-through of the full ES side (not machine-check only) — quince vocabulary is regional; "damas," "chambelanes," "recuerdos" must read natural, not translated.

**Print quality**
- US Letter, safe margins respected on every page; minimal printables legible in pure B&W laser test print; checkboxes ≥ 5 mm.

**Hyperlink/tab integrity**
- Every page links to all 12 tabs + dashboard; toggle works on every page; tested in GoodNotes (iPhone + iPad), a stock Android PDF viewer, and desktop Acrobat. No dead links (link-check pass on final PDFs).

**Visual consistency**
- All 10 SKUs render from identical content with zero hardcoded hexes (grep the content file); §7 guardrails hold (highlight-behind-text = never; ornaments in metallic/ink only).

**Differentiation / premium pricing justified**
- Page count ≥ 110/language (beats the 95-page ceiling); listing demonstrably shows the three things no competitor has: bilingual toggle, hyperlinked navigation on phone, court/padrinos depth. If the first three listing images don't communicate all three, the listing isn't done.

---

## Marketing notes (smart defaults — adjust to your Sage & Rose price points)

- **Price above the category top**, not within it: competitors sell thin, English-only, print-only. You're not selling a comparable at a premium; you're selling a different product. Ladder mirrors your existing line: printable → digital → deluxe bundle → mega.
- **Listing title pattern:** "Quinceañera Planner Bilingual English Spanish | Digital + Printable | GoodNotes iPad iPhone | Court of Honor, Padrinos, Vals | Royal Blue & Gold" — front-loads the three differentiators as search terms.
- **First three listing images:** (1) phone in-hand showing tabs + toggle mid-flip EN↔ES, (2) the padrinos assignment spread, (3) the ceremony-order/traditions page. These *are* the moat; show them before any flat-lay.
- **SEO seeds (both languages):** quinceanera planner, quince planner, planificador de quinceañera, quinceanera checklist, court of honor, padrinos madrinas, vals quinceañera, quinceanera digital download.
- **Review flywheel:** the traditions-explainer page and "how to ask a padrino" scripts are the pages buyers screenshot and share — they're your organic marketing, which is why they're in MVP, not v2.

---

## Owner decisions needed (everything else above is decided)

1. **Tiara ornament:** approve the build (recommended) or ship on the existing arch/wreath/minimal mapping.
2. **Launch SKU count:** 3 colorways first (recommended) or all 10 on day one.
3. **First two kits:** Padrinos + Vals (recommended) or a different pair.
<<<<<<<<<< END FILE: quince/QUINCE-ARCH-001.md >>>>>>>>>>

<<<<<<<<<< BEGIN FILE: quince/Q15-INDEX.md >>>>>>>>>>
# Q15-INDEX — Quinceañera Planner Project Map
_Drop this in the repo as `quince/README.md`. It is the single source of truth for what exists, what order things happen in, and what's blocking. Updated 2026-07-20._

## Status at a glance

**Every deliverable that can be produced without the owner's review or repo access is DONE.** The pipeline is written end to end. Two human/executor steps remain, in strict order:

1. 🔴 **BLOCKING — Owner:** Spanish review via `Q15-ES-REVIEW.md` (Section A's 14 judgment calls, then a Section B skim). Nothing renders before this.
2. 🟡 **Executor (Claude Code or equivalent, with repo access):** run `BRIEF-Q15-001.md`. Scope already reduced to: schema-map the content draft, wrap the three provided drawing functions, swap fonts, build + QA Royal Blue & Gold.

After those two: Slice 2 (generate Black & Gold + Fiesta) → listing photos from real renders → 3 listings live within 48 hours → v1.1 (7 colorways + 2 kits + bundle).

## Artifact map

| File | What it is | Who uses it |
|---|---|---|
| `QUINCE-ARCH-001.md` | Full product architecture — vision, 12-tab page system, printables, kits, design confirmation, MVP phasing, acceptance criteria, marketing strategy | Owner (reference) + Executor (context) |
| `BRIEF-Q15-001.md` | Executor build brief, Slice 1 — includes DECISIONS.log entries D-019–D-021 to paste | Executor |
| `q15_translations.json` | All 293 EN/ES strings — the master translation table. ⚠️ DRAFT until owner review lands | Executor ingests after owner sign-off |
| `Q15-ES-REVIEW.md` | The owner's review document — 14 judgment calls + full side-by-side tables. **THE CURRENT BLOCKER** | Owner, ~10 minutes |
| `quince_content_draft.json` | Canonical page structure — all 61 pages, block types, key refs, dueOffsetDays, kit extraction map. Content decisions final; executor maps field names only | Executor |
| `q15_modules.py` | Working ReportLab code: tiara ornament, court roster, waltz grid — adapter-style with integration notes | Executor (thin wrappers + fonts) |
| `render_proof.py` | Rebuilds the visual proof from the modules | Executor / Owner |
| `Q15-MODULE-PROOF.pdf` | 4-page visual proof — tiara on 3 palettes, EN + ES rosters (badge fallback proven live), vals grid | Owner approval of the signature pages |
| `Q15-LISTINGS-001.md` | Launch listing copy — 3 planner SKUs: titles, descriptions, tags, 10-image shot list, video, pricing, launch-week checklist | Owner at launch |
| `Q15-KIT-LISTINGS-001.md` | v1.1 listing copy — Court Kit, Vals Kit, Deluxe Bundle | Owner at v1.1 |

## DECISIONS.log — paste block (consolidated)

```
2026-07-20 · D-019 · Tiara cover ornament approved; added to factory ornament set. All 10 quince recipes switch to cover_ornament: tiara. — Owner
2026-07-20 · D-020 · Launch with 3 colorways: Royal Blue & Gold, Black & Gold, Mexican Heritage Fiesta. Remaining 7 in v1.1. — Owner
2026-07-20 · D-021 · First kits: Court of Honor + Vals & Choreography (matching the two custom modules 1:1). Padrinos + Day-Of kits → v1.2. — Owner
2026-07-20 · D-022 · Module drawing code (tiara, court_roster, waltz_grid) authored by architect with rendered visual proof; executor scope reduced to signature wrappers, font swap, and build. — Architect
2026-07-20 · D-023 · Translation table authored by architect in Mexican-family Spanish; 14 regional judgment calls escalated to owner via Q15-ES-REVIEW.md. Owner review gates all rendering. — Architect
```

## Handoff sequence (exact)

1. Owner completes `Q15-ES-REVIEW.md` → sends key-level changes in chat → architect patches `q15_translations.json` and re-issues.
2. Owner gives executor: `BRIEF-Q15-001.md` + final `q15_translations.json` + `quince_content_draft.json` + `q15_modules.py` (+ repo access).
3. Executor delivers Royal Blue & Gold PDF passing the brief's acceptance criteria → owner eyeballs against `Q15-MODULE-PROOF.pdf`.
4. Owner says "ProPlanners: next slice" → Slice 2 QA plan + remaining-SKU generation.
5. Listings go live per `Q15-LISTINGS-001.md` launch-week checklist.

## Open items owed to the architect (me), when you're ready
- Your Section A verdicts + any Section B changes (patch turnaround: same conversation).
- `planner_factory.py` pasted in chat OR temporary repo access, if you want me to do the exact schema integration instead of the executor.
- Any visual adjustments to the proof PDF (tiara shape, row heights, dot layout) before executor handoff.
<<<<<<<<<< END FILE: quince/Q15-INDEX.md >>>>>>>>>>

<<<<<<<<<< BEGIN FILE: quince/q15_translations.json >>>>>>>>>>
{
  "_meta": {
    "product": "Quinceañera Planner — bilingual EN/ES",
    "brief": "BRIEF-Q15-001 step 1",
    "status": "FINAL (v1.1) — Section A judgment calls resolved by owner 2026-07-20: zapatos bajos/tacones, banquete (no taquiza), Planificador de XV Años. Remaining 11 calls ship with architect defaults per owner agreement. Optional: owner Section B skim of traditions passages.",
    "rules": "Checklist EN rows ≤ 55 chars. Badge strings have _abbr fallbacks. No key may ship with an empty es value.",
    "executor_note": "Ingest as the q15 translation table. Do not rewrite strings; flag structural gaps only."
  },
  "q15.common.toggle_en": {
    "en": "EN",
    "es": "EN"
  },
  "q15.common.toggle_es": {
    "en": "ES",
    "es": "ES"
  },
  "q15.common.home": {
    "en": "Home",
    "es": "Inicio"
  },
  "q15.common.notes": {
    "en": "Notes",
    "es": "Notas"
  },
  "q15.common.date": {
    "en": "Date",
    "es": "Fecha"
  },
  "q15.common.name": {
    "en": "Name",
    "es": "Nombre"
  },
  "q15.common.phone": {
    "en": "Phone",
    "es": "Teléfono"
  },
  "q15.common.email": {
    "en": "Email",
    "es": "Correo"
  },
  "q15.common.yes": {
    "en": "Yes",
    "es": "Sí"
  },
  "q15.common.no": {
    "en": "No",
    "es": "No"
  },
  "q15.common.total": {
    "en": "Total",
    "es": "Total"
  },
  "q15.common.amount": {
    "en": "Amount",
    "es": "Cantidad"
  },
  "q15.common.estimate": {
    "en": "Estimate",
    "es": "Estimado"
  },
  "q15.common.actual": {
    "en": "Actual",
    "es": "Real"
  },
  "q15.common.paid": {
    "en": "Paid",
    "es": "Pagado"
  },
  "q15.common.due": {
    "en": "Due",
    "es": "Vence"
  },
  "q15.common.deposit": {
    "en": "Deposit",
    "es": "Anticipo"
  },
  "q15.common.balance": {
    "en": "Balance",
    "es": "Saldo"
  },
  "q15.common.vendor": {
    "en": "Vendor",
    "es": "Proveedor"
  },
  "q15.common.confirmed": {
    "en": "Confirmed",
    "es": "Confirmado"
  },
  "q15.common.time": {
    "en": "Time",
    "es": "Hora"
  },
  "q15.common.location": {
    "en": "Location",
    "es": "Lugar"
  },
  "q15.common.quantity": {
    "en": "Qty",
    "es": "Cant."
  },
  "q15.common.details": {
    "en": "Details",
    "es": "Detalles"
  },
  "q15.tabs.checklist": {
    "en": "Checklist",
    "es": "Pendientes"
  },
  "q15.tabs.budget": {
    "en": "Budget",
    "es": "Presupuesto"
  },
  "q15.tabs.guests": {
    "en": "Guests",
    "es": "Invitados"
  },
  "q15.tabs.court": {
    "en": "Court",
    "es": "Corte"
  },
  "q15.tabs.attire": {
    "en": "Attire",
    "es": "Vestuario"
  },
  "q15.tabs.venue": {
    "en": "Church & Venue",
    "es": "Misa y Salón"
  },
  "q15.tabs.vendors": {
    "en": "Vendors",
    "es": "Proveedores"
  },
  "q15.tabs.food": {
    "en": "Food & Cake",
    "es": "Comida"
  },
  "q15.tabs.music": {
    "en": "Music & Waltz",
    "es": "Música y Vals"
  },
  "q15.tabs.decor": {
    "en": "Decor",
    "es": "Decoración"
  },
  "q15.tabs.bigday": {
    "en": "The Big Day",
    "es": "El Gran Día"
  },
  "q15.tabs.notes": {
    "en": "Notes",
    "es": "Notas"
  },
  "q15.dash.cover_title": {
    "en": "Quinceañera Planner",
    "es": "Planificador de XV Años"
  },
  "q15.dash.cover_subtitle": {
    "en": "Her day, planned with love",
    "es": "Su día, planeado con amor"
  },
  "q15.dash.howto_title": {
    "en": "How to use this planner",
    "es": "Cómo usar este planificador"
  },
  "q15.dash.howto_body_1": {
    "en": "Tap any tab on the side of the page to jump straight to that section — it works in GoodNotes, Notability, and any PDF app on your phone, tablet, or computer.",
    "es": "Toca cualquier pestaña al lado de la página para ir directo a esa sección — funciona en GoodNotes, Notability y cualquier app de PDF en tu teléfono, tableta o computadora."
  },
  "q15.dash.howto_body_2": {
    "en": "Every page has an EN/ES button so anyone in the family can plan in the language they love. Same planner, both languages, one purchase.",
    "es": "Cada página tiene un botón EN/ES para que cada persona de la familia planee en el idioma que prefiera. El mismo planificador, dos idiomas, una sola compra."
  },
  "q15.dash.howto_body_3": {
    "en": "Want paper? Every page prints beautifully on US Letter. The Notes tab has extra pages for everything else.",
    "es": "¿Prefieres papel? Cada página se imprime perfecto en tamaño carta. La sección de Notas tiene páginas extra para todo lo demás."
  },
  "q15.dash.overview_title": {
    "en": "Our celebration",
    "es": "Nuestra celebración"
  },
  "q15.dash.field_quinceanera": {
    "en": "The quinceañera",
    "es": "La quinceañera"
  },
  "q15.dash.field_date": {
    "en": "The big day",
    "es": "El gran día"
  },
  "q15.dash.field_church": {
    "en": "Church",
    "es": "Iglesia"
  },
  "q15.dash.field_venue": {
    "en": "Venue",
    "es": "Salón"
  },
  "q15.dash.field_theme": {
    "en": "Theme",
    "es": "Tema"
  },
  "q15.dash.field_colors": {
    "en": "Our colors",
    "es": "Nuestros colores"
  },
  "q15.dash.field_court_size": {
    "en": "Court size",
    "es": "Tamaño de la corte"
  },
  "q15.dash.field_vision": {
    "en": "In one line, how her day should feel",
    "es": "En una línea, cómo debe sentirse su día"
  },
  "q15.dash.countdown_label": {
    "en": "Days to go",
    "es": "Días restantes"
  },
  "q15.checklist.title": {
    "en": "Planning checklist",
    "es": "Lista de pendientes"
  },
  "q15.checklist.col_due": {
    "en": "Due by",
    "es": "Fecha límite"
  },
  "q15.checklist.phase_12_9": {
    "en": "12–9 months before",
    "es": "12–9 meses antes"
  },
  "q15.checklist.phase_8_6": {
    "en": "8–6 months before",
    "es": "8–6 meses antes"
  },
  "q15.checklist.phase_5_3": {
    "en": "5–3 months before",
    "es": "5–3 meses antes"
  },
  "q15.checklist.phase_2_1": {
    "en": "2–1 months before",
    "es": "2–1 meses antes"
  },
  "q15.checklist.phase_month": {
    "en": "The month of",
    "es": "El mes del evento"
  },
  "q15.checklist.phase_week": {
    "en": "The week of",
    "es": "La semana del evento"
  },
  "q15.checklist.phase_daybefore": {
    "en": "The day before",
    "es": "Un día antes"
  },
  "q15.checklist.r001": {
    "en": "Set the date",
    "es": "Elegir la fecha"
  },
  "q15.checklist.r002": {
    "en": "Set the total budget together",
    "es": "Definir el presupuesto total en familia"
  },
  "q15.checklist.r003": {
    "en": "Draft the guest count",
    "es": "Calcular el número de invitados"
  },
  "q15.checklist.r004": {
    "en": "Reserve the church and the misa",
    "es": "Reservar la iglesia y la misa"
  },
  "q15.checklist.r005": {
    "en": "Tour and book the venue",
    "es": "Visitar y reservar el salón"
  },
  "q15.checklist.r006": {
    "en": "Choose the theme and colors",
    "es": "Elegir el tema y los colores"
  },
  "q15.checklist.r007": {
    "en": "Make the padrinos and madrinas list",
    "es": "Hacer la lista de padrinos y madrinas"
  },
  "q15.checklist.r008": {
    "en": "Invite damas and chambelanes",
    "es": "Invitar a las damas y los chambelanes"
  },
  "q15.checklist.r009": {
    "en": "Start researching photographers",
    "es": "Empezar a buscar fotógrafos"
  },
  "q15.checklist.r010": {
    "en": "Start researching DJs and bands",
    "es": "Empezar a buscar DJ o grupo"
  },
  "q15.checklist.r011": {
    "en": "Start researching caterers",
    "es": "Empezar a buscar el banquete"
  },
  "q15.checklist.r012": {
    "en": "Begin dress shopping and inspiration",
    "es": "Empezar a buscar el vestido e inspiración"
  },
  "q15.checklist.r013": {
    "en": "Ask padrinos about sponsored items",
    "es": "Hablar con los padrinos sobre sus apoyos"
  },
  "q15.checklist.r014": {
    "en": "Open a savings plan for the quince",
    "es": "Abrir un plan de ahorro para los XV"
  },
  "q15.checklist.r015": {
    "en": "Check church requirements early",
    "es": "Revisar los requisitos de la iglesia"
  },
  "q15.checklist.r016": {
    "en": "Book the photographer and video",
    "es": "Contratar fotógrafo y video"
  },
  "q15.checklist.r017": {
    "en": "Book the DJ or band",
    "es": "Contratar DJ o grupo"
  },
  "q15.checklist.r018": {
    "en": "Book the caterer or plan the menu",
    "es": "Contratar el banquete o planear el menú"
  },
  "q15.checklist.r019": {
    "en": "Order or commission the dress",
    "es": "Encargar el vestido"
  },
  "q15.checklist.r020": {
    "en": "Choose the damas' dresses",
    "es": "Elegir los vestidos de las damas"
  },
  "q15.checklist.r021": {
    "en": "Choose the chambelanes' outfits",
    "es": "Elegir los trajes de los chambelanes"
  },
  "q15.checklist.r022": {
    "en": "Book the choreographer for the vals",
    "es": "Contratar coreógrafo para el vals"
  },
  "q15.checklist.r023": {
    "en": "Confirm the full court of honor",
    "es": "Confirmar la corte de honor completa"
  },
  "q15.checklist.r024": {
    "en": "Send save-the-dates",
    "es": "Enviar las pre-invitaciones"
  },
  "q15.checklist.r025": {
    "en": "Book the florist",
    "es": "Contratar la florería"
  },
  "q15.checklist.r026": {
    "en": "Schedule cake tastings",
    "es": "Agendar degustaciones de pastel"
  },
  "q15.checklist.r027": {
    "en": "Book the limo or party bus",
    "es": "Reservar limusina o transporte"
  },
  "q15.checklist.r028": {
    "en": "Confirm padrinos' sponsored items",
    "es": "Confirmar los apoyos de los padrinos"
  },
  "q15.checklist.r029": {
    "en": "Choose the vals and surprise dance songs",
    "es": "Elegir canciones del vals y baile sorpresa"
  },
  "q15.checklist.r030": {
    "en": "Book hair and makeup artist",
    "es": "Contratar peinado y maquillaje"
  },
  "q15.checklist.r031": {
    "en": "Order the invitations",
    "es": "Encargar las invitaciones"
  },
  "q15.checklist.r032": {
    "en": "Finalize the menu and drinks",
    "es": "Definir el menú y las bebidas"
  },
  "q15.checklist.r033": {
    "en": "First dress fitting",
    "es": "Primera prueba del vestido"
  },
  "q15.checklist.r034": {
    "en": "Start vals rehearsals with the court",
    "es": "Empezar ensayos del vals con la corte"
  },
  "q15.checklist.r035": {
    "en": "Order the recuerdos",
    "es": "Encargar los recuerdos"
  },
  "q15.checklist.r036": {
    "en": "Complete church classes (pláticas)",
    "es": "Completar las pláticas de la iglesia"
  },
  "q15.checklist.r037": {
    "en": "Gather baptism and communion certificates",
    "es": "Reunir actas de bautizo y comunión"
  },
  "q15.checklist.r038": {
    "en": "Order the cake",
    "es": "Encargar el pastel"
  },
  "q15.checklist.r039": {
    "en": "Take court measurements for attire",
    "es": "Tomar medidas de la corte para el vestuario"
  },
  "q15.checklist.r040": {
    "en": "Plan centerpieces and decor details",
    "es": "Planear centros de mesa y decoración"
  },
  "q15.checklist.r041": {
    "en": "Buy the tiara and accessories",
    "es": "Comprar la tiara y los accesorios"
  },
  "q15.checklist.r042": {
    "en": "Buy flats and heels for the shoe change",
    "es": "Comprar zapatos bajos y tacones para el cambio"
  },
  "q15.checklist.r043": {
    "en": "Buy the last doll (última muñeca)",
    "es": "Comprar la última muñeca"
  },
  "q15.checklist.r044": {
    "en": "Hair and makeup trial",
    "es": "Prueba de peinado y maquillaje"
  },
  "q15.checklist.r045": {
    "en": "Send the invitations",
    "es": "Enviar las invitaciones"
  },
  "q15.checklist.r046": {
    "en": "Track RSVPs weekly",
    "es": "Registrar confirmaciones cada semana"
  },
  "q15.checklist.r047": {
    "en": "Final dress fitting",
    "es": "Prueba final del vestido"
  },
  "q15.checklist.r048": {
    "en": "Court attire fittings",
    "es": "Pruebas de vestuario de la corte"
  },
  "q15.checklist.r049": {
    "en": "Build the seating chart",
    "es": "Armar el acomodo de mesas"
  },
  "q15.checklist.r050": {
    "en": "Weekly vals rehearsals",
    "es": "Ensayos del vals cada semana"
  },
  "q15.checklist.r051": {
    "en": "Confirm timeline with every vendor",
    "es": "Confirmar horarios con cada proveedor"
  },
  "q15.checklist.r052": {
    "en": "Confirm the misa details with the church",
    "es": "Confirmar los detalles de la misa"
  },
  "q15.checklist.r053": {
    "en": "Plan the brindis and who gives the toast",
    "es": "Planear el brindis y quién lo dará"
  },
  "q15.checklist.r054": {
    "en": "Order or assemble table numbers and signs",
    "es": "Preparar números de mesa y letreros"
  },
  "q15.checklist.r055": {
    "en": "Schedule final payments",
    "es": "Agendar los pagos finales"
  },
  "q15.checklist.r056": {
    "en": "Confirm transport pickup times",
    "es": "Confirmar horarios del transporte"
  },
  "q15.checklist.r057": {
    "en": "Give the final headcount to the caterer",
    "es": "Dar el número final de invitados al banquete"
  },
  "q15.checklist.r058": {
    "en": "Reconfirm every vendor in writing",
    "es": "Reconfirmar cada proveedor por escrito"
  },
  "q15.checklist.r059": {
    "en": "Make final payments on schedule",
    "es": "Hacer los pagos finales a tiempo"
  },
  "q15.checklist.r060": {
    "en": "Print the day-of timeline for helpers",
    "es": "Imprimir el itinerario para los ayudantes"
  },
  "q15.checklist.r061": {
    "en": "Assemble the emergency kit",
    "es": "Armar el kit de emergencia"
  },
  "q15.checklist.r062": {
    "en": "Full dress rehearsal with the court",
    "es": "Ensayo general con la corte"
  },
  "q15.checklist.r063": {
    "en": "Pick up the dress and steam it",
    "es": "Recoger el vestido y plancharlo a vapor"
  },
  "q15.checklist.r064": {
    "en": "Finish the seating chart and place cards",
    "es": "Terminar el acomodo y tarjetas de lugar"
  },
  "q15.checklist.r065": {
    "en": "Confirm hair and makeup schedule",
    "es": "Confirmar horarios de peinado y maquillaje"
  },
  "q15.checklist.r066": {
    "en": "Break in the heels at home",
    "es": "Ablandar los tacones en casa"
  },
  "q15.checklist.r067": {
    "en": "Deliver decor and recuerdos to the venue",
    "es": "Llevar decoración y recuerdos al salón"
  },
  "q15.checklist.r068": {
    "en": "Confirm delivery times for cake and flowers",
    "es": "Confirmar entrega del pastel y las flores"
  },
  "q15.checklist.r069": {
    "en": "Final venue walkthrough",
    "es": "Recorrido final del salón"
  },
  "q15.checklist.r070": {
    "en": "Share the day-of contact sheet",
    "es": "Compartir la hoja de contactos del día"
  },
  "q15.checklist.r071": {
    "en": "Manicure and self-care day",
    "es": "Manicure y día de cuidado personal"
  },
  "q15.checklist.r072": {
    "en": "Charge phones, cameras, and speakers",
    "es": "Cargar teléfonos, cámaras y bocinas"
  },
  "q15.checklist.r073": {
    "en": "Pack a bag for the court's day-of items",
    "es": "Preparar la bolsa de la corte para el día"
  },
  "q15.checklist.r074": {
    "en": "Run the entrance one more time",
    "es": "Ensayar la entrada una vez más"
  },
  "q15.checklist.r075": {
    "en": "Lay out every attire piece, labeled",
    "es": "Dejar listo todo el vestuario, etiquetado"
  },
  "q15.checklist.r076": {
    "en": "Pack the emergency kit in the car",
    "es": "Poner el kit de emergencia en el carro"
  },
  "q15.checklist.r077": {
    "en": "Confirm tomorrow's pickup times by text",
    "es": "Confirmar por mensaje los horarios de mañana"
  },
  "q15.checklist.r078": {
    "en": "Eat well and drink plenty of water",
    "es": "Comer bien y tomar mucha agua"
  },
  "q15.checklist.r079": {
    "en": "Early night — tomorrow is her day",
    "es": "Dormir temprano — mañana es su gran día"
  },
  "q15.budget.title_summary": {
    "en": "Budget at a glance",
    "es": "Presupuesto general"
  },
  "q15.budget.title_detail": {
    "en": "Budget worksheets",
    "es": "Hojas de presupuesto"
  },
  "q15.budget.title_payments": {
    "en": "Payment tracker",
    "es": "Control de pagos"
  },
  "q15.budget.title_padrinos": {
    "en": "Padrinos' contributions",
    "es": "Apoyos de los padrinos"
  },
  "q15.budget.col_category": {
    "en": "Category",
    "es": "Categoría"
  },
  "q15.budget.cat_attire": {
    "en": "Attire & beauty",
    "es": "Vestuario y belleza"
  },
  "q15.budget.cat_venue": {
    "en": "Venue & rentals",
    "es": "Salón y renta"
  },
  "q15.budget.cat_church": {
    "en": "Church",
    "es": "Iglesia"
  },
  "q15.budget.cat_food": {
    "en": "Food & cake",
    "es": "Comida y pastel"
  },
  "q15.budget.cat_music": {
    "en": "Music & entertainment",
    "es": "Música y entretenimiento"
  },
  "q15.budget.cat_photo": {
    "en": "Photo & video",
    "es": "Foto y video"
  },
  "q15.budget.cat_decor": {
    "en": "Decor & flowers",
    "es": "Decoración y flores"
  },
  "q15.budget.cat_paper": {
    "en": "Invitations & paper",
    "es": "Invitaciones y papelería"
  },
  "q15.budget.cat_transport": {
    "en": "Transportation",
    "es": "Transporte"
  },
  "q15.budget.cat_recuerdos": {
    "en": "Recuerdos & favors",
    "es": "Recuerdos"
  },
  "q15.budget.cat_misc": {
    "en": "Extras & just-in-case",
    "es": "Extras e imprevistos"
  },
  "q15.budget.padrinos_col_sponsor": {
    "en": "Padrino / Madrina",
    "es": "Padrino / Madrina"
  },
  "q15.budget.padrinos_col_item": {
    "en": "Sponsored item",
    "es": "Apoyo"
  },
  "q15.budget.padrinos_note": {
    "en": "A padrino's gift is part of her story — track it here and thank them on the Notes tab.",
    "es": "El apoyo de un padrino es parte de su historia — anótalo aquí y agradécele en la sección de Notas."
  },
  "q15.guests.title_list": {
    "en": "Guest list",
    "es": "Lista de invitados"
  },
  "q15.guests.title_rsvp": {
    "en": "RSVP tracker",
    "es": "Control de confirmaciones"
  },
  "q15.guests.title_invites": {
    "en": "Invitation timeline",
    "es": "Plan de invitaciones"
  },
  "q15.guests.title_seating": {
    "en": "Seating chart",
    "es": "Acomodo de mesas"
  },
  "q15.guests.col_party": {
    "en": "Guests in party",
    "es": "Personas"
  },
  "q15.guests.col_side": {
    "en": "Family / friends",
    "es": "Familia / amigos"
  },
  "q15.guests.col_invited": {
    "en": "Invited",
    "es": "Invitado"
  },
  "q15.guests.col_attending": {
    "en": "Attending",
    "es": "Asistirá"
  },
  "q15.guests.table_label": {
    "en": "Table",
    "es": "Mesa"
  },
  "q15.court.title_overview": {
    "en": "Court of honor",
    "es": "Corte de honor"
  },
  "q15.court.title_damas": {
    "en": "Damas",
    "es": "Damas"
  },
  "q15.court.title_chambelanes": {
    "en": "Chambelanes",
    "es": "Chambelanes"
  },
  "q15.court.title_padrinos": {
    "en": "Padrinos & madrinas",
    "es": "Padrinos y madrinas"
  },
  "q15.court.title_measurements": {
    "en": "Measurements & fittings",
    "es": "Medidas y pruebas"
  },
  "q15.court.title_rehearsals": {
    "en": "Rehearsal attendance",
    "es": "Asistencia a ensayos"
  },
  "q15.court.roles.dama": {
    "en": "Dama",
    "es": "Dama"
  },
  "q15.court.roles.dama_abbr": {
    "en": "Dama",
    "es": "Dama"
  },
  "q15.court.roles.dama_honor": {
    "en": "Dama of honor",
    "es": "Dama de honor"
  },
  "q15.court.roles.dama_honor_abbr": {
    "en": "D. honor",
    "es": "D. honor"
  },
  "q15.court.roles.chambelan": {
    "en": "Chambelán",
    "es": "Chambelán"
  },
  "q15.court.roles.chambelan_abbr": {
    "en": "Chamb.",
    "es": "Chamb."
  },
  "q15.court.roles.chambelan_honor": {
    "en": "Chambelán of honor",
    "es": "Chambelán de honor"
  },
  "q15.court.roles.chambelan_honor_abbr": {
    "en": "Ch. honor",
    "es": "Ch. honor"
  },
  "q15.court.status_confirmed": {
    "en": "Confirmed",
    "es": "Confirmado"
  },
  "q15.court.status_measured": {
    "en": "Measured",
    "es": "Medidas"
  },
  "q15.court.status_fitted": {
    "en": "Fitted",
    "es": "Prueba"
  },
  "q15.court.status_rehearsed": {
    "en": "Rehearsed",
    "es": "Ensayo"
  },
  "q15.court.col_pair": {
    "en": "Paired with",
    "es": "Pareja"
  },
  "q15.court.col_size": {
    "en": "Size",
    "es": "Talla"
  },
  "q15.court.padrinos_col_relationship": {
    "en": "Relationship",
    "es": "Parentesco"
  },
  "q15.court.padrinos_status_asked": {
    "en": "Asked",
    "es": "Invitado"
  },
  "q15.court.padrinos_status_confirmed": {
    "en": "Confirmed",
    "es": "Confirmado"
  },
  "q15.court.padrinos_status_thanked": {
    "en": "Thanked",
    "es": "Agradecido"
  },
  "q15.attire.title_dress": {
    "en": "The dress",
    "es": "El vestido"
  },
  "q15.attire.title_fittings": {
    "en": "Fitting log",
    "es": "Registro de pruebas"
  },
  "q15.attire.title_accessories": {
    "en": "Accessories",
    "es": "Accesorios"
  },
  "q15.attire.title_damas": {
    "en": "Damas' attire",
    "es": "Vestuario de las damas"
  },
  "q15.attire.dress_vision": {
    "en": "Her dream dress — sketch it, paste it, describe it",
    "es": "El vestido de sus sueños — dibújalo, pégalo, descríbelo"
  },
  "q15.attire.acc_tiara": {
    "en": "Tiara or crown",
    "es": "Tiara o corona"
  },
  "q15.attire.acc_flats": {
    "en": "Flats (for the ceremony)",
    "es": "Zapatos bajos (para la ceremonia)"
  },
  "q15.attire.acc_heels": {
    "en": "Heels (for the shoe change)",
    "es": "Tacones (para el cambio de zapatos)"
  },
  "q15.attire.acc_jewelry": {
    "en": "Jewelry",
    "es": "Joyería"
  },
  "q15.attire.acc_doll": {
    "en": "Última muñeca",
    "es": "Última muñeca"
  },
  "q15.attire.acc_bouquet": {
    "en": "Bouquet or ramo",
    "es": "Ramo"
  },
  "q15.venue.title_mass": {
    "en": "The misa",
    "es": "La misa"
  },
  "q15.venue.title_compare": {
    "en": "Venue comparison",
    "es": "Comparación de salones"
  },
  "q15.venue.title_detail": {
    "en": "Our venue",
    "es": "Nuestro salón"
  },
  "q15.venue.title_layout": {
    "en": "Layout notes",
    "es": "Notas del acomodo"
  },
  "q15.venue.mass_readings": {
    "en": "Readings & readers",
    "es": "Lecturas y lectores"
  },
  "q15.venue.mass_music": {
    "en": "Music for the misa",
    "es": "Música para la misa"
  },
  "q15.venue.mass_ofrendas": {
    "en": "Ofrendas & who carries them",
    "es": "Ofrendas y quién las lleva"
  },
  "q15.venue.mass_req_baptism": {
    "en": "Baptism certificate",
    "es": "Acta de bautizo"
  },
  "q15.venue.mass_req_communion": {
    "en": "First communion certificate",
    "es": "Acta de primera comunión"
  },
  "q15.venue.mass_req_platicas": {
    "en": "Preparation classes (pláticas)",
    "es": "Pláticas de preparación"
  },
  "q15.venue.compare_col_capacity": {
    "en": "Capacity",
    "es": "Capacidad"
  },
  "q15.venue.compare_col_included": {
    "en": "What's included",
    "es": "Qué incluye"
  },
  "q15.venue.compare_col_price": {
    "en": "Price",
    "es": "Precio"
  },
  "q15.vendors.title_compare": {
    "en": "Vendor comparison",
    "es": "Comparación de proveedores"
  },
  "q15.vendors.title_cards": {
    "en": "Our vendors",
    "es": "Nuestros proveedores"
  },
  "q15.vendors.title_contracts": {
    "en": "Contracts & deposits",
    "es": "Contratos y anticipos"
  },
  "q15.vendors.col_service": {
    "en": "Service",
    "es": "Servicio"
  },
  "q15.vendors.col_quote": {
    "en": "Quote",
    "es": "Cotización"
  },
  "q15.vendors.status_booked": {
    "en": "Booked",
    "es": "Contratado"
  },
  "q15.vendors.status_contract": {
    "en": "Contract received",
    "es": "Contrato recibido"
  },
  "q15.food.title_menu": {
    "en": "The menu",
    "es": "El menú"
  },
  "q15.food.title_quotes": {
    "en": "Catering quotes",
    "es": "Cotizaciones de banquete"
  },
  "q15.food.title_cake": {
    "en": "The cake",
    "es": "El pastel"
  },
  "q15.food.title_drinks": {
    "en": "Drinks & the brindis",
    "es": "Bebidas y el brindis"
  },
  "q15.food.cake_tiers": {
    "en": "Tiers",
    "es": "Pisos"
  },
  "q15.food.cake_flavors": {
    "en": "Flavors",
    "es": "Sabores"
  },
  "q15.food.cake_servings": {
    "en": "Servings",
    "es": "Porciones"
  },
  "q15.food.brindis_who": {
    "en": "Who gives the toast",
    "es": "Quién da el brindis"
  },
  "q15.food.brindis_space": {
    "en": "A few words worth keeping",
    "es": "Unas palabras que vale la pena guardar"
  },
  "q15.food.dietary": {
    "en": "Allergies & dietary notes",
    "es": "Alergias y notas de alimentación"
  },
  "q15.music.title_dj": {
    "en": "DJ or band",
    "es": "DJ o grupo"
  },
  "q15.music.title_playlist": {
    "en": "The playlist",
    "es": "Lista de canciones"
  },
  "q15.music.title_choreo": {
    "en": "Choreography planner",
    "es": "Plan de coreografía"
  },
  "q15.music.title_rehearsals": {
    "en": "Rehearsal schedule",
    "es": "Calendario de ensayos"
  },
  "q15.music.moment_entrance": {
    "en": "Grand entrance",
    "es": "Entrada triunfal"
  },
  "q15.music.moment_vals": {
    "en": "The vals",
    "es": "El vals"
  },
  "q15.music.moment_father": {
    "en": "Father-daughter dance",
    "es": "Baile con papá"
  },
  "q15.music.moment_surprise": {
    "en": "Surprise dance",
    "es": "Baile sorpresa"
  },
  "q15.music.col_song": {
    "en": "Song",
    "es": "Canción"
  },
  "q15.music.col_artist": {
    "en": "Artist",
    "es": "Artista"
  },
  "q15.music.col_moment": {
    "en": "Moment",
    "es": "Momento"
  },
  "q15.music.grid_title_entrance": {
    "en": "Entrance formation",
    "es": "Formación de entrada"
  },
  "q15.music.grid_title_vals": {
    "en": "Vals formation",
    "es": "Formación del vals"
  },
  "q15.music.count_label": {
    "en": "Count 1–8",
    "es": "Conteo 1–8"
  },
  "q15.decor.title_theme": {
    "en": "Theme board",
    "es": "Tablero del tema"
  },
  "q15.decor.title_palette": {
    "en": "Our color palette",
    "es": "Nuestra paleta de colores"
  },
  "q15.decor.title_centerpieces": {
    "en": "Centerpieces",
    "es": "Centros de mesa"
  },
  "q15.decor.title_recuerdos": {
    "en": "Recuerdos & favors",
    "es": "Recuerdos"
  },
  "q15.decor.title_moodboard": {
    "en": "Inspiration",
    "es": "Inspiración"
  },
  "q15.decor.status_assembled": {
    "en": "Assembled",
    "es": "Armado"
  },
  "q15.decor.moodboard_hint": {
    "en": "Paste photos, fabric, anything that feels like her day",
    "es": "Pega fotos, telas, todo lo que se sienta como su día"
  },
  "q15.bigday.title_timeline": {
    "en": "Run of show",
    "es": "Itinerario del día"
  },
  "q15.bigday.title_ceremony": {
    "en": "The traditions, in order",
    "es": "Las tradiciones, en orden"
  },
  "q15.bigday.title_contacts": {
    "en": "Day-of contacts",
    "es": "Contactos del día"
  },
  "q15.bigday.title_emergency": {
    "en": "Emergency kit",
    "es": "Kit de emergencia"
  },
  "q15.bigday.col_moment": {
    "en": "Moment",
    "es": "Momento"
  },
  "q15.bigday.col_who": {
    "en": "Who",
    "es": "Quién"
  },
  "q15.bigday.tl_entrance": {
    "en": "Grand entrance",
    "es": "Entrada triunfal"
  },
  "q15.bigday.tl_brindis": {
    "en": "Brindis",
    "es": "Brindis"
  },
  "q15.bigday.tl_vals": {
    "en": "Vals",
    "es": "Vals"
  },
  "q15.bigday.tl_shoes": {
    "en": "Cambio de zapatos",
    "es": "Cambio de zapatos"
  },
  "q15.bigday.tl_doll": {
    "en": "Última muñeca",
    "es": "Última muñeca"
  },
  "q15.bigday.tl_surprise": {
    "en": "Surprise dance",
    "es": "Baile sorpresa"
  },
  "q15.bigday.tl_cake": {
    "en": "Cake cutting",
    "es": "Partida de pastel"
  },
  "q15.bigday.trad_corona_title": {
    "en": "La coronación — the crowning",
    "es": "La coronación"
  },
  "q15.bigday.trad_corona_body": {
    "en": "A madrina, her mother, or her grandmother places the tiara on her head — a crown for the young woman she is becoming, in front of everyone who loves her.",
    "es": "Una madrina, su mamá o su abuela le coloca la tiara — una corona para la mujer en la que se está convirtiendo, frente a todos los que la quieren."
  },
  "q15.bigday.trad_shoes_title": {
    "en": "El cambio de zapatos — the shoe change",
    "es": "El cambio de zapatos"
  },
  "q15.bigday.trad_shoes_body": {
    "en": "Her father, or someone who has walked beside her, kneels to change her flats for her first pair of heels. Her first steps as a young woman are taken in front of her family.",
    "es": "Su papá, o alguien que ha caminado a su lado, se arrodilla para cambiarle los zapatos bajos por sus primeros tacones. Sus primeros pasos como señorita los da frente a su familia."
  },
  "q15.bigday.trad_doll_title": {
    "en": "La última muñeca — the last doll",
    "es": "La última muñeca"
  },
  "q15.bigday.trad_doll_body": {
    "en": "She receives — and often passes on — a final doll, a tender goodbye to childhood. Many families gift it to a younger sister, cousin, or goddaughter.",
    "es": "Recibe — y muchas veces entrega — una última muñeca, una tierna despedida de la infancia. Muchas familias se la regalan a una hermana menor, prima o ahijada."
  },
  "q15.bigday.trad_vals_title": {
    "en": "El vals — the waltz",
    "es": "El vals"
  },
  "q15.bigday.trad_vals_body": {
    "en": "The dance she and her court have rehearsed for months. The room goes quiet, the music starts, and this is the moment everyone remembers.",
    "es": "El baile que ella y su corte ensayaron durante meses. El salón guarda silencio, empieza la música, y este es el momento que nadie olvida."
  },
  "q15.bigday.trad_brindis_title": {
    "en": "El brindis — the toast",
    "es": "El brindis"
  },
  "q15.bigday.trad_brindis_body": {
    "en": "A parent, padrino, or grandparent raises a glass to her — words of pride, blessing, and love, spoken out loud so she never forgets them.",
    "es": "Un padre, padrino o abuelo levanta la copa por ella — palabras de orgullo, bendición y cariño, dichas en voz alta para que nunca las olvide."
  },
  "q15.bigday.ek_pins": {
    "en": "Bobby pins & hair spray",
    "es": "Pasadores y spray para el cabello"
  },
  "q15.bigday.ek_hemtape": {
    "en": "Hem tape & safety pins",
    "es": "Cinta para dobladillo y seguros"
  },
  "q15.bigday.ek_sewing": {
    "en": "Mini sewing kit",
    "es": "Mini costurero"
  },
  "q15.bigday.ek_stain": {
    "en": "Stain remover pen",
    "es": "Pluma quitamanchas"
  },
  "q15.bigday.ek_flats": {
    "en": "Extra flats for dancing",
    "es": "Zapatos bajos extra para bailar"
  },
  "q15.bigday.ek_chargers": {
    "en": "Phone chargers & power bank",
    "es": "Cargadores y batería portátil"
  },
  "q15.bigday.ek_snacks": {
    "en": "Snacks & water for the court",
    "es": "Botanas y agua para la corte"
  },
  "q15.bigday.ek_makeup": {
    "en": "Touch-up makeup & blotting papers",
    "es": "Maquillaje para retoques"
  },
  "q15.bigday.ek_bandaids": {
    "en": "Band-aids & pain reliever",
    "es": "Curitas y analgésico"
  },
  "q15.bigday.ek_tissues": {
    "en": "Tissues — someone will cry",
    "es": "Pañuelos — alguien va a llorar"
  },
  "q15.notes.title_lined": {
    "en": "Notes",
    "es": "Notas"
  },
  "q15.notes.title_docs": {
    "en": "Documents log",
    "es": "Registro de documentos"
  },
  "q15.notes.title_gifts": {
    "en": "Gifts & thank-yous",
    "es": "Regalos y agradecimientos"
  },
  "q15.notes.col_gift": {
    "en": "Gift",
    "es": "Regalo"
  },
  "q15.notes.col_from": {
    "en": "From",
    "es": "De parte de"
  },
  "q15.notes.col_thanked": {
    "en": "Thank-you sent",
    "es": "Agradecimiento enviado"
  }
}
<<<<<<<<<< END FILE: quince/q15_translations.json >>>>>>>>>>

<<<<<<<<<< BEGIN FILE: quince/quince_content_draft.json >>>>>>>>>>
{
  "_meta": {
    "product": "Quinceañera Planner — bilingual EN/ES",
    "brief": "BRIEF-Q15-001 step 2 (content authoring portion)",
    "status": "CANONICAL DRAFT — page structure, block types, key references, and row allocations are final content decisions. The executor's only job here is a mechanical transform: map these blocks onto the factory's actual extra_pages schema (field names may differ; content and order may not). Flag — do not fix — anything that cannot be represented.",
    "depends_on": "q15_translations.json (all keys referenced below must resolve; build fails on a missing key)",
    "block_types": {
      "text": "static text page; body is a list of translation keys rendered as paragraphs",
      "form": "labeled write-in fields; kind = line | box | multiline",
      "checklist": "checkbox rows from translation keys + due-by column + notes margin",
      "tracker": "table with column keys and blank write-in rows",
      "notes": "lined | dotgrid | freespace",
      "addon_module": "rendered by a custom .py module; params passed through"
    }
  },

  "tab_order": ["checklist", "budget", "guests", "court", "attire", "venue", "vendors", "food", "music", "decor", "bigday", "notes"],

  "dashboard": [
    { "id": "cover", "type": "cover", "title_key": "q15.dash.cover_title", "subtitle_key": "q15.dash.cover_subtitle", "ornament": "tiara" },
    { "id": "howto", "type": "text", "title_key": "q15.dash.howto_title", "body": ["q15.dash.howto_body_1", "q15.dash.howto_body_2", "q15.dash.howto_body_3"] },
    { "id": "overview", "type": "form", "title_key": "q15.dash.overview_title", "fields": [
      { "label_key": "q15.dash.field_quinceanera", "kind": "line" },
      { "label_key": "q15.dash.field_date", "kind": "line" },
      { "label_key": "q15.dash.field_church", "kind": "line" },
      { "label_key": "q15.dash.field_venue", "kind": "line" },
      { "label_key": "q15.dash.field_theme", "kind": "line" },
      { "label_key": "q15.dash.field_colors", "kind": "line" },
      { "label_key": "q15.dash.field_court_size", "kind": "line" },
      { "label_key": "q15.dash.field_vision", "kind": "multiline" },
      { "label_key": "q15.dash.countdown_label", "kind": "line", "note": "decorative countdown frame around this field; write-in, no live math" }
    ]}
  ],

  "pages": [

    { "id": "checklist_12_9", "tab": "checklist", "type": "checklist", "title_key": "q15.checklist.phase_12_9", "due_offset_days": -270,
      "rows": ["q15.checklist.r001","q15.checklist.r002","q15.checklist.r003","q15.checklist.r004","q15.checklist.r005","q15.checklist.r006","q15.checklist.r007","q15.checklist.r008","q15.checklist.r009","q15.checklist.r010","q15.checklist.r011","q15.checklist.r012","q15.checklist.r013","q15.checklist.r014","q15.checklist.r015"] },
    { "id": "checklist_8_6", "tab": "checklist", "type": "checklist", "title_key": "q15.checklist.phase_8_6", "due_offset_days": -180,
      "rows": ["q15.checklist.r016","q15.checklist.r017","q15.checklist.r018","q15.checklist.r019","q15.checklist.r020","q15.checklist.r021","q15.checklist.r022","q15.checklist.r023","q15.checklist.r024","q15.checklist.r025","q15.checklist.r026","q15.checklist.r027","q15.checklist.r028","q15.checklist.r029","q15.checklist.r030"] },
    { "id": "checklist_5_3", "tab": "checklist", "type": "checklist", "title_key": "q15.checklist.phase_5_3", "due_offset_days": -90,
      "rows": ["q15.checklist.r031","q15.checklist.r032","q15.checklist.r033","q15.checklist.r034","q15.checklist.r035","q15.checklist.r036","q15.checklist.r037","q15.checklist.r038","q15.checklist.r039","q15.checklist.r040","q15.checklist.r041","q15.checklist.r042","q15.checklist.r043","q15.checklist.r044"] },
    { "id": "checklist_2_1", "tab": "checklist", "type": "checklist", "title_key": "q15.checklist.phase_2_1", "due_offset_days": -30,
      "rows": ["q15.checklist.r045","q15.checklist.r046","q15.checklist.r047","q15.checklist.r048","q15.checklist.r049","q15.checklist.r050","q15.checklist.r051","q15.checklist.r052","q15.checklist.r053","q15.checklist.r054","q15.checklist.r055","q15.checklist.r056"] },
    { "id": "checklist_month", "tab": "checklist", "type": "checklist", "title_key": "q15.checklist.phase_month", "due_offset_days": -14,
      "rows": ["q15.checklist.r057","q15.checklist.r058","q15.checklist.r059","q15.checklist.r060","q15.checklist.r061","q15.checklist.r062","q15.checklist.r063","q15.checklist.r064","q15.checklist.r065","q15.checklist.r066"] },
    { "id": "checklist_week", "tab": "checklist", "type": "checklist", "title_key": "q15.checklist.phase_week", "due_offset_days": -7,
      "rows": ["q15.checklist.r067","q15.checklist.r068","q15.checklist.r069","q15.checklist.r070","q15.checklist.r071","q15.checklist.r072","q15.checklist.r073","q15.checklist.r074"] },
    { "id": "checklist_daybefore", "tab": "checklist", "type": "checklist", "title_key": "q15.checklist.phase_daybefore", "due_offset_days": -1,
      "rows": ["q15.checklist.r075","q15.checklist.r076","q15.checklist.r077","q15.checklist.r078","q15.checklist.r079"] },

    { "id": "budget_summary", "tab": "budget", "type": "tracker", "title_key": "q15.budget.title_summary",
      "columns": ["q15.budget.col_category", "q15.common.estimate", "q15.common.actual", "q15.common.paid"],
      "rows_from_keys": ["q15.budget.cat_attire","q15.budget.cat_venue","q15.budget.cat_church","q15.budget.cat_food","q15.budget.cat_music","q15.budget.cat_photo","q15.budget.cat_decor","q15.budget.cat_paper","q15.budget.cat_transport","q15.budget.cat_recuerdos","q15.budget.cat_misc"],
      "totals_row": true },
    { "id": "budget_detail_1", "tab": "budget", "type": "tracker", "title_key": "q15.budget.title_detail",
      "columns": ["q15.common.details", "q15.common.vendor", "q15.common.estimate", "q15.common.actual"], "blank_rows": 20 },
    { "id": "budget_detail_2", "tab": "budget", "type": "tracker", "title_key": "q15.budget.title_detail",
      "columns": ["q15.common.details", "q15.common.vendor", "q15.common.estimate", "q15.common.actual"], "blank_rows": 20 },
    { "id": "budget_payments", "tab": "budget", "type": "tracker", "title_key": "q15.budget.title_payments",
      "columns": ["q15.common.vendor", "q15.common.amount", "q15.common.due", "q15.common.paid"], "blank_rows": 18, "checkbox_column": "q15.common.paid" },
    { "id": "budget_padrinos", "tab": "budget", "type": "tracker", "title_key": "q15.budget.title_padrinos",
      "columns": ["q15.budget.padrinos_col_sponsor", "q15.budget.padrinos_col_item", "q15.common.amount", "q15.common.confirmed"],
      "blank_rows": 14, "checkbox_column": "q15.common.confirmed", "footer_text_key": "q15.budget.padrinos_note" },

    { "id": "guests_list_1", "tab": "guests", "type": "tracker", "title_key": "q15.guests.title_list",
      "columns": ["q15.common.name", "q15.guests.col_party", "q15.guests.col_side", "q15.common.phone", "q15.guests.col_invited", "q15.guests.col_attending"],
      "blank_rows": 25, "checkbox_columns": ["q15.guests.col_invited", "q15.guests.col_attending"] },
    { "id": "guests_list_2", "tab": "guests", "type": "tracker", "inherit": "guests_list_1" },
    { "id": "guests_list_3", "tab": "guests", "type": "tracker", "inherit": "guests_list_1" },
    { "id": "guests_list_4", "tab": "guests", "type": "tracker", "inherit": "guests_list_1" },
    { "id": "guests_rsvp", "tab": "guests", "type": "tracker", "title_key": "q15.guests.title_rsvp",
      "columns": ["q15.common.name", "q15.guests.col_party", "q15.common.yes", "q15.common.no", "q15.guests.table_label"], "blank_rows": 25 },
    { "id": "guests_invites", "tab": "guests", "type": "checklist", "title_key": "q15.guests.title_invites", "due_offset_days": -56,
      "rows": ["q15.checklist.r031", "q15.checklist.r045", "q15.checklist.r046"], "note": "invitation-specific milestone view; reuses checklist keys deliberately" },
    { "id": "guests_seating", "tab": "guests", "type": "addon_module", "module": "seating_chart", "title_key": "q15.guests.title_seating",
      "note": "REUSE the existing Sage & Rose seating module if present in kits_library.py; params: 12 round tables, table_label_key q15.guests.table_label. Only build new if absent." },

    { "id": "court_overview", "tab": "court", "type": "form", "title_key": "q15.court.title_overview", "fields": [
      { "label_key": "q15.dash.field_court_size", "kind": "line" },
      { "label_key": "q15.court.col_pair", "kind": "multiline", "note": "free pairing map space" }
    ]},
    { "id": "court_damas", "tab": "court", "type": "addon_module", "module": "court_roster", "title_key": "q15.court.title_damas",
      "params": { "role_keys": ["q15.court.roles.dama", "q15.court.roles.dama_honor"], "rows": 10,
        "status_keys": ["q15.court.status_confirmed","q15.court.status_measured","q15.court.status_fitted","q15.court.status_rehearsed"],
        "columns": ["q15.common.name","q15.common.phone","q15.court.col_pair","q15.court.col_size"] } },
    { "id": "court_chambelanes", "tab": "court", "type": "addon_module", "module": "court_roster", "title_key": "q15.court.title_chambelanes",
      "params": { "role_keys": ["q15.court.roles.chambelan", "q15.court.roles.chambelan_honor"], "rows": 10,
        "status_keys": ["q15.court.status_confirmed","q15.court.status_measured","q15.court.status_fitted","q15.court.status_rehearsed"],
        "columns": ["q15.common.name","q15.common.phone","q15.court.col_pair","q15.court.col_size"] } },
    { "id": "court_padrinos_1", "tab": "court", "type": "tracker", "title_key": "q15.court.title_padrinos",
      "columns": ["q15.common.name", "q15.court.padrinos_col_relationship", "q15.budget.padrinos_col_item", "q15.common.phone", "q15.court.padrinos_status_asked", "q15.court.padrinos_status_confirmed", "q15.court.padrinos_status_thanked"],
      "blank_rows": 12, "checkbox_columns": ["q15.court.padrinos_status_asked", "q15.court.padrinos_status_confirmed", "q15.court.padrinos_status_thanked"] },
    { "id": "court_padrinos_2", "tab": "court", "type": "tracker", "inherit": "court_padrinos_1" },
    { "id": "court_measurements", "tab": "court", "type": "tracker", "title_key": "q15.court.title_measurements",
      "columns": ["q15.common.name", "q15.court.col_size", "q15.common.date", "q15.common.notes"], "blank_rows": 16 },
    { "id": "court_rehearsals", "tab": "court", "type": "tracker", "title_key": "q15.court.title_rehearsals",
      "columns": ["q15.common.name"], "date_grid_columns": 8, "blank_rows": 16,
      "note": "attendance grid: name column + 8 blank date-header checkbox columns" },

    { "id": "attire_dress", "tab": "attire", "type": "form", "title_key": "q15.attire.title_dress", "fields": [
      { "label_key": "q15.attire.dress_vision", "kind": "box", "note": "large sketch/paste area" },
      { "label_key": "q15.common.vendor", "kind": "line" },
      { "label_key": "q15.common.amount", "kind": "line" }
    ]},
    { "id": "attire_fittings", "tab": "attire", "type": "tracker", "title_key": "q15.attire.title_fittings",
      "columns": ["q15.common.date", "q15.common.location", "q15.common.notes"], "blank_rows": 6 },
    { "id": "attire_accessories", "tab": "attire", "type": "checklist", "title_key": "q15.attire.title_accessories",
      "rows": ["q15.attire.acc_tiara","q15.attire.acc_flats","q15.attire.acc_heels","q15.attire.acc_jewelry","q15.attire.acc_doll","q15.attire.acc_bouquet"],
      "extra_blank_rows": 6 },
    { "id": "attire_damas", "tab": "attire", "type": "tracker", "title_key": "q15.attire.title_damas",
      "columns": ["q15.common.details", "q15.common.vendor", "q15.common.due", "q15.common.confirmed"], "blank_rows": 10, "checkbox_column": "q15.common.confirmed" },

    { "id": "venue_mass", "tab": "venue", "type": "form", "title_key": "q15.venue.title_mass", "fields": [
      { "label_key": "q15.dash.field_church", "kind": "line" },
      { "label_key": "q15.common.date", "kind": "line" },
      { "label_key": "q15.common.time", "kind": "line" },
      { "label_key": "q15.venue.mass_readings", "kind": "multiline" },
      { "label_key": "q15.venue.mass_music", "kind": "multiline" },
      { "label_key": "q15.venue.mass_ofrendas", "kind": "multiline" },
      { "label_key": "q15.venue.mass_req_baptism", "kind": "checkbox" },
      { "label_key": "q15.venue.mass_req_communion", "kind": "checkbox" },
      { "label_key": "q15.venue.mass_req_platicas", "kind": "checkbox" }
    ]},
    { "id": "venue_compare", "tab": "venue", "type": "tracker", "title_key": "q15.venue.title_compare",
      "columns": ["q15.common.name", "q15.venue.compare_col_capacity", "q15.venue.compare_col_included", "q15.venue.compare_col_price"], "blank_rows": 3, "row_height": "tall",
      "note": "3 tall comparison rows, not a dense table" },
    { "id": "venue_detail", "tab": "venue", "type": "form", "title_key": "q15.venue.title_detail", "fields": [
      { "label_key": "q15.common.name", "kind": "line" },
      { "label_key": "q15.common.phone", "kind": "line" },
      { "label_key": "q15.common.amount", "kind": "line" },
      { "label_key": "q15.common.deposit", "kind": "line" },
      { "label_key": "q15.common.balance", "kind": "line" },
      { "label_key": "q15.common.details", "kind": "multiline" }
    ]},
    { "id": "venue_layout", "tab": "venue", "type": "notes", "style": "freespace", "title_key": "q15.venue.title_layout" },

    { "id": "vendors_compare", "tab": "vendors", "type": "tracker", "title_key": "q15.vendors.title_compare",
      "columns": ["q15.vendors.col_service", "q15.common.name", "q15.vendors.col_quote", "q15.common.notes"], "blank_rows": 14 },
    { "id": "vendors_cards_1", "tab": "vendors", "type": "form", "title_key": "q15.vendors.title_cards", "repeat_blocks": 3, "fields": [
      { "label_key": "q15.vendors.col_service", "kind": "line" },
      { "label_key": "q15.common.name", "kind": "line" },
      { "label_key": "q15.common.phone", "kind": "line" },
      { "label_key": "q15.vendors.col_quote", "kind": "line" },
      { "label_key": "q15.common.deposit", "kind": "line" },
      { "label_key": "q15.common.due", "kind": "line" },
      { "label_key": "q15.vendors.status_booked", "kind": "checkbox" }
    ]},
    { "id": "vendors_cards_2", "tab": "vendors", "type": "form", "inherit": "vendors_cards_1" },
    { "id": "vendors_cards_3", "tab": "vendors", "type": "form", "inherit": "vendors_cards_1" },
    { "id": "vendors_contracts", "tab": "vendors", "type": "tracker", "title_key": "q15.vendors.title_contracts",
      "columns": ["q15.common.vendor", "q15.vendors.status_contract", "q15.common.deposit", "q15.common.balance", "q15.common.due"],
      "blank_rows": 12, "checkbox_column": "q15.vendors.status_contract" },

    { "id": "food_menu", "tab": "food", "type": "form", "title_key": "q15.food.title_menu", "fields": [
      { "label_key": "q15.common.details", "kind": "multiline", "note": "courses" },
      { "label_key": "q15.food.dietary", "kind": "multiline" }
    ]},
    { "id": "food_quotes", "tab": "food", "type": "tracker", "title_key": "q15.food.title_quotes",
      "columns": ["q15.common.name", "q15.common.amount", "q15.common.details", "q15.common.notes"], "blank_rows": 4, "row_height": "tall" },
    { "id": "food_cake", "tab": "food", "type": "form", "title_key": "q15.food.title_cake", "fields": [
      { "label_key": "q15.food.cake_tiers", "kind": "line" },
      { "label_key": "q15.food.cake_flavors", "kind": "line" },
      { "label_key": "q15.food.cake_servings", "kind": "line" },
      { "label_key": "q15.common.vendor", "kind": "line" },
      { "label_key": "q15.common.details", "kind": "box", "note": "cake design sketch/paste area" }
    ]},
    { "id": "food_drinks", "tab": "food", "type": "form", "title_key": "q15.food.title_drinks", "fields": [
      { "label_key": "q15.common.details", "kind": "multiline", "note": "drinks" },
      { "label_key": "q15.food.brindis_who", "kind": "line" },
      { "label_key": "q15.food.brindis_space", "kind": "multiline" }
    ]},

    { "id": "music_dj", "tab": "music", "type": "form", "title_key": "q15.music.title_dj", "fields": [
      { "label_key": "q15.common.name", "kind": "line" },
      { "label_key": "q15.common.phone", "kind": "line" },
      { "label_key": "q15.common.amount", "kind": "line" },
      { "label_key": "q15.common.time", "kind": "line" },
      { "label_key": "q15.common.notes", "kind": "multiline" }
    ]},
    { "id": "music_playlist", "tab": "music", "type": "tracker", "title_key": "q15.music.title_playlist",
      "columns": ["q15.music.col_moment", "q15.music.col_song", "q15.music.col_artist"],
      "seed_rows_from_keys": ["q15.music.moment_entrance", "q15.music.moment_vals", "q15.music.moment_father", "q15.music.moment_surprise"],
      "blank_rows": 14 },
    { "id": "music_choreo_entrance", "tab": "music", "type": "addon_module", "module": "waltz_grid", "title_key": "q15.music.grid_title_entrance",
      "params": { "dots": 16, "count_lines": 8, "count_label_key": "q15.music.count_label" } },
    { "id": "music_choreo_vals", "tab": "music", "type": "addon_module", "module": "waltz_grid", "title_key": "q15.music.grid_title_vals",
      "params": { "dots": 16, "count_lines": 8, "count_label_key": "q15.music.count_label" } },
    { "id": "music_rehearsals", "tab": "music", "type": "tracker", "title_key": "q15.music.title_rehearsals",
      "columns": ["q15.common.date", "q15.common.time", "q15.common.location", "q15.common.notes"], "blank_rows": 12 },

    { "id": "decor_theme", "tab": "decor", "type": "notes", "style": "freespace", "title_key": "q15.decor.title_theme" },
    { "id": "decor_palette", "tab": "decor", "type": "form", "title_key": "q15.decor.title_palette",
      "fields": [{ "label_key": "q15.common.details", "kind": "swatch_row", "note": "5 open swatch circles + name line each; compose from existing circle helper, outline in neutral" }] },
    { "id": "decor_centerpieces", "tab": "decor", "type": "tracker", "title_key": "q15.decor.title_centerpieces",
      "columns": ["q15.common.details", "q15.common.quantity", "q15.common.amount", "q15.decor.status_assembled"], "blank_rows": 10, "checkbox_column": "q15.decor.status_assembled" },
    { "id": "decor_recuerdos", "tab": "decor", "type": "tracker", "title_key": "q15.decor.title_recuerdos",
      "columns": ["q15.common.details", "q15.common.quantity", "q15.common.amount", "q15.decor.status_assembled"], "blank_rows": 10, "checkbox_column": "q15.decor.status_assembled" },
    { "id": "decor_mood_1", "tab": "decor", "type": "notes", "style": "freespace", "title_key": "q15.decor.title_moodboard", "hint_key": "q15.decor.moodboard_hint" },
    { "id": "decor_mood_2", "tab": "decor", "type": "notes", "style": "freespace", "title_key": "q15.decor.title_moodboard" },

    { "id": "bigday_timeline_1", "tab": "bigday", "type": "tracker", "title_key": "q15.bigday.title_timeline",
      "columns": ["q15.common.time", "q15.bigday.col_moment", "q15.bigday.col_who", "q15.common.notes"],
      "seed_rows_from_keys": ["q15.bigday.tl_entrance","q15.bigday.tl_brindis","q15.bigday.tl_vals","q15.bigday.tl_shoes","q15.bigday.tl_doll","q15.bigday.tl_surprise","q15.bigday.tl_cake"],
      "seed_style": "light placeholder in the moment column, overwritable", "blank_rows": 10 },
    { "id": "bigday_timeline_2", "tab": "bigday", "type": "tracker", "title_key": "q15.bigday.title_timeline",
      "columns": ["q15.common.time", "q15.bigday.col_moment", "q15.bigday.col_who", "q15.common.notes"], "blank_rows": 16 },
    { "id": "bigday_ceremony", "tab": "bigday", "type": "text", "title_key": "q15.bigday.title_ceremony",
      "body": ["q15.bigday.trad_corona_title","q15.bigday.trad_corona_body","q15.bigday.trad_shoes_title","q15.bigday.trad_shoes_body","q15.bigday.trad_vals_title","q15.bigday.trad_vals_body","q15.bigday.trad_doll_title","q15.bigday.trad_doll_body","q15.bigday.trad_brindis_title","q15.bigday.trad_brindis_body"],
      "body_style": "title keys render as small headers in primary; body keys as text in ink",
      "note": "MARKETING PAGE — this page gets screenshotted for listing image 3; give it the most generous layout in the planner" },
    { "id": "bigday_contacts", "tab": "bigday", "type": "tracker", "title_key": "q15.bigday.title_contacts",
      "columns": ["q15.vendors.col_service", "q15.common.name", "q15.common.phone", "q15.common.time"], "blank_rows": 12 },
    { "id": "bigday_emergency", "tab": "bigday", "type": "checklist", "title_key": "q15.bigday.title_emergency",
      "rows": ["q15.bigday.ek_pins","q15.bigday.ek_hemtape","q15.bigday.ek_sewing","q15.bigday.ek_stain","q15.bigday.ek_flats","q15.bigday.ek_chargers","q15.bigday.ek_snacks","q15.bigday.ek_makeup","q15.bigday.ek_bandaids","q15.bigday.ek_tissues"],
      "extra_blank_rows": 6 },

    { "id": "notes_lined_1", "tab": "notes", "type": "notes", "style": "lined", "title_key": "q15.notes.title_lined" },
    { "id": "notes_lined_2", "tab": "notes", "type": "notes", "style": "lined", "title_key": "q15.notes.title_lined" },
    { "id": "notes_dot_1", "tab": "notes", "type": "notes", "style": "dotgrid", "title_key": "q15.notes.title_lined" },
    { "id": "notes_dot_2", "tab": "notes", "type": "notes", "style": "dotgrid", "title_key": "q15.notes.title_lined" },
    { "id": "notes_docs", "tab": "notes", "type": "tracker", "title_key": "q15.notes.title_docs",
      "columns": ["q15.common.details", "q15.common.date", "q15.common.location"], "blank_rows": 14 },
    { "id": "notes_gifts", "tab": "notes", "type": "tracker", "title_key": "q15.notes.title_gifts",
      "columns": ["q15.notes.col_gift", "q15.notes.col_from", "q15.notes.col_thanked"], "blank_rows": 20, "checkbox_column": "q15.notes.col_thanked" }
  ],

  "kit_extraction": {
    "_note": "Slice 3 map — kit_builder.py assembles kits from these page ids plus a kit-specific cover.",
    "kit_court_of_honor": ["court_overview", "court_damas", "court_chambelanes", "court_measurements", "court_rehearsals", "bigday_contacts", "notes_lined_1"],
    "kit_vals_choreography": ["music_playlist", "music_choreo_entrance", "music_choreo_vals", "music_rehearsals", "music_dj", "notes_lined_1"]
  }
}
<<<<<<<<<< END FILE: quince/quince_content_draft.json >>>>>>>>>>

<<<<<<<<<< BEGIN FILE: quince/q15_modules.py >>>>>>>>>>
"""
q15_modules.py — Quinceañera Planner custom drawing modules
BRIEF-Q15-001 steps 3–5, implemented as working ReportLab code.

INTEGRATION NOTE FOR THE EXECUTOR
---------------------------------
These functions are written "adapter-style": each takes a ReportLab canvas,
a colors dict keyed by the factory's 7 color ROLES, and a strings dict of
already-resolved translation values (the factory resolves q15.* keys per
language before calling). Your job is a thin wrapper per function that maps
planner_factory.py's real module signature onto these — do not rewrite the
drawing logic. Font names are Helvetica/Times placeholders; swap them for
the factory's registered fonts for the recipe's style (editorial/classic/
romantic/modern). Flag anything that cannot wrap cleanly; do not redesign.

Colors dict expected keys (hex strings or reportlab colors):
    primary, accent, metallic, highlight, neutral, background, ink
"""

from reportlab.lib.colors import HexColor, white
from reportlab.lib.pagesizes import letter

PAGE_W, PAGE_H = letter  # 612 x 792 pt, US Letter
MARGIN = 54


def _c(v):
    """Accept hex string or reportlab color."""
    return HexColor(v) if isinstance(v, str) else v


# ---------------------------------------------------------------------------
# TIARA COVER ORNAMENT  (D-019)
# ---------------------------------------------------------------------------

def draw_tiara(c, cx, base_y, width, colors, stroke_width=1.6):
    """Five-point line-art tiara. Pure strokes in the metallic role — no
    fills, no gradients — so it inherits every colorway automatically.

    Geometry per BRIEF-Q15-001: shallow base arc (rise ~12% of width),
    five peaks (center 100% of ornament height, inner pair 72%, outer 50%),
    circle finial atop each peak. Overall aspect ~2:1 (w:h).
    """
    metallic = _c(colors["metallic"])
    c.saveState()
    c.setStrokeColor(metallic)
    c.setLineWidth(stroke_width)
    c.setLineCap(1)  # round caps — jewelry, not carpentry

    half = width / 2.0
    rise = 0.12 * width           # base arc chord rise
    height = width / 2.0          # total ornament height above base_y
    fin_r = 0.03 * width          # finial radius

    def arc_y(x):
        """Parabolic approximation of the shallow base arc."""
        t = (x - cx) / half
        return base_y + rise * (1.0 - t * t)

    # Base arc as a single cubic (visually indistinguishable at this rise)
    p = c.beginPath()
    p.moveTo(cx - half, base_y)
    p.curveTo(cx - half * 0.5, base_y + rise * 1.33,
              cx + half * 0.5, base_y + rise * 1.33,
              cx + half, base_y)
    c.drawPath(p, stroke=1, fill=0)

    # Peaks: apex x-fractions across the width, heights relative to `height`
    peaks = [(-0.72, 0.50), (-0.36, 0.72), (0.0, 1.0), (0.36, 0.72), (0.72, 0.50)]
    foot_spread = 0.115 * width   # half-distance between a peak's two feet

    for fx, fh in peaks:
        apex_x = cx + fx * half
        apex_y = base_y + fh * height
        for side in (-1, 1):
            foot_x = apex_x + side * foot_spread
            foot_x = max(cx - half, min(cx + half, foot_x))
            foot_y = arc_y(foot_x)
            # inward-curving stroke: controls pulled toward the apex vertical
            p = c.beginPath()
            p.moveTo(foot_x, foot_y)
            p.curveTo(foot_x + side * -0.02 * width, foot_y + (apex_y - foot_y) * 0.45,
                      apex_x + side * 0.35 * foot_spread, apex_y - (apex_y - foot_y) * 0.28,
                      apex_x, apex_y)
            c.drawPath(p, stroke=1, fill=0)
        # finial: small stroked circle floating just above the apex
        c.circle(apex_x, apex_y + fin_r * 1.9, fin_r, stroke=1, fill=0)

    c.restoreState()


# ---------------------------------------------------------------------------
# COURT ROSTER MODULE  (court_roster)
# ---------------------------------------------------------------------------

def _fits(c, text, font, size, max_w):
    return c.stringWidth(text, font, size) <= max_w


def _role_badge(c, x, y, text, abbr, colors, h=14, pad=6, font="Helvetica", size=7.5):
    """Outlined rounded-rect badge in ink (survives B&W print). Falls back
    to the abbr string automatically when the full label overflows."""
    ink = _c(colors["ink"])
    max_w = 78
    label = text if _fits(c, text.upper(), font, size, max_w - 2 * pad) else abbr
    w = c.stringWidth(label.upper(), font, size) + 2 * pad
    c.saveState()
    c.setStrokeColor(ink)
    c.setLineWidth(0.8)
    c.roundRect(x, y, w, h, h / 2.0, stroke=1, fill=0)
    c.setFillColor(ink)
    c.setFont(font, size)
    c.drawString(x + pad, y + (h - size) / 2.0 + 1, label.upper())
    c.restoreState()
    return w


def draw_court_roster_page(c, colors, strings, rows=10):
    """One roster page: title, primary header band, write-in columns,
    role badge, and the signature 4-checkbox status strip per row.

    strings expected keys:
      title, role, role_abbr, role_honor, role_honor_abbr,
      col_name, col_phone, col_pair, col_size,
      status_confirmed, status_measured, status_fitted, status_rehearsed
    """
    primary = _c(colors["primary"])
    ink = _c(colors["ink"])
    neutral = _c(colors["neutral"])
    bg = _c(colors["background"])

    c.setFillColor(bg)
    c.rect(0, 0, PAGE_W, PAGE_H, stroke=0, fill=1)

    # Title (factory display font goes here)
    c.setFillColor(primary)
    c.setFont("Times-Bold", 24)
    c.drawCentredString(PAGE_W / 2, PAGE_H - MARGIN - 10, strings["title"])
    c.setStrokeColor(_c(colors["metallic"]))
    c.setLineWidth(1)
    c.line(PAGE_W / 2 - 60, PAGE_H - MARGIN - 20, PAGE_W / 2 + 60, PAGE_H - MARGIN - 20)

    # Column geometry
    x0 = MARGIN
    table_w = PAGE_W - 2 * MARGIN
    cols = [
        (strings["col_name"], 0.34),
        (strings["col_phone"], 0.24),
        (strings["col_pair"], 0.28),
        (strings["col_size"], 0.14),
    ]
    header_y = PAGE_H - MARGIN - 52
    header_h = 20

    # Header band in primary, labels in white
    c.setFillColor(primary)
    c.rect(x0, header_y, table_w, header_h, stroke=0, fill=1)
    c.setFillColor(white)
    c.setFont("Helvetica-Bold", 8.5)
    cx_run = x0
    col_x = []
    for label, frac in cols:
        col_x.append(cx_run)
        c.drawString(cx_run + 6, header_y + 6, label.upper())
        cx_run += frac * table_w
    col_x.append(x0 + table_w)

    # Rows
    row_h = 52
    statuses = [strings["status_confirmed"], strings["status_measured"],
                strings["status_fitted"], strings["status_rehearsed"]]
    box = 13  # checkbox side; ≥ 5 mm target for pen use in print
    y = header_y

    for i in range(rows):
        y -= row_h
        # row separator
        c.setStrokeColor(neutral)
        c.setLineWidth(0.7)
        c.line(x0, y, x0 + table_w, y)

        # write-in lines (upper half of the row)
        line_y = y + row_h - 20
        c.setLineWidth(0.6)
        for j in range(len(cols)):
            c.line(col_x[j] + 6, line_y, col_x[j + 1] - 8, line_y)

        # role badge (first row = honor role — the factory passes role choice
        # per-row in real integration; proof shows the fallback behavior)
        if i == 0:
            _role_badge(c, x0 + 6, y + 6, strings["role_honor"],
                        strings["role_honor_abbr"], colors)
        else:
            _role_badge(c, x0 + 6, y + 6, strings["role"],
                        strings["role_abbr"], colors)

        # 4-checkbox status strip (lower half, right-aligned block)
        strip_x = col_x[1]
        avail = (x0 + table_w) - strip_x - 6
        cell = avail / 4.0
        c.setFont("Helvetica", 6.5)
        for k, s in enumerate(statuses):
            bx = strip_x + k * cell
            c.setStrokeColor(ink)
            c.setLineWidth(0.9)
            c.rect(bx, y + 6, box, box, stroke=1, fill=0)
            c.setFillColor(ink)
            c.drawString(bx + box + 4, y + 9.5, s.upper())

    # bottom rule
    c.setStrokeColor(neutral)
    c.line(x0, y, x0 + table_w, y)


# ---------------------------------------------------------------------------
# WALTZ FORMATION GRID MODULE  (waltz_grid)
# ---------------------------------------------------------------------------

def draw_waltz_grid_page(c, colors, strings, dots=16, count_lines=8):
    """Dance-floor rectangle with faint positioning grid and numbered
    position dots, plus write-in count lines below.

    strings expected keys: title, count_label
    """
    primary = _c(colors["primary"])
    ink = _c(colors["ink"])
    neutral = _c(colors["neutral"])
    bg = _c(colors["background"])

    c.setFillColor(bg)
    c.rect(0, 0, PAGE_W, PAGE_H, stroke=0, fill=1)

    c.setFillColor(primary)
    c.setFont("Times-Bold", 24)
    c.drawCentredString(PAGE_W / 2, PAGE_H - MARGIN - 10, strings["title"])
    c.setStrokeColor(_c(colors["metallic"]))
    c.setLineWidth(1)
    c.line(PAGE_W / 2 - 60, PAGE_H - MARGIN - 20, PAGE_W / 2 + 60, PAGE_H - MARGIN - 20)

    # Dance floor: landscape box within the portrait page
    floor_w, floor_h = 486, 300
    fx = (PAGE_W - floor_w) / 2
    fy = PAGE_H - MARGIN - 60 - floor_h

    # faint grid in neutral
    c.setStrokeColor(neutral)
    c.setLineWidth(0.4)
    step = 54
    gx = fx + step
    while gx < fx + floor_w:
        c.line(gx, fy, gx, fy + floor_h)
        gx += step
    gy = fy + step
    while gy < fy + floor_h:
        c.line(fx, gy, fx + floor_w, gy)
        gy += step

    # floor frame in ink
    c.setStrokeColor(ink)
    c.setLineWidth(1.2)
    c.rect(fx, fy, floor_w, floor_h, stroke=1, fill=0)

    # numbered position dots in primary, arranged in a starting grid
    import math
    per_row = math.ceil(math.sqrt(dots))
    n_rows = math.ceil(dots / per_row)
    r = 9
    n = 1
    for row in range(n_rows):
        row_count = min(per_row, dots - row * per_row)
        dy = fy + floor_h - (row + 1) * floor_h / (n_rows + 1)
        for col in range(row_count):
            dx = fx + (col + 1) * floor_w / (row_count + 1)
            c.setFillColor(primary)
            c.circle(dx, dy, r, stroke=0, fill=1)
            c.setFillColor(white)
            c.setFont("Helvetica-Bold", 8)
            c.drawCentredString(dx, dy - 2.8, str(n))
            n += 1

    # count lines below the floor
    c.setFillColor(ink)
    c.setFont("Helvetica-Bold", 8.5)
    y = fy - 34
    c.drawString(MARGIN, y + 14, strings["count_label"].upper())
    c.setFont("Helvetica", 8)
    c.setStrokeColor(neutral)
    c.setLineWidth(0.7)
    line_w = PAGE_W - 2 * MARGIN - 24
    for i in range(count_lines):
        c.setFillColor(ink)
        c.drawString(MARGIN, y - 1, f"{i + 1}.")
        c.line(MARGIN + 16, y - 2, MARGIN + 16 + line_w, y - 2)
        y -= 26
<<<<<<<<<< END FILE: quince/q15_modules.py >>>>>>>>>>

<<<<<<<<<< BEGIN FILE: quince/render_proof.py >>>>>>>>>>
"""
render_proof.py — builds Q15-MODULE-PROOF.pdf for owner visual approval.
Uses the locked Royal Blue & Gold recipe roles; tiara shown on all three
launch palettes. EN and ES court roster pages prove Spanish fits.
"""
from reportlab.pdfgen import canvas
from reportlab.lib.colors import HexColor
from q15_modules import (PAGE_W, PAGE_H, MARGIN, draw_tiara,
                         draw_court_roster_page, draw_waltz_grid_page)

RBG = {  # Royal Blue & Gold (editorial / arch->tiara)
    "primary": "#2C4A8C", "accent": "#7B93C4", "metallic": "#C9A227",
    "highlight": "#EAD9A0", "neutral": "#C9C9D1",
    "background": "#FAF8F4", "ink": "#24273A",
}
BLK = {  # Black & Gold
    "primary": "#1C1C1E", "accent": "#4A4A4E", "metallic": "#D4AF37",
    "highlight": "#EAD9A0", "neutral": "#C9C9C9",
    "background": "#F7F5F0", "ink": "#0F0F10",
}
FIE = {  # Mexican Heritage Fiesta
    "primary": "#C24A2C", "accent": "#E8A13D", "metallic": "#C9A227",
    "highlight": "#F4D35E", "neutral": "#D8B7A0",
    "background": "#FDF6EC", "ink": "#3A2418",
}

COURT_EN = {
    "title": "Damas", "role": "Dama", "role_abbr": "Dama",
    "role_honor": "Dama of honor", "role_honor_abbr": "D. honor",
    "col_name": "Name", "col_phone": "Phone",
    "col_pair": "Paired with", "col_size": "Size",
    "status_confirmed": "Confirmed", "status_measured": "Measured",
    "status_fitted": "Fitted", "status_rehearsed": "Rehearsed",
}
COURT_ES = {
    "title": "Chambelanes", "role": "Chambel\u00e1n", "role_abbr": "Chamb.",
    "role_honor": "Chambel\u00e1n de honor", "role_honor_abbr": "Ch. honor",
    "col_name": "Nombre", "col_phone": "Tel\u00e9fono",
    "col_pair": "Pareja", "col_size": "Talla",
    "status_confirmed": "Confirmado", "status_measured": "Medidas",
    "status_fitted": "Prueba", "status_rehearsed": "Ensayo",
}
WALTZ_ES = {"title": "Formaci\u00f3n del vals", "count_label": "Conteo 1\u20138"}

OUT = "/mnt/user-data/outputs/Q15-MODULE-PROOF.pdf"
c = canvas.Canvas(OUT, pagesize=(PAGE_W, PAGE_H))

# ---- Page 1: tiara ornament on all three launch palettes -------------------
c.setFillColor(HexColor(RBG["background"]))
c.rect(0, 0, PAGE_W, PAGE_H, stroke=0, fill=1)
c.setFillColor(HexColor(RBG["ink"]))
c.setFont("Times-Bold", 20)
c.drawCentredString(PAGE_W / 2, PAGE_H - 70, "Tiara cover ornament \u2014 D-019 proof")
c.setFont("Helvetica", 9)
c.drawCentredString(PAGE_W / 2, PAGE_H - 88,
                    "Pure linework in the metallic role \u2014 inherits every colorway")

panel_h = 200
for i, (name, pal) in enumerate([("Royal Blue & Gold", RBG),
                                 ("Black & Gold", BLK),
                                 ("Mexican Heritage Fiesta", FIE)]):
    py = PAGE_H - 130 - (i + 1) * panel_h + 40
    c.setFillColor(HexColor(pal["background"]))
    c.setStrokeColor(HexColor(pal["neutral"]))
    c.setLineWidth(0.8)
    c.roundRect(MARGIN, py, PAGE_W - 2 * MARGIN, panel_h - 16, 6, stroke=1, fill=1)
    draw_tiara(c, PAGE_W / 2, py + 42, 220, pal)
    c.setFillColor(HexColor(pal["ink"]))
    c.setFont("Helvetica", 8.5)
    c.drawCentredString(PAGE_W / 2, py + 12, name.upper())
c.showPage()

# ---- Page 2: court roster, English ----------------------------------------
draw_court_roster_page(c, RBG, COURT_EN)
c.showPage()

# ---- Page 3: court roster, Spanish (proves ES fits, incl. badge fallback) --
draw_court_roster_page(c, RBG, COURT_ES)
c.showPage()

# ---- Page 4: waltz grid, Spanish ------------------------------------------
draw_waltz_grid_page(c, RBG, WALTZ_ES)
c.showPage()

c.save()
print("wrote", OUT)
<<<<<<<<<< END FILE: quince/render_proof.py >>>>>>>>>>

<<<<<<<<<< BEGIN FILE: .github/workflows/generate.yml >>>>>>>>>>
name: Generate drift code

# Runs build_runner in GitHub's cloud so app_database.g.dart gets created
# and committed without needing a computer. Trigger it manually from the
# Actions tab, or it runs automatically when Dart files change.

on:
  workflow_dispatch:
  push:
    branches: [main]
    paths:
      - 'events_app/lib/**'
      - 'events_app/pubspec.yaml'

jobs:
  generate:
    runs-on: ubuntu-latest
    permissions:
      contents: write
    steps:
      - name: Check out the repo
        uses: actions/checkout@v4

      - name: Set up Flutter (stable)
        uses: subosito/flutter-action@v2
        with:
          channel: stable

      - name: Install dependencies
        working-directory: events_app
        run: flutter pub get

      - name: Run build_runner (creates app_database.g.dart)
        working-directory: events_app
        run: dart run build_runner build --delete-conflicting-outputs

      - name: Run the tests to prove the app is healthy
        working-directory: events_app
        run: flutter test

      - name: Commit the generated file back to the repo
        run: |
          git config user.name "github-actions[bot]"
          git config user.email "github-actions[bot]@users.noreply.github.com"
          git add -A 'events_app/**/*.g.dart'
          if git diff --cached --quiet; then
            echo "Nothing new to commit — generated code is already up to date."
          else
            git commit -m "chore: generate drift code [skip ci]"
            git push
          fi
<<<<<<<<<< END FILE: .github/workflows/generate.yml >>>>>>>>>>
