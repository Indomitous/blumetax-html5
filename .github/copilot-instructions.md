## Blume Tax & Consulting – AI contributor guide

Scope: Static HTML5/CSS/JS site based on HTML5 UP “Dimension”. One-page shell (`index.html`) uses a hash router to show `<article>` sections inside `#main`. Two standalone legal pages (`privacy.html`, `terms.html`) reuse assets. Deployed to IIS on Windows Server.

Big picture
- Router: Header links (`#work`, `#industries`, `#capabilities`, `#process`, `#contact`, plus `#intro`, `#about`, `#experience`, `#faq`) map to `<article id="...">` in `#main`. `assets/js/main.js` shows/hides articles on `hashchange`, sets `body.is-article-visible`, and injects a per-article “Close”.
- Load behavior: On first load, if there’s no hash, router opens `#intro` by default. Header/footer remain visible during transitions (custom from stock Dimension).
- Mobile nav: Button `#nav-toggle` toggles `aria-expanded` and `body.nav-open`; nav is `#site-nav`. Active nav item uses `aria-current="page"` and `.is-active` synced to `location.hash`.

Add or edit sections
- Add a header link `<a href="#your-id">` in `#site-nav` and a matching `<article id="your-id">` inside `#main`. IDs must be unique and within `#main` or the router won’t find them.
- Standard article schema (used in Services/Industries/Technology/New Clients):
  - `<article id="…" class="article--wide" data-article="services|industries|technology|new-clients">`
  - Optional: `<div class="article-intro" contenteditable="true">…</div>` and `<div class="article-outro" contenteditable="true">…</div>`
  - Sections: `<section class="article-section" data-section="Section Name">` with `<h3>Section Name</h3>` and
  - Items: `<ul class="article-items">` of `<li class="article-item" data-item="Item">Item</li>` (keep one `<li class="article-item placeholder" data-item=""></li>` for inserts)

Content & integrations
- Replace placeholders in `index.html` before publishing: Calendly (`YOUR_HANDLE`) and Formspree (`YOUR_FORMSPREE_ID`). Social profile links under `.icons` are placeholders too.
- Keep tone professional/compliance-forward (surface EA credentials). Preserve footer trust links to `privacy.html` and `terms.html`.
- Legal pages are standalone HTML that link back to `/#…` anchors; mirror head meta/icons and reuse the same CSS/JS.

Styling & dev workflow
- SCSS source: `assets/sass/**`; compiled CSS: `assets/css/`. Use Dart Sass via npm:
  - `npm run sass` (one-off) · `npm run sass:watch` (watch)
- Lint/format/hint: `npm run lint:css`, `npm run format`, `npm run hint`.
- Local preview: `npm run serve` (live-server on :5500) or open `index.html` directly. VS Code Tasks are provided for Sass watch, Prettier, stylelint, and webhint.

Icons & manifest
- `site.webmanifest` points to `/assets/icons/android-chrome-192x192.png` and `/assets/icons/android-chrome-512x512.png`.
- `index.html` currently references icons under `/images/` (e.g., `favicon-192.png`, `favicon-512.png`), while `privacy.html`/`terms.html` use `/assets/icons/`. Pick one canonical path and normalize across pages; keep 192x192 and 512x512 PNGs in sync with the manifest.
- Header brand image on the one-pager is `/images/initial.png`; legal pages currently use `/ideas/initial.png`—standardize on `/images/initial.png` when updating branding.

JS behavior to preserve (see `assets/js/main.js`)
- Breakpoints and preload removal; hash router shows/hides articles on `hashchange` and initial load; click outside `#header, #footer` hides the active article; `Esc` closes; manual scroll restoration.
- Keep: visible header/footer during transitions, `#nav-toggle` aria state + `body.nav-open`, and active nav highlighting.

Deployment (IIS on Windows Server)
- Use `scripts/deploy-iis.ps1` to copy the site: excludes `assets\sass` and `scripts`; can add the `.webmanifest` MIME map (`-AddMimeMap`) as `application/manifest+json`.
- IIS settings: Ensure `index.html` is first in Default Documents; add `.webmanifest` MIME if missing; consider HTTPS/HSTS and static compression.

Key files
- `index.html`, `privacy.html`, `terms.html`
- `assets/js/main.js`, `assets/js/util.js`
- `assets/sass/**` → `assets/css/*.css`
- `site.webmanifest`
- `scripts/deploy-iis.ps1`

Open questions / follow-ups
- Provide final Calendly handle and Formspree ID.
- Confirm canonical icon paths (`/images/*` vs `/assets/icons/*`) and update all pages accordingly.
- Any new sections to wire into the router (e.g., testimonials, pricing)?
