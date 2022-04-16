class CoachNotebookFormBuilder < ActionView::Helpers::FormBuilder
  def tag_field(method, options = {})
    label_text = options.fetch(:label, method.to_s.humanize)
    label_options = options.fetch(:label_options, { class: "form-label" })

    input_defaults = { "data-tag_field": field_id(@object_name, method) }

    @template.label(@object_name, method, label_text, label_options) +
      @template.content_tag(:div, class: "form-input-wrapper") do
        @template.hidden_field_tag(field_name(method), object.send(method).to_s, input_defaults) +
          @template.text_field_tag(field_id(@object_name, method) + "_tag", "", class: "form-input")
      end
  end

  def password_field(method, options = {})
    label_text = options.fetch(:label, method.to_s.humanize)
    label_options = options.fetch(:label_options, { class: "form-label" })

    input_defaults = { class: "form-input" }
    input_options = merge_options(input_defaults, options.fetch(:input_options, {}))

    @template.label(@object_name, method, label_text, label_options) +
      @template.content_tag(:div, class: "form-input-wrapper") do
        super(method, input_options)
      end
  end

  def text_field(method, options = {})
    label_text = options.fetch(:label, method.to_s.humanize)
    label_options = options.fetch(:label_options, { class: "form-label" })

    input_defaults = { class: "form-input" }
    input_options = merge_options(input_defaults, options.fetch(:input_options, {}))

    @template.label(@object_name, method, label_text, label_options) +
      @template.content_tag(:div, class: "form-input-wrapper") do
        super(method, input_options)
      end
  end

  def date_field(method, options = {})
    label_text = options.fetch(:label, method.to_s.humanize)
    label_options = options.fetch(:label_options, { class: "form-label" })

    input_defaults = { class: "form-input" }
    input_options = merge_options(input_defaults, options.fetch(:input_options, {}))

    @template.label(@object_name, method, label_text, label_options) +
      @template.content_tag(:div, class: "form-input-wrapper") do
        super(method, input_options)
      end
  end

  def datetime_field(method, options = {})
    label_text = options.fetch(:label, method.to_s.humanize)
    label_options = options.fetch(:label_options, { class: "form-label" })

    input_defaults = { class: "form-input" }
    input_options = merge_options(input_defaults, options.fetch(:input_options, {}))

    @template.label(@object_name, method, label_text, label_options) +
      @template.content_tag(:div, class: "form-input-wrapper") do
        super(method, input_options)
      end
  end

  def select(method, choices, options = {})
    label_text = options.fetch(:label, method.to_s.humanize)
    label_options = options.fetch(:label_options, { class: "form-label" })

    input_defaults = { class: "form-input" }
    input_options = merge_options(input_defaults, options.fetch(:input_options, {}))

    @template.label(@object_name, method, label_text, label_options) +
      @template.content_tag(:div, class: "form-input-wrapper") do
        super(method, choices, options, input_options)
      end
  end

  def text_area(method, options = {})
    label_text = options.fetch(:label, method.to_s.humanize)
    label_options = options.fetch(:label_options, { class: "form-label" })

    options[:class] = "form-input"

    @template.label(@object_name, method, label_text, label_options) +
      @template.content_tag(:div, class: "form-input-wrapper") do
        super(method, options)
      end
  end

  def submit(value = nil, options = {})
    value, options = nil, value if value.is_a?(Hash)
    value ||= submit_default_value
    options[:class] = "form-submit"
    @template.submit_tag(value, options)
  end

  private

  def merge_options(defaults, new_options)
    (defaults.keys + new_options.keys).each_with_object({}) { |key, h|
      h[key] = [defaults[key], new_options[key]].compact.join(" ")
    }
  end
end
