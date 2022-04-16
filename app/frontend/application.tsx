import React from "react";
import { Rating } from "./components/Rating";
import { TagField } from "./components/TagField";

import { createRoot } from "react-dom/client";

document.querySelectorAll("[data-tag_field]").forEach((field) => {
  const id = field.getAttribute("id");
  const element = document.getElementById(id!) as HTMLInputElement;
  const value = element.value;
  const root = createRoot(element.parentElement!);
  let jsonValues = [];
  try {
    jsonValues = JSON.parse(value);
  } catch (error) {}
  root.render(
    <React.StrictMode>
      <TagField name={field.getAttribute("name")} values={jsonValues} />
    </React.StrictMode>
  );

  return null;
});

document.querySelectorAll("[data-rating]").forEach((field) => {
  const id = field.getAttribute("id");
  const element = document.getElementById(id!) as HTMLInputElement;
  const root = createRoot(element.parentElement!);
  root.render(
    <React.StrictMode>
      <Rating />
    </React.StrictMode>
  );
});
