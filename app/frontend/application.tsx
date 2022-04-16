import React from "react";
import { render } from "react-dom";
import { Rating } from "./components/Rating";
import { TagField } from "./components/TagField";

document.querySelectorAll("[data-tag_field]").forEach((field) => {
  render(
    <React.StrictMode>
      <TagField
        name={field.getAttribute("name")}
        values={JSON.parse(field.value)}
      />
    </React.StrictMode>,
    field.parentElement
  );
});

document.querySelectorAll("[data-rating]").forEach((field) => {
  render(
    <React.StrictMode>
      <Rating />
    </React.StrictMode>,
    field.parentElement
  );
});
