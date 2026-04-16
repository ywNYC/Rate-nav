#!/bin/bash
set -e

SRC="src/rate-navigator.jsx"
OUT_DIR="dist"
OUT="$OUT_DIR/index.html"

mkdir -p "$OUT_DIR"

cat > "$OUT" << 'HTMLHEAD'
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<title>Rate Navigator by JMJ | 房贷利率导航</title>
<meta name="description" content="Professional mortgage decision tools: ARM vs Fixed, Points Comparison, Refinance Analysis, 1031 Exchange" />
<meta name="theme-color" content="#2D9B65" />
<link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 32 32'><rect width='32' height='32' rx='8' fill='%232D9B65'/><path d='M16 6L8 14V26H12V20H20V26H24V14L16 6Z' fill='white'/></svg>" />
<style>*{margin:0;padding:0;box-sizing:border-box}body{background:#F5F8F2;overflow-x:hidden;-webkit-font-smoothing:antialiased}#root{min-height:100vh}</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/react/18.2.0/umd/react.production.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/react-dom/18.2.0/umd/react-dom.production.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/recharts/2.12.7/Recharts.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/babel-standalone/7.24.7/babel.min.js"></script>
</head>
<body>
<div id="root"></div>
<script type="text/babel">
HTMLHEAD

# Strip everything up to and including the line that starts with `} from "recharts";`
# Use sed to delete range: from first line to the `} from "recharts";` line (inclusive)
sed '1,/^} from "recharts";$/d' "$SRC" \
  | sed 's/export default //' \
  | sed 's/\buseState\b/React.useState/g' \
  | sed 's/\buseMemo\b/React.useMemo/g' \
  | sed 's/\buseCallback\b/React.useCallback/g' \
  | sed 's/\buseRef\b/React.useRef/g' \
  | sed 's/\bAreaChart\b/Recharts.AreaChart/g' \
  | sed 's/<Area\b/<Recharts.Area/g' \
  | sed 's|</Area>|</Recharts.Area>|g' \
  | sed 's/\bXAxis\b/Recharts.XAxis/g' \
  | sed 's/\bYAxis\b/Recharts.YAxis/g' \
  | sed 's/\bTooltip\b/Recharts.Tooltip/g' \
  | sed 's/\bResponsiveContainer\b/Recharts.ResponsiveContainer/g' \
  | sed 's/\bCartesianGrid\b/Recharts.CartesianGrid/g' \
  | sed 's/\bReferenceLine\b/Recharts.ReferenceLine/g' \
  >> "$OUT"

cat >> "$OUT" << 'HTMLFOOT'

ReactDOM.createRoot(document.getElementById("root")).render(React.createElement(App));
</script>
</body>
</html>
HTMLFOOT

echo "✓ Built: $OUT ($(wc -l < $OUT) lines, $(du -h $OUT | cut -f1))"
