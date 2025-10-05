# Blume Tax & Consulting - Azure Static Web Apps

Professional tax and accounting services website built with HTML5, CSS3, and JavaScript, deployed on Azure Static Web Apps.

## About

Blume Tax & Consulting provides accounting, tax preparation and planning, IRS representation, and fintech solutions for small businesses and individuals. Led by Nicholas Blume, EA.

## Technology Stack

- **Frontend**: HTML5, CSS3, JavaScript (jQuery)
- **Hosting**: Azure Static Web Apps
- **Template**: Dimension by HTML5 UP (CCA 3.0 license)
- **Build Tool**: Azure Static Web Apps CLI (SWA CLI)

## Project Structure

```
blumetax-html5/
├── src/                    # Source files (deployed to Azure)
│   ├── assets/            # CSS, JS, fonts, icons
│   │   ├── css/          # Compiled stylesheets
│   │   ├── js/           # JavaScript files
│   │   ├── sass/         # Sass source files
│   │   └── webfonts/     # Font files
│   ├── images/           # Images and logos
│   ├── index.html        # Main single-page application
│   ├── privacy.html      # Privacy policy
│   ├── terms.html        # Terms of service
│   └── site.webmanifest  # PWA manifest
├── staticwebapp.config.json  # Azure SWA configuration
├── package.json          # Node.js dependencies and scripts
└── README.md            # This file
```

## Local Development

### Prerequisites

- Node.js (v18 or higher recommended)
- npm (comes with Node.js)

### Setup

1. Clone the repository:
```bash
git clone https://github.com/Indomitous/blumetax-html5.git
cd blumetax-html5
```

2. Install dependencies:
```bash
npm install
```

3. Start the development server:
```bash
npm start
```

The site will be available at `http://localhost:4280`

### Available Scripts

- `npm start` or `npm run dev` - Start SWA CLI development server
- `npm run build` - Build the project (copies src to dist)
- `npm run deploy` - Deploy to Azure Static Web Apps

## Azure Static Web Apps Features

### Configuration

The `staticwebapp.config.json` file configures:

- **Routing**: Custom routes for privacy.html and terms.html
- **Caching**: Aggressive caching for static assets (1 year)
- **Security Headers**: 
  - X-Content-Type-Options: nosniff
  - X-Frame-Options: SAMEORIGIN
  - X-XSS-Protection: 1; mode=block
  - Referrer-Policy: strict-origin-when-cross-origin
- **MIME Types**: Proper handling of .webmanifest files
- **Fallback**: SPA fallback to index.html for hash-based routing

### Deployment

Deploy to Azure Static Web Apps using:

1. **GitHub Actions** (Recommended): 
   - Connect your GitHub repository to Azure Static Web Apps
   - Automatic deployment on push to main branch
   
2. **Azure CLI**:
   ```bash
   npm run deploy
   ```

3. **VS Code Extension**:
   - Install Azure Static Web Apps extension
   - Right-click project and select "Deploy to Static Web Apps"

## Environment Configuration

For production deployment, ensure:

1. Update canonical URLs in HTML files
2. Configure custom domain in Azure Portal
3. Set up SSL certificate (automatic with Azure)
4. Update site.webmanifest URLs for production domain

## Site Features

- **Single Page Application**: Hash-based routing with modal articles
- **Progressive Web App**: Manifest file for installable web app
- **Responsive Design**: Mobile-first, fully responsive
- **Performance**: Optimized images, preloading, caching
- **Security**: Content Security Policy headers via SWA config
- **SEO**: Meta tags, OpenGraph tags, structured data

## Content Sections

- **Services**: Tax preparation, accounting, engineering, hosting
- **Industries**: Sole proprietors, mom & pop shops, growth-stage, enterprises
- **Technology**: Platforms, data & automation, cloud & hosting, security
- **New Clients**: Discovery, engagement, delivery process
- **About**: Professional background and credentials
- **Contact**: Calendly integration and contact form (Formspree)

## Customization

### Updating Content

Edit `src/index.html` to update:
- Service offerings in the `#work` article
- Industry focus in the `#industries` article
- Technology stack in the `#capabilities` article
- Contact information in the `#contact` article

### Styling

- Modify `src/assets/css/main.css` for quick changes
- Edit Sass files in `src/assets/sass/` for comprehensive theming
- Compile Sass: Install Dart Sass and run `sass assets/sass/main.scss assets/css/main.css`

### Branding

Update logos and icons in:
- `src/images/` - Logo files and favicons
- `src/site.webmanifest` - PWA icons configuration
- HTML files - Meta tags and OpenGraph images

## Browser Support

- Modern browsers (Chrome, Firefox, Safari, Edge)
- Mobile browsers (iOS Safari, Chrome Mobile)
- Progressive enhancement for older browsers

## License

Website template: CCA 3.0 license (html5up.net/license)
Content: © Blume Tax & Consulting

## Contact

**Nicholas Blume, EA**
- Website: https://www.blumetax.com
- Location: Fulton, IL

## Credits

- Template: [Dimension by HTML5 UP](https://html5up.net)
- Icons: Font Awesome
- Framework: jQuery
- Hosting: Azure Static Web Apps
