## Blume Tax & Consulting – AI contributor guide

Scope: Static HTML5/CSS/JS site (HTML5 UP “Dimension”) with hash-based sections and two standalone legal pages; deployed to IIS on Windows Server.

Big picture
- One-page shell `index.html` uses header links (`#intro`, `#work`, `#about`, `#experience`, `#faq`, `#contact`) to open `<article id="...">` in `#main` via `assets/js/main.js`.
- Standalone pages: `privacy.html`, `terms.html` reuse the same assets. PWA manifest: `site.webmanifest` (no service worker).

Add or edit sections
- Create nav link `<a href="#your-id">` in the header and a matching `<article id="your-id">` inside `#main`.
- Avoid duplicate IDs; the router shows/hides by `location.hash`.

Content conventions (tax/accounting + fintech)
- Keep tone professional/compliance-forward; surface credentials (EA), services, and clear CTAs (Calendly/call/email). Retain trust links (Privacy/Terms in footer).
- Replace placeholders in `index.html`: Calendly (`YOUR_HANDLE`) and Formspree (`YOUR_FORMSPREE_ID`).
- SEO/meta already present (title, description, canonical, OG, theme-color). Mirror this on new pages.

Branding & icons
- Icons currently reference `ideas/logo*.png`. If updating branding, also update `<link rel="icon">` tags and `icons` in `site.webmanifest` to valid 192x192 and 512x512 PNGs.

Styling workflow
- Minor tweaks: `assets/css/main.css`. Larger changes: edit Sass in `assets/sass/**` (vars in `libs/_vars.scss`) and compile to `assets/css/*.css` with Dart Sass.

JS behavior to preserve
- Keep `breakpoints.min.js`, `browser.min.js`, and preload removal in `main.js`. External links are unaffected by the hash router; on-page sections must live in `#main`.

Local preview
- Open `index.html` directly or use a simple static server (e.g., Live Server). No build step required.

IIS deployment (Windows Server 2025)
- Install IIS with Static Content; copy site files to the site root.
- Default Document: ensure `index.html` is first (IIS Manager > Default Document).
- MIME type: add `.webmanifest` => `application/manifest+json` (IIS > MIME Types). See MDN for manifest guidance.
- Optional: HTTPS binding, HSTS, static compression, and client caching for `assets/`.

Gotchas
- Articles outside `#main` won’t display; mismatched IDs break nav. Optimize large images (`images/bg.jpg`, `images/overlay.png`).

Key files
- `index.html`, `privacy.html`, `terms.html`; `assets/js/main.js`,`assets/js/util.js`; `assets/css/*.css` (compiled) and `assets/sass/**`; `site.webmanifest`.

References
- MDN Web App Manifest: https://developer.mozilla.org/en-US/docs/Web/Manifest
- IIS Default Document: https://learn.microsoft.com/en-us/iis/configuration/system.webserver/defaultdocument/
- IIS Static Content/MIME map: https://learn.microsoft.com/en-us/iis/configuration/system.webserver/staticcontent/

Need deeper deployment scripting (AppCmd/PowerShell) or industry copy guidelines? Ask and we’ll expand this guide.
