const path = require("path");
require("esbuild")
  .build({
    absWorkingDir: path.join(process.cwd(), "app/frontend"),
    bundle: true,
    entryPoints: ["application.tsx"],
    loader: { ".ts": "ts" },
    logLevel: "info",
    banner: { js: "// build with esbuild" },
    minify: true,
    outdir: path.join(process.cwd(), "app/assets/builds"),
    platform: "browser",
    plugins: [],
    sourcemap: true,
    watch: true,
  })
  .then(() => console.log("⚡ Done"))
  .catch(() => process.exit(1));
