import React from "react";
import ReactDOM from "react-dom";
import { TagField } from "./components/TagField";

document.querySelectorAll("[data-tag_field]").forEach((field) => {
  ReactDOM.render(
    <React.StrictMode>
      <TagField name={field.getAttribute("name")} />
    </React.StrictMode>,
    field.parentElement
  );
});
