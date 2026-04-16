# Rate Navigator by JMJ

Professional mortgage decision tools for MLOs and homebuyers. Bilingual (中文/English), mobile-first, single-file HTML deploy.

🌐 **Live Demo**: [Deploy to Cloudflare Pages](#deployment)

## Features

### 🏠 ARM vs Fixed Rate
Compare ARMs (3/1, 5/1, 7/1, 10/1) against 30-year fixed across 8 rate scenarios with Monte Carlo simulation, APR calculation, and interactive rate/payment/interest charts.

### 💎 Points Comparison
Analyze 2-7 discount point options side-by-side with break-even timeline, total cost comparison, and APR breakdown.

### 🔄 Refinance Analysis
Current vs new loan comparison with closing costs, NY Mortgage Tax presets, CEMA support, and break-even analysis.

### 📊 1031 Exchange Analyzer
Calculate deferred capital gains tax through 1031 exchange with:
- Mid-month convention depreciation (27.5yr residential / 39yr commercial)
- Dual-state tax selection (property state + resident state, takes higher)
- 2025 federal CG brackets (0%/15%/20%) based on taxable income
- NIIT 3.8% threshold logic
- 45/180 day timeline tracking

## Tech Stack

- **React 18** (UMD via CDN)
- **Recharts 2.12** for charts
- **Babel Standalone** for JSX transpilation (no build step required)
- Single-file HTML, zero build process

## Deployment

### Cloudflare Pages (Recommended)

1. Go to [Cloudflare Pages](https://pages.cloudflare.com/)
2. Click "Create a project" → "Upload assets"
3. Upload the `dist/` folder contents (or zip and upload)
4. Done — no build command needed

### Any Static Host

Upload `dist/index.html` to:
- Netlify (drag & drop)
- Vercel (`vercel dist/`)
- GitHub Pages (push `dist/` to `gh-pages` branch)
- AWS S3 / CloudFront
- Any web server

### Local Development

```bash
# Option 1: Python
cd dist && python3 -m http.server 8000

# Option 2: Node
npx serve dist

# Option 3: Just open
open dist/index.html
```

## Project Structure

```
rate-navigator/
├── README.md
├── LICENSE
├── .gitignore
├── src/
│   └── rate-navigator.jsx    # Source (ES modules, React imports)
├── dist/
│   └── index.html            # Production build (single file, CDN deps)
└── build.sh                  # Build script (src → dist)
```

## Build from Source

```bash
chmod +x build.sh
./build.sh
```

This transforms `src/rate-navigator.jsx` into `dist/index.html` with CDN dependencies.

## Customization

### Branding
Edit `LogoSVG` component and `BrandingFooter` in `src/rate-navigator.jsx`.

### Colors
Edit the `C` object near the top of `src/rate-navigator.jsx`:
```js
const C = {
  arm: "#2D9B65",      // ARM/primary green
  fixed: "#5485E0",    // Fixed rate blue
  warn: "#D98E30",     // 1031 orange
  purple: "#7C5FC2",   // Refi purple
  // ...
};
```

### State Tax Rates
Edit `STATE_CG_RATES` in 1031 section — includes all 50 states + DC with 2025 capital gains rates.

## Disclaimer

For informational purposes only. Not financial, tax, or legal advice. Consult a licensed professional (MLO, CPA, attorney) before making financial decisions.

## License

MIT — see [LICENSE](LICENSE)

## Credits

Built by JMJ · Powered by Claude
