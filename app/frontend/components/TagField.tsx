import React, { useEffect, useRef, useState } from "react";

export const TagField = ({
  name,
  values,
}: {
  name?: string | null;
  values: string[];
}) => {
  const [tags, setTags] = useState<String[]>([]);
  const inputRef = useRef<HTMLInputElement>(null);
  const hiddenInputRef = useRef<HTMLInputElement>(null);

  if (!name) {
    return null;
  }

  useEffect(() => {
    setTags(values);
  }, [hiddenInputRef]);

  const onRemoveTag = (index: number) => {
    const t = tags;
    t.splice(index, 1);
    setTags([...t]);
  };

  const onKeyChange: React.KeyboardEventHandler<HTMLInputElement> = (
    event: React.KeyboardEvent
  ) => {
    if (
      (event.key == "U+000A" || event.key == "Enter" || event.keyCode == 13) &&
      inputRef?.current
    ) {
      const value = inputRef?.current?.value;
      setTags([...tags, value]);
      inputRef.current.value = "";
      event.preventDefault();
    }
  };

  return (
    <>
      <input
        type="hidden"
        ref={hiddenInputRef}
        name={name}
        value={JSON.stringify(tags)}
      />
      <input
        autoComplete="off"
        className="form-input-tag form-input"
        onKeyDown={onKeyChange}
        type="text"
        name="tag_input"
        ref={inputRef}
      />
      {tags.map((tag, index) => (
        <div key={index} className="form-tag">
          <span>{tag}</span>
          <button
            type="button"
            onClick={(e) => {
              onRemoveTag(index);
              e.preventDefault;
            }}
          >
            ×
          </button>
        </div>
      ))}
    </>
  );
};
