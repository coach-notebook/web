module.exports = {
  content: [
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.tsx",
    "./app/views/**/*.(haml|erb)",
    "./app/components/**/*.(haml|erb)",
  ],
  theme: {
    fontFamily: {
      sans: ["'Anek Tamil'", "Helvetica", "Arial", "sans-serif"],
    },
  },
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/aspect-ratio"),
    require("@tailwindcss/typography"),
    require("@tailwindcss/line-clamp"),
    require("@tailwindcss/aspect-ratio"),
  ],
};
