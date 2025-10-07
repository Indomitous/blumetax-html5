# GitHub Copilot Instructions for Blume Tax & Consulting

This file provides guidelines for GitHub Copilot and AI coding assistants working on this repository. Following these instructions will help ensure consistency and quality when contributing to the project.

## Project Overview

**Blume Tax & Consulting** is a professional tax and accounting services website built as a static HTML5/CSS/JS site using the "Dimension" template from HTML5 UP. 

**Key characteristics:**
- Single-page application with hash-based navigation
- Modal-style sections for services, industries, technology, and contact
- Standalone legal pages (Privacy Policy, Terms of Service)
- Deployed to Azure Static Web Apps and IIS on Windows Server 2025
- No build process required for basic changes

## Repository Structure

```
/
├── index.html              # Main single-page application shell
├── privacy.html            # Privacy policy standalone page
├── terms.html             # Terms of service standalone page
├── site.webmanifest       # PWA manifest (no service worker)
├── assets/
│   ├── css/               # Compiled CSS (DO NOT edit directly)
│   ├── sass/              # Sass source files (edit these for major changes)
│   │   └── libs/_vars.scss   # Sass variables
│   └── js/                # JavaScript files
│       ├── main.js        # Core navigation and UI logic
│       ├── util.js        # Utility functions
│       ├── breakpoints.min.js  # Responsive breakpoint handling
│       └── browser.min.js      # Browser detection
├── images/                # Image assets and branding
├── ideas/                 # Planning documents and drafts
└── .github/
    └── workflows/         # Azure Static Web Apps CI/CD
```

## Architecture & Navigation

### Hash-based Routing
- `index.html` serves as a one-page shell with header navigation links (`#intro`, `#work`, `#about`, `#experience`, `#faq`, `#contact`)
- Each link opens a corresponding `<article id="...">` element inside `#main` via `assets/js/main.js`
- The router shows/hides articles based on `location.hash`
- **Important:** All on-page sections must be `<article>` elements inside `#main`; articles outside won't display

### Standalone Pages
- `privacy.html` and `terms.html` reuse the same assets and styling
- These pages are separate from the hash routing system
- Mirror SEO/meta tags from `index.html` when creating new standalone pages

## Development Guidelines

### Adding or Editing Sections

To add a new section to the single-page app:
1. Create a nav link in the header: `<a href="#your-id">Your Section</a>`
2. Add a matching article inside `#main`: `<article id="your-id">...</article>`
3. **Avoid duplicate IDs** – the router relies on unique IDs

### Article Schema (Sections/Items)

Articles can use a standardized structure for programmatic updates:

```html
<article id="..." class="article--wide" data-article="services|industries|technology|new-clients">
  <h2 class="major">Title</h2>
  
  <!-- Editable intro -->
  <div class="article-intro" contenteditable="true">Introduction text...</div>
  
  <!-- Section with items -->
  <section class="article-section" data-section="Section Name">
    <h3>Section Name</h3>
    <ul class="article-items">
      <li class="article-item" data-item="Item Name">Item Name</li>
      <li class="article-item placeholder" data-item=""></li>
    </ul>
  </section>
  
  <!-- Editable outro -->
  <div class="article-outro" contenteditable="true">Closing text...</div>
</article>
```

**Notes:**
- The `article--wide` class increases max width for dense listings
- Keep at least one placeholder item (`<li class="article-item placeholder" data-item=""></li>`) for future inserts
- Use `data-article` and `data-section` attributes for programmatic access

### Content Conventions

**Tone & Style:**
- Keep tone professional and compliance-forward
- Surface credentials (e.g., "EA" for Enrolled Agent)
- Include clear CTAs (Calendly links, contact forms, email)
- Retain trust links (Privacy/Terms) in footer

**Placeholders to Replace:**
- Calendly: Replace `YOUR_HANDLE` with actual Calendly username
- Formspree: Replace `YOUR_FORMSPREE_ID` with actual form ID

**SEO/Meta:**
- All meta tags (title, description, canonical, OG, theme-color) are already present in `index.html`
- Mirror these tags when creating new standalone pages

## Styling Workflow

### Minor Tweaks
- Edit `assets/css/main.css` directly for small changes

