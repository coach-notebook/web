module.exports = {
  content: [
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.tsx",
    "./app/views/**/*.erb",
  ],
  theme: {},
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/aspect-ratio"),
    require("@tailwindcss/typography"),
    require("@tailwindcss/line-clamp"),
    require("@tailwindcss/aspect-ratio"),
  ],
};
