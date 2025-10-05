# Development Guide - Azure Static Web Apps

Guide for local development of Blume Tax & Consulting website using Azure Static Web Apps CLI.

## Quick Start

```bash
# Install dependencies
npm install

# Start development server
npm start

# Open browser to http://localhost:4280
```

## Development Workflow

### 1. Local Development Server

The SWA CLI provides a local emulator that closely matches the Azure environment:

```bash
npm start
# or
npm run dev
```

This starts:
- Static file server on http://localhost:4280
- Watches for file changes (requires manual refresh)
- Emulates Azure SWA routing and configuration

### 2. Making Changes

#### Content Updates

Edit `src/index.html` to update:

- **Services** (#work article): Tax and accounting services
- **Industries** (#industries article): Target markets
- **Technology** (#capabilities article): Tools and platforms
- **Process** (#process article): Client onboarding
- **Contact** (#contact article): Contact information

#### Styling Changes

**Quick CSS changes:**
```bash
# Edit compiled CSS directly
vim src/assets/css/main.css
```

**Sass development (recommended for major changes):**

1. Install Dart Sass globally:
```bash
npm install -g sass
```

2. Edit Sass files in `src/assets/sass/`

3. Compile Sass:
```bash
cd src
sass assets/sass/main.scss assets/css/main.css
```

4. For continuous watching:
```bash
sass --watch assets/sass/main.scss:assets/css/main.css
```

#### JavaScript Changes

Edit files in `src/assets/js/`:
- `main.js` - Main application logic, routing
- `util.js` - Utility functions
- Other .min.js files are minified libraries

### 3. Testing Changes

After making changes:

1. **Manual Testing:**
   - Refresh browser at http://localhost:4280
   - Test all navigation links
   - Test responsive design (browser dev tools)
   - Test forms (contact, etc.)

2. **Cross-Browser Testing:**
   - Chrome/Edge (Chromium)
   - Firefox
   - Safari (if on macOS)
   - Mobile browsers (use browser dev tools device emulation)

3. **Performance Testing:**
   - Check browser Network tab for asset loading
   - Verify caching headers
   - Check for console errors

## SWA CLI Commands

### Start Server
```bash
# Basic start
npx swa start src

# Start with specific port
npx swa start src --port 8080

# Start with SSL
npx swa start src --ssl
```

### Configuration

The `swa-cli.config.json` file stores local configuration:

```json
{
  "configurations": {
    "blumetax": {
      "appLocation": "src",
      "outputLocation": "src"
    }
  }
}
```

### Deploy from CLI
```bash
# Deploy to Azure (requires authentication)
npx swa deploy
```

## Project Structure Details

```
blumetax-html5/
├── .github/
│   └── workflows/
│       └── azure-static-web-apps.yml  # CI/CD pipeline
├── src/                               # All deployed files
│   ├── assets/
│   │   ├── css/
│   │   │   ├── main.css              # Compiled styles
│   │   │   └── noscript.css          # No-JS fallback
│   │   ├── js/
│   │   │   ├── main.js               # App logic & routing
│   │   │   ├── util.js               # Utilities
│   │   │   ├── jquery.min.js         # jQuery library
│   │   │   ├── breakpoints.min.js    # Responsive breakpoints
│   │   │   └── browser.min.js        # Browser detection
│   │   ├── sass/                     # Sass source (not deployed)
│   │   │   ├── main.scss            # Main Sass entry point
│   │   │   ├── libs/                # Sass utilities
│   │   │   ├── base/                # Base styles
│   │   │   ├── components/          # Component styles
│   │   │   └── layout/              # Layout styles
│   │   └── webfonts/                # Font files
│   ├── images/                       # Images, logos, icons
│   ├── index.html                    # Main SPA
│   ├── privacy.html                  # Privacy policy
│   ├── terms.html                    # Terms of service
│   └── site.webmanifest             # PWA manifest
├── staticwebapp.config.json          # SWA routing & config
├── package.json                      # Dependencies
├── swa-cli.config.json              # SWA CLI config
├── README.md                         # Project overview
├── DEPLOYMENT.md                     # Deployment guide
└── DEVELOPMENT.md                    # This file
```

## Common Development Tasks

### Adding a New Section

1. **Add navigation link** in `src/index.html`:
```html
<li role="none"><a href="#newsection" role="menuitem">New Section</a></li>
```

2. **Add article** in `src/index.html` within `<div id="main">`:
```html
<article id="newsection">
  <h2 class="major">New Section</h2>
  <p>Content here...</p>
</article>
```

3. **Style if needed** in `src/assets/css/main.css` or Sass files

### Updating Contact Information

Edit the `#contact` article in `src/index.html`:

```html
<article id="contact">
  <h2 class="major">Contact</h2>
  <form method="post" action="https://formspree.io/f/YOUR_FORMSPREE_ID">
    <!-- Form fields -->
  </form>
  <ul class="icons">
    <!-- Social media links -->
  </ul>
</article>
```

Remember to update Formspree ID for contact form.

### Changing Branding

1. **Logo/Icons**: Replace files in `src/images/`
   - `initial.png` - Header logo
   - `favicon-*.png` - Favicon sizes
   - `logo.png` - Main logo

2. **Colors**: Edit `src/assets/sass/libs/_vars.scss`:
```scss
$palette: (
  bg: #242943,
  bg-alt: #2a2f4a,
  fg: #ffffff,
  // ... other colors
);
```

3. **Compile Sass** after changes:
```bash
sass assets/sass/main.scss assets/css/main.css
```

### Adding New Pages

For standalone pages (like privacy.html):

1. Create new HTML file in `src/`
2. Copy structure from `privacy.html` or `terms.html`
3. Update `staticwebapp.config.json` if special routing needed:
```json
{
  "routes": [
    {
      "route": "/newpage.html",
      "rewrite": "/newpage.html"
    }
  ]
}
```

## Environment-Specific Configuration

### Local Development
- Uses `swa-cli.config.json`
- Runs on http://localhost:4280
- Hot reload not available (manual refresh needed)

### Staging (Pull Requests)
- Automatic preview deployments
- Unique URL per PR: `<app-name>-<pr-number>.azurestaticapps.net`
- Full Azure SWA features

### Production
- Custom domain: www.blumetax.com
- Full CDN, SSL, caching
- Monitoring and analytics

## Debugging

### Browser Console

Check for JavaScript errors:
```javascript
// Open browser console (F12)
// Look for errors in Console tab
```

### Network Tab

Check asset loading:
- Verify all assets return 200 status
- Check caching headers
- Identify slow-loading resources

### SWA CLI Logs

The CLI outputs server logs in terminal:
```
Azure Static Web Apps emulator started at http://localhost:4280
GET / 200
GET /assets/css/main.css 200
```

## Testing Routing

The site uses hash-based routing (`#work`, `#industries`, etc.).

Test:
1. Direct access: http://localhost:4280/#work
2. Click navigation: Should open modals
3. Browser back/forward: Should work correctly
4. Deep linking: Share links with hash should work

## Performance Tips

### Image Optimization

Already optimized, but for new images:

```bash
# Install ImageMagick
brew install imagemagick  # macOS
apt-get install imagemagick  # Linux

# Resize and optimize
convert input.jpg -resize 1920x1080\> -quality 85 output.jpg
```

### CSS Optimization

For production, consider:
- Removing unused CSS (PurgeCSS)
- Minifying CSS
- Combining files

Current setup uses pre-compiled CSS from HTML5 UP template.

### JavaScript Optimization

Current setup uses:
- Minified libraries (jQuery, etc.)
- Minimal custom JavaScript
- No build step needed

## Code Style

### HTML
- Use semantic HTML5 elements
- Include ARIA attributes for accessibility
- Maintain consistent indentation (tabs)

### CSS
- Follow existing naming conventions
- Use BEM-like naming for custom classes
- Keep specificity low

### JavaScript
- Use jQuery for DOM manipulation (consistency with template)
- Comment complex logic
- Maintain existing code style

## Accessibility

Ensure changes maintain accessibility:

- Use semantic HTML
- Include alt text for images
- ARIA labels for navigation
- Keyboard navigation support
- Color contrast meets WCAG AA

Test with:
- Browser accessibility inspector
- Keyboard-only navigation
- Screen reader (NVDA, VoiceOver)

## Security Best Practices

### Content Security Policy

Configured in `staticwebapp.config.json`:
- Restrict inline scripts
- Control resource loading
- Prevent XSS attacks

### Form Handling

Contact form uses Formspree:
- HTTPS only
- CSRF protection
- Rate limiting

### Dependencies

Keep dependencies updated:
```bash
npm audit
npm update
```

## Git Workflow

### Branch Strategy
- `main` - Production (if used)
- `swa` - Azure SWA deployment branch
- Feature branches: `feature/your-feature-name`

### Commit Messages
```bash
# Format
git commit -m "Category: Brief description"

# Examples
git commit -m "Content: Update services section"
git commit -m "Style: Adjust header spacing"
git commit -m "Fix: Correct contact form action"
```

### Before Committing
1. Test changes locally
2. Check for console errors
3. Verify responsive design
4. Review git diff

## Getting Help

### Resources
- [SWA CLI Docs](https://azure.github.io/static-web-apps-cli/)
- [Azure SWA Docs](https://docs.microsoft.com/azure/static-web-apps/)
- [HTML5 UP Docs](https://html5up.net)

### Common Issues

**Q: Changes not appearing**
A: Hard refresh browser (Ctrl+F5 or Cmd+Shift+R)

**Q: Routing not working**
A: Check hash navigation in main.js, ensure no conflicts

**Q: Styles not applying**
A: Clear browser cache, check CSS file loaded in Network tab

**Q: SWA CLI not starting**
A: Check port 4280 is available, try different port with --port flag

## Next Steps

After setting up local development:

1. ✅ Familiarize yourself with project structure
2. Make small test changes to verify workflow
3. Review staticwebapp.config.json for routing rules
4. Set up Sass compilation if doing major styling work
5. Create feature branch for your changes
6. Test thoroughly before pushing
7. Create PR for review

## Advanced Topics

### API Integration

To add serverless functions (Azure Functions):

1. Create `api` directory
2. Add function code
3. Update `staticwebapp.config.json`
4. Configure in `package.json` scripts

### Authentication

Azure SWA supports built-in authentication:
- GitHub
- Azure AD
- Twitter
- Custom OpenID Connect

Configure in `staticwebapp.config.json` if needed.

### Custom Build Process

If you need a build step:

1. Update `package.json` scripts:
```json
{
  "scripts": {
    "build": "your-build-command",
    "start": "swa start dist --app-location dist"
  }
}
```

2. Update `.github/workflows/azure-static-web-apps.yml`:
```yaml
app_build_command: 'npm run build'
output_location: 'dist'
```

---

Happy coding! 🚀
