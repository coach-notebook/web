module.exports = {
  content: [
    "./app/helpers/**/*.rb",
    "./app/views/**/*.(haml|erb)",
    "./app/frontend/**/*.(ts|tsx)",
    "./app/components/**/*.(haml|erb)",
    "./app/frontend/entrypoints/application.css",
  ],
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/aspect-ratio"),
    require("@tailwindcss/typography"),
    require("@tailwindcss/line-clamp"),
    require("@tailwindcss/aspect-ratio"),
  ],
};
