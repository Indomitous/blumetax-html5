# Azure Static Web Apps Deployment Guide

This guide covers deploying Blume Tax & Consulting website to Azure Static Web Apps.

## Prerequisites

1. Azure account with active subscription
2. GitHub account with repository access
3. Azure CLI installed (optional, for CLI deployment)
4. Node.js 18+ installed locally

## Deployment Methods

### Method 1: GitHub Actions (Recommended)

This is the easiest and most automated deployment method.

#### Steps:

1. **Create Azure Static Web App Resource**
   
   a. Log in to [Azure Portal](https://portal.azure.com)
   
   b. Click "Create a resource" → Search for "Static Web App"
   
   c. Click "Create"
   
   d. Configure the resource:
      - **Subscription**: Select your subscription
      - **Resource Group**: Create new or use existing
      - **Name**: `blumetax-website` (or your preferred name)
      - **Plan type**: Free (or Standard for custom domains/advanced features)
      - **Region**: Choose closest to your users
      - **Deployment details**:
        - Source: GitHub
        - Organization: Your GitHub username/org
        - Repository: `blumetax-html5`
        - Branch: `swa`
      - **Build Details**:
        - Build Presets: Custom
        - App location: `/src`
        - Api location: (leave empty)
        - Output location: (leave empty)
   
   e. Click "Review + Create" → "Create"

2. **Automatic Deployment**
   
   - Azure automatically creates a GitHub Actions workflow
   - Adds `AZURE_STATIC_WEB_APPS_API_TOKEN` secret to your repository
   - Deploys on every push to the `swa` branch
   - Creates preview deployments for pull requests

3. **Verify Deployment**
   
   - Go to your Static Web App resource in Azure Portal
   - Click "Browse" to view your deployed site
   - Check "Environments" to see deployment history

### Method 2: Azure CLI Deployment

Deploy directly from your local machine using Azure CLI.

#### Steps:

1. **Install Azure CLI**
   ```bash
   # macOS
   brew install azure-cli
   
   # Windows
   # Download from https://aka.ms/installazurecliwindows
   
   # Linux
   curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
   ```

2. **Login to Azure**
   ```bash
   az login
   ```

3. **Create Static Web App**
   ```bash
   az staticwebapp create \
     --name blumetax-website \
     --resource-group <your-resource-group> \
     --source https://github.com/Indomitous/blumetax-html5 \
     --location "Central US" \
     --branch swa \
     --app-location "src" \
     --login-with-github
   ```

4. **Deploy with SWA CLI**
   ```bash
   npm run deploy
   ```

### Method 3: VS Code Extension

1. **Install Extension**
   - Open VS Code
   - Install "Azure Static Web Apps" extension

2. **Deploy**
   - Open Command Palette (Ctrl+Shift+P)
   - Type "Static Web Apps: Create Static Web App"
   - Follow the prompts
   - Select `src` as the app location

## Post-Deployment Configuration

### Custom Domain Setup

1. In Azure Portal, navigate to your Static Web App
2. Click "Custom domains" in the left menu
3. Click "Add custom domain"
4. Enter your domain (e.g., `www.blumetax.com`)
5. Add the CNAME record to your DNS provider:
   ```
   CNAME www <your-app-name>.azurestaticapps.net
   ```
6. Wait for DNS propagation (up to 48 hours)
7. Azure automatically provisions SSL certificate

### Environment Variables

If you need environment variables:

1. Go to your Static Web App in Azure Portal
2. Click "Configuration" in the left menu
3. Add application settings as needed

### Custom Headers & Routes

The `staticwebapp.config.json` file in the repository root configures:
- Custom routing rules
- Security headers
- Cache control
- MIME types
- Fallback routes

Modify this file to customize behavior.

## Monitoring & Logs

### View Deployment Logs

**GitHub Actions:**
- Go to your repository on GitHub
- Click "Actions" tab
- Select the workflow run
- View logs for each step

**Azure Portal:**
- Navigate to your Static Web App
- Click "Environments" → Select environment
- View deployment details and logs

### Application Insights (Optional)

1. Create Application Insights resource in Azure
2. In Static Web App settings, add:
   ```
   APPLICATIONINSIGHTS_CONNECTION_STRING=<your-connection-string>
   ```
3. Monitor traffic, performance, and errors

## Troubleshooting

### Common Issues

**Issue: 404 errors on page refresh**
- Solution: Ensure `staticwebapp.config.json` has proper fallback configuration
- Current config redirects all unknown routes to index.html

**Issue: Assets not loading**
- Check that paths in HTML use absolute paths (`/images/...`, `/assets/...`)
- Verify `src` directory structure matches expected layout

**Issue: Deployment fails**
- Check GitHub Actions logs for errors
- Verify `app_location` in workflow is `/src`
- Ensure no build errors in your code

**Issue: Custom domain not working**
- Verify CNAME record is correctly configured
- Wait for DNS propagation (can take up to 48 hours)
- Check domain status in Azure Portal

### Getting Help

- Azure Static Web Apps docs: https://docs.microsoft.com/azure/static-web-apps/
- SWA CLI docs: https://azure.github.io/static-web-apps-cli/
- GitHub Issues: Report issues in the repository

## Performance Optimization

### Recommendations Applied

1. ✅ Aggressive caching (1 year for static assets)
2. ✅ Image optimization (preloading critical images)
3. ✅ Security headers configured
4. ✅ MIME types properly set
5. ✅ SPA routing optimized

### Additional Optimizations

Consider:
- Azure CDN for global distribution
- Image compression (already optimized)
- Lazy loading for non-critical resources
- Service worker for offline support

## Cost Estimation

**Free Tier:**
- 100 GB bandwidth per month
- Free SSL certificate
- Custom domain included
- Unlimited environments (staging/preview)

**Standard Tier (if needed):**
- Starting at ~$9/month
- Increased bandwidth
- Enhanced authentication
- SLA guarantees

Most small business sites fit comfortably in the free tier.

## Security

### Security Features Enabled

1. **HTTPS**: Automatic, free SSL certificates
2. **Security Headers**: 
   - X-Content-Type-Options
   - X-Frame-Options
   - X-XSS-Protection
   - Referrer-Policy
3. **Custom Authentication**: Available if needed
4. **Private Endpoints**: Available in Standard tier

### Best Practices

- Keep dependencies updated: `npm audit`
- Review and update security headers periodically
- Enable Azure Monitor for security events
- Use secrets for sensitive configuration

## Rollback Procedure

If a deployment causes issues:

**GitHub Actions:**
1. Revert the commit that caused the issue
2. Push to trigger new deployment

**Manual:**
1. In Azure Portal, go to your Static Web App
2. Click "Environments"
3. Select a previous successful deployment
4. Click "Promote" to make it active

## CI/CD Pipeline Details

The `.github/workflows/azure-static-web-apps.yml` workflow:

1. Triggers on push to `swa` or `main` branches
2. Checks out code with submodules
3. Deploys to Azure using official action
4. Skips build (static files only)
5. Creates preview deployments for PRs
6. Cleans up closed PR environments

## Next Steps

1. ✅ Deploy to Azure Static Web Apps
2. Configure custom domain (www.blumetax.com)
3. Set up monitoring and alerts
4. Test all functionality in production
5. Configure backup/disaster recovery
6. Document runbook for team

## Support Contacts

- Azure Support: [Azure Portal Support](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- Repository Issues: [GitHub Issues](https://github.com/Indomitous/blumetax-html5/issues)
