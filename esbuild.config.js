const path = require("path");
require("esbuild")
  .build({
    absWorkingDir: path.join(process.cwd(), "app/frontend"),
    bundle: true,
    tsconfig: path.join(process.cwd(), "tsconfig.json"),
    entryPoints: ["application.tsx"],-
    logLevel: "info",
    banner: { js: "// build with esbuild" },
    minify: true,
    outdir: path.join(process.cwd(), "app/assets/builds"),
    platform: "browser",
    plugins: [],
    sourcemap: true,
  })
  .then(() => console.log("⚡ Done"))
  .catch(() => process.exit(1));
