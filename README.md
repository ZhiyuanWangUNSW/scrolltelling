# Maglr-like Scrolltelling Structure (Quarto / R)

This is **structure-only**: layout + basic scroll logic (sticky step activation).
You can adjust colours, fonts, spacing, and add images/videos yourself.

## Run locally
- RStudio: `quarto::quarto_preview()`
- Terminal: `quarto preview`

## Where to edit
- index.qmd: section structure (hero, chapter, scrolly, media, horizontal slides, cards)
- styles.css: layout + placeholder colours (CSS variables at top)
- script.js: per-step content changes in the sticky area

## Tip
To match a specific style, start by changing:
1) CSS variables in :root
2) section background rules (.hero, .chapter, .media-bg)
3) typography sizes (.h1, .h2, .lead)
