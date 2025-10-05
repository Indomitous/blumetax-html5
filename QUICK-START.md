# Quick Start Guide - Azure Static Web Apps

Get the Blume Tax & Consulting website running locally in under 5 minutes!

## Prerequisites

- Node.js 18+ ([Download](https://nodejs.org/))
- Git ([Download](https://git-scm.com/))

## Setup (First Time)

```bash
# 1. Clone the repository
git clone https://github.com/Indomitous/blumetax-html5.git
cd blumetax-html5

# 2. Switch to swa branch
git checkout swa

# 3. Install dependencies
npm install

# 4. Start development server
npm start
```

Open your browser to **http://localhost:4280**

That's it! 🎉

## Available Commands

```bash
npm start        # Start development server
npm run dev      # Start development server (alias)
npm run deploy   # Deploy to Azure (requires setup)
```

## Using the Interactive Script

Alternatively, run the quickstart script:

```bash
./quickstart.sh
```

This will:
- ✅ Check prerequisites
- ✅ Install dependencies if needed
- ✅ Optionally start the server

## Next Steps

- 📖 Read [README.md](README.md) for project overview
- 🛠️ Read [DEVELOPMENT.md](DEVELOPMENT.md) for development workflows
- ☁️ Read [DEPLOYMENT.md](DEPLOYMENT.md) for Azure deployment

## Troubleshooting

**Port 4280 already in use?**
```bash
# Kill the process using the port (macOS/Linux)
lsof -ti:4280 | xargs kill -9

# Or use a different port
npx swa start src --port 8080
```

**Node.js not found?**
- Install Node.js 18+ from https://nodejs.org/

**npm install fails?**
- Clear npm cache: `npm cache clean --force`
- Delete node_modules: `rm -rf node_modules`
- Try again: `npm install`

## Getting Help

- 📚 Check [DEVELOPMENT.md](DEVELOPMENT.md) for detailed guides
- 🐛 Report issues on [GitHub](https://github.com/Indomitous/blumetax-html5/issues)
- 📖 Read [Azure SWA docs](https://docs.microsoft.com/azure/static-web-apps/)

---

Happy coding! 🚀
