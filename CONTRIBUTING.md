# Contributing to Blume Tax & Consulting Website

Thank you for your interest in contributing to the Blume Tax & Consulting website! This document provides guidelines and instructions for contributing to this Azure Static Web Apps project.

## Code of Conduct

- Be respectful and professional in all communications
- Focus on constructive feedback
- Help maintain a welcoming environment for all contributors

## Getting Started

### Prerequisites

- Node.js 18+ installed
- npm (comes with Node.js)
- Git installed and configured
- Basic knowledge of HTML, CSS, and JavaScript
- Familiarity with Azure Static Web Apps (helpful but not required)

### Local Development Setup

1. **Fork and clone the repository:**
```bash
git clone https://github.com/Indomitous/blumetax-html5.git
cd blumetax-html5
git checkout swa
```

2. **Install dependencies:**
```bash
npm install
```

3. **Start development server:**
```bash
npm start
```

4. **Open browser to http://localhost:4280**

## Development Workflow

### Creating a Feature Branch

Always create a new branch for your work:

```bash
git checkout swa
git pull origin swa
git checkout -b feature/your-feature-name
```

Branch naming conventions:
- `feature/` - New features
- `fix/` - Bug fixes
- `docs/` - Documentation updates
- `style/` - Style/formatting changes
- `refactor/` - Code refactoring

### Making Changes

1. **Make your changes** in the `src/` directory
2. **Test locally** using `npm start`
3. **Verify** all navigation and functionality works
4. **Check responsive design** using browser dev tools
5. **Review your changes** with `git diff`

### Testing

Before submitting:

- [ ] Test on Chrome/Edge
- [ ] Test on Firefox
- [ ] Test on mobile viewports
- [ ] Verify all links work
- [ ] Check console for errors
- [ ] Test hash-based navigation (#work, #industries, etc.)
- [ ] Verify contact form (if modified)

### Committing Changes

Write clear, descriptive commit messages:

```bash
git add .
git commit -m "Category: Brief description of change

Optional longer description explaining why this change was made
and any additional context."
```

Examples:
```
Content: Update services section with new tax offerings

Style: Adjust header spacing for mobile devices

Fix: Correct contact form action URL

Docs: Update deployment guide with new Azure instructions
```

### Submitting a Pull Request

1. **Push your branch:**
```bash
git push origin feature/your-feature-name
```

2. **Create Pull Request on GitHub:**
   - Go to https://github.com/Indomitous/blumetax-html5
   - Click "New Pull Request"
   - Select your feature branch
   - Fill out the PR template

3. **PR Description should include:**
   - What changed and why
   - Screenshots (if visual changes)
   - Testing performed
   - Any breaking changes
   - Related issues (if applicable)

## Types of Contributions

### Content Updates

**Services, Industries, Technology sections:**
- Edit `src/index.html`
- Update relevant article sections
- Maintain existing HTML structure
- Keep professional tone

**Privacy/Terms pages:**
- Edit `src/privacy.html` or `src/terms.html`
- Ensure legal compliance
- Maintain consistent formatting

### Style Changes

**CSS modifications:**
- Quick changes: Edit `src/assets/css/main.css`
- Major changes: Edit Sass files in `src/assets/sass/`
  - Compile with: `sass src/assets/sass/main.scss src/assets/css/main.css`

**Design principles:**
- Maintain responsive design
- Keep accessibility in mind
- Match existing visual style
- Test across browsers

### Functionality Updates

**JavaScript changes:**
- Edit `src/assets/js/main.js` for routing/navigation
- Edit `src/assets/js/util.js` for utilities
- Maintain jQuery consistency
- Comment complex logic

### Documentation

**Always update documentation for:**
- New features
- Changed deployment steps
- Modified development workflow
- API integrations
- Configuration changes

Update relevant files:
- README.md
- DEVELOPMENT.md
- DEPLOYMENT.md
- CHANGELOG.md

## Style Guide

### HTML

```html
<!-- Use semantic HTML5 -->
<article id="section-name">
  <h2 class="major">Title</h2>
  <p>Content here...</p>
</article>

<!-- Include ARIA attributes -->
<button aria-label="Open menu" aria-expanded="false">
  <span aria-hidden="true">☰</span>
</button>

<!-- Use proper indentation (tabs) -->
```

### CSS

```css
/* Use existing naming conventions */
.article-section { }
.article-item { }

/* Group related properties */
.element {
  /* Positioning */
  position: relative;
  top: 0;
  
  /* Box model */
  display: flex;
  width: 100%;
  padding: 1rem;
  
  /* Typography */
  font-size: 1rem;
  color: #333;
}

/* Comment complex or non-obvious styles */
/* Ensures article stays centered on large screens */
.article--wide { max-width: 56rem; }
```

### JavaScript

```javascript
// Use jQuery for consistency
$('#element').on('click', function() {
  // Handle click
});

// Comment non-obvious logic
// Closes article when clicking outside
$body.on('click', function(event) {
  if (!$(event.target).closest('article').length) {
    // Close logic
  }
});
```

## Project-Specific Guidelines

### Content Guidelines

**Tone:**
- Professional and approachable
- Clear and concise
- Compliance-focused for tax/accounting content
- Technical but accessible for fintech content

**Credentials:**
- Always reference "Nicholas Blume, EA" appropriately
- Maintain IRS Enrolled Agent (EA) designation where relevant
- Keep professional certifications up to date

**Services:**
- Be specific about offerings
- Include both tax and technology services
- Highlight practical solutions over buzzwords

### Asset Management

**Images:**
- Optimize before adding (ImageMagick, TinyPNG, etc.)
- Use descriptive filenames
- Include alt text for accessibility
- Maintain aspect ratios

**Logos/Branding:**
- Preserve brand consistency
- Use approved color palette (see `src/assets/sass/libs/_vars.scss`)
- Update all sizes when changing logos

### Security

**Never commit:**
- API keys or secrets
- Environment variables
- Credentials
- Personal information

**Forms:**
- Validate user input
- Use HTTPS only
- Implement CSRF protection
- Rate limit submissions

## Azure Static Web Apps Specifics

### Configuration Changes

When modifying `staticwebapp.config.json`:
- Maintain security headers
- Test routing rules locally
- Document changes in PR
- Consider cache implications

### Routing

- Preserve hash-based navigation
- SPA fallback must work correctly
- Test deep linking
- Verify 404 handling

### Deployment

- All PRs trigger preview deployments
- Preview URLs: `<app>-<pr-number>.azurestaticapps.net`
- Production deploys on merge to `swa` branch
- Monitor GitHub Actions for failures

## Review Process

1. **Automated checks** run on PR creation
2. **Maintainer review** for code quality and alignment
3. **Preview deployment** for visual verification
4. **Feedback** provided via PR comments
5. **Approval** when ready
6. **Merge** to `swa` branch
7. **Automatic deployment** to production

## Getting Help

**Questions or issues?**
- Check DEVELOPMENT.md for development help
- Review DEPLOYMENT.md for deployment questions
- Search existing GitHub Issues
- Create new issue with details

**Resources:**
- [Azure Static Web Apps Docs](https://docs.microsoft.com/azure/static-web-apps/)
- [SWA CLI Documentation](https://azure.github.io/static-web-apps-cli/)
- [HTML5 UP Dimension Template](https://html5up.net)

## Recognition

Contributors will be recognized in:
- GitHub contributor list
- Future changelog entries
- Project acknowledgments

Thank you for contributing! 🎉