### Major Changes
1. Edit Sass source files in `assets/sass/**`
2. Variables are in `assets/sass/libs/_vars.scss`
3. Compile to `assets/css/*.css` using Dart Sass:
   ```bash
   sass assets/sass/main.scss assets/css/main.css
   ```

## Branding & Icons

- Icons currently reference `images/logo*.png`
- If updating branding:
  - Update `<link rel="icon">` tags in HTML files
  - Update `icons` array in `site.webmanifest` with valid 192×192 and 512×512 PNGs
  - See [MDN Web App Manifest](https://developer.mozilla.org/en-US/docs/Web/Manifest) for guidance

## JavaScript Behavior

**Files to Preserve:**
- `breakpoints.min.js` – Responsive breakpoint handling
- `browser.min.js` – Browser detection utilities
- Preload removal logic in `main.js`

**Important Rules:**
- External links work normally and are unaffected by the hash router
- On-page section links must use hash format (`#section-id`)
- All routed sections must be `<article>` elements inside `#main`

## Local Development

### Preview
- **No build step required** for basic changes
- Open `index.html` directly in a browser, or
- Use a simple static server (e.g., VS Code Live Server extension)

### Testing
- Manually test all hash navigation links
- Verify responsive behavior at different breakpoints
- Test in multiple browsers (Chrome, Firefox, Safari, Edge)
- Check that external links open correctly

## Deployment

### Azure Static Web Apps
- Automatic deployment via GitHub Actions (`.github/workflows/azure-static-web-apps-*.yml`)
- Triggered on push to `main` branch and pull requests
- No special build configuration needed (static files deployed as-is)

### IIS on Windows Server 2025

**Setup Steps:**
1. Install IIS with Static Content feature
2. Copy site files to IIS site root
3. Configure Default Document:
   - Open IIS Manager → Default Document
   - Ensure `index.html` is first in the list
4. Add MIME type for PWA manifest:
   - Open IIS Manager → MIME Types
   - Add: `.webmanifest` → `application/manifest+json`
   - See [IIS MIME configuration](https://learn.microsoft.com/en-us/iis/configuration/system.webserver/staticcontent/)

**Optional Enhancements:**
- Configure HTTPS binding with SSL certificate
- Enable HTTP Strict Transport Security (HSTS)
- Enable static content compression
- Configure client-side caching for `assets/` directory

## Common Gotchas

- **Articles outside `#main` won't display** – Hash router only shows/hides articles within `#main`
- **Mismatched IDs break navigation** – Ensure nav link `href="#id"` matches article `id="id"`
- **Large images impact performance** – Optimize `images/bg.jpg` and `images/overlay.png`
- **CSS edits may be overwritten** – Don't edit `assets/css/main.css` if you're also compiling from Sass

## Version Control

- **Main branch:** `main` (protected, deploys to production)
- **Create feature branches** for new work
- **Pull requests** are required for changes to `main`
- **Commits:** Use clear, descriptive commit messages

## File Reference

**Key HTML Files:**
- `index.html` – Main SPA shell
- `privacy.html` – Privacy policy
- `terms.html` – Terms of service

**Key JavaScript Files:**
- `assets/js/main.js` – Core navigation and UI logic
- `assets/js/util.js` – Utility functions

**Key CSS Files:**
- `assets/css/*.css` – Compiled stylesheets (DO NOT edit if using Sass)
- `assets/sass/**` – Sass source files (edit these for major changes)

**Other Important Files:**
- `site.webmanifest` – PWA manifest
- `images/logo*.png` – Branding assets

## Additional Resources

- [MDN Web App Manifest](https://developer.mozilla.org/en-us/docs/Web/Manifest)
- [IIS Default Document Configuration](https://learn.microsoft.com/en-us/iis/configuration/system.webserver/defaultdocument/)
- [IIS Static Content & MIME Types](https://learn.microsoft.com/en-us/iis/configuration/system.webserver/staticcontent/)
- [HTML5 UP Dimension Template](https://html5up.net/dimension) (original template)

## Getting Help

For questions about:
- **Deployment scripting** (AppCmd/PowerShell)
- **Industry-specific copy guidelines** (tax/accounting/fintech)
- **Advanced customizations**

Please ask, and this guide can be expanded with additional details.
