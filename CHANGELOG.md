# Changelog

All notable changes to the Blume Tax & Consulting website project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.0.0] - 2024-10-05

### Added - Azure Static Web Apps Refactoring

This major release refactors the entire project for Azure Static Web Apps deployment.

#### Infrastructure
- **Azure Static Web Apps CLI** integration for local development and deployment
- **Node.js project structure** with package.json and npm scripts
- **SWA configuration** file (staticwebapp.config.json) with routing, caching, and security headers
- **GitHub Actions workflow** for automated CI/CD deployment to Azure
- **SWA CLI configuration** file for local development settings

#### Project Structure
- **New `src/` directory** containing all deployable static files
  - Moved all HTML files to src/
  - Moved assets/ directory to src/assets/
  - Moved images/ directory to src/images/
  - Moved site.webmanifest to src/
- **Maintained asset paths** for compatibility (absolute paths from root)

#### Documentation
- **README.md** - Comprehensive project overview with setup instructions
- **DEPLOYMENT.md** - Detailed Azure deployment guide with multiple deployment methods
- **DEVELOPMENT.md** - Complete local development guide with common tasks
- **CHANGELOG.md** - This file for tracking changes
- **Updated README.txt** - Added notice about new documentation structure

#### Developer Experience
- **quickstart.sh** - Automated setup and development server startup script
- **VS Code tasks.json** - Pre-configured tasks for common development workflows
- **VS Code extensions.json** - Recommended extensions for Azure SWA development
- **.gitignore** - Comprehensive ignore rules for node_modules, build artifacts, etc.

#### Configuration Features
- **Security headers** configured (X-Content-Type-Options, X-Frame-Options, X-XSS-Protection, Referrer-Policy)
- **Caching strategy** - 1 year cache for static assets
- **Routing rules** - Custom routes for privacy.html and terms.html
- **SPA fallback** - Proper handling of hash-based routing
- **MIME types** - Correct handling of .webmanifest files

#### npm Scripts
- `npm start` / `npm run dev` - Start SWA CLI development server
- `npm run build` - Build project (copy src to dist)
- `npm run deploy` - Deploy to Azure Static Web Apps

### Changed
- **Deployment target** changed from IIS/Windows Server to Azure Static Web Apps
- **Development workflow** now uses SWA CLI instead of static file server
- **File organization** - All web files moved to src/ directory
- **CI/CD approach** - GitHub Actions instead of manual deployment

### Technical Details

#### Breaking Changes
- Project structure completely reorganized for SWA
- Build and deployment process changed to use Azure tooling
- Local development now requires Node.js 18+ and npm

#### Migration Notes
- Original IIS deployment docs preserved in README.txt
- All original assets maintained, just relocated to src/
- Client-facing URLs and paths remain unchanged
- Hash-based routing (#work, #industries, etc.) continues to work

#### Browser Support
- No changes to browser compatibility
- Modern browsers (Chrome, Firefox, Safari, Edge)
- Mobile browsers (iOS Safari, Chrome Mobile)
- Progressive enhancement for older browsers

#### Performance
- CDN-backed delivery via Azure Static Web Apps
- Automatic SSL/TLS with Azure
- Global edge network for reduced latency
- Optimized caching headers

#### Security Enhancements
- Automatic HTTPS enforcement
- Security headers configured by default
- Azure DDoS protection
- Compliance with Azure security standards

### Dependencies
- **@azure/static-web-apps-cli** ^2.0.7 (dev dependency)

### Deployment
- **Free tier** Azure Static Web Apps supports:
  - 100 GB bandwidth per month
  - Free SSL certificates
  - Custom domain support
  - Unlimited staging environments
  
### Future Roadmap
- [ ] Add Azure Functions API if backend services needed
- [ ] Implement Azure Application Insights for monitoring
- [ ] Consider service worker for offline support
- [ ] Evaluate CDN optimization strategies
- [ ] Add automated testing in CI/CD pipeline

---

## [1.0.0] - Previous

### Original Release
- HTML5 UP Dimension template implementation
- Custom branding and content for Blume Tax & Consulting
- Single-page application with hash-based routing
- Responsive design for all devices
- Contact form integration (Formspree)
- PWA manifest for installable web app
- Privacy and Terms pages
- IIS deployment configuration
- Sass source files for custom styling

### Features
- Services section with tax, accounting, and engineering offerings
- Industries section targeting different business types
- Technology capabilities showcase
- New client onboarding process information
- Professional background and credentials
- Contact information and social media links

---

## Versioning

- **Major version** (X.0.0) - Breaking changes, major refactoring
- **Minor version** (0.X.0) - New features, backward compatible
- **Patch version** (0.0.X) - Bug fixes, minor improvements

## Support

For issues or questions:
- GitHub Issues: https://github.com/Indomitous/blumetax-html5/issues
- Documentation: See README.md, DEPLOYMENT.md, DEVELOPMENT.md
