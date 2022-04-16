class CoachNotebookFormBuilder < ActionView::Helpers::FormBuilder
  def text_field(method, options = {})
    label_text = options.fetch(:label, method.to_s.humanize)
    label_options = options.fetch(:label_options, { class: "block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2" })

    input_defaults = { class: "max-w-lg block w-full shadow-sm focus:ring-amber-500 focus:border-amber-500 sm:max-w-xs sm:text-sm border-gray-300 rounded-md" }
    input_options = merge_options(input_defaults, options.fetch(:input_options, {}))

    @template.content_tag(:div, class: "sm:grid sm:grid-cols-3 sm:gap-4 sm:items-start sm:border-t sm:border-gray-200 sm:pt-5 pb-2") do
      @template.label(@object_name, method, label_text, label_options) +
      @template.content_tag(:div, class: "mt-1 sm:mt-0 sm:col-span-2") do
        super(method, input_options)
      end
    end
  end

  def date_field(method, options = {})
    label_text = options.fetch(:label, method.to_s.humanize)
    label_options = options.fetch(:label_options, { class: "block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2" })

    input_defaults = { class: "max-w-lg block w-full shadow-sm focus:ring-amber-500 focus:border-amber-500 sm:max-w-xs sm:text-sm border-gray-300 rounded-md" }
    input_options = merge_options(input_defaults, options.fetch(:input_options, {}))

    @template.content_tag(:div, class: "sm:grid sm:grid-cols-3 sm:gap-4 sm:items-start sm:border-t sm:border-gray-200 sm:pt-5 pb-2") do
      @template.label(@object_name, method, label_text, label_options) +
      @template.content_tag(:div, class: "mt-1 sm:mt-0 sm:col-span-2") do
        super(method, input_options)
      end
    end
  end

  def datetime_field(method, options = {})
    label_text = options.fetch(:label, method.to_s.humanize)
    label_options = options.fetch(:label_options, { class: "block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2" })

    input_defaults = { class: "max-w-lg block w-full shadow-sm focus:ring-amber-500 focus:border-amber-500 sm:max-w-xs sm:text-sm border-gray-300 rounded-md" }
    input_options = merge_options(input_defaults, options.fetch(:input_options, {}))

    @template.content_tag(:div, class: "sm:grid sm:grid-cols-3 sm:gap-4 sm:items-start sm:border-t sm:border-gray-200 sm:pt-5 pb-2") do
      @template.label(@object_name, method, label_text, label_options) +
      @template.content_tag(:div, class: "mt-1 sm:mt-0 sm:col-span-2") do
        super(method, input_options)
      end
    end
  end

  def select(method, choices, options = {})
    label_text = options.fetch(:label, method.to_s.humanize)
    label_options = options.fetch(:label_options, { class: "block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2" })

    input_defaults = { class: "max-w-lg block focus:ring-amber-500 focus:border-amber-500 w-full shadow-sm sm:max-w-xs sm:text-sm border-gray-300 rounded-md" }
    input_options = merge_options(input_defaults, options.fetch(:input_options, {}))

    @template.content_tag(:div, class: "sm:grid sm:grid-cols-3 sm:gap-4 sm:items-start sm:border-t sm:border-gray-200 sm:pt-5 pb-2") do
      @template.label(@object_name, method, label_text, label_options) +
      @template.content_tag(:div, class: "mt-1 sm:mt-0 sm:col-span-2") do
        super(method, choices, input_options)
      end
    end
  end

  def text_area(method, options = {})
    label_text = options.fetch(:label, method.to_s.humanize)
    label_options = options.fetch(:label_options, { class: "block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2" })

    options[:class] = "max-w-lg block w-full shadow-sm focus:ring-amber-500 focus:border-amber-500 sm:max-w-xs sm:text-sm border-gray-300 rounded-md"

    @template.content_tag(:div, class: "sm:grid sm:grid-cols-3 sm:gap-4 sm:items-start sm:border-t sm:border-gray-200 sm:pt-5 pb-2") do
      @template.label(@object_name, method, label_text, label_options) +
      @template.content_tag(:div, class: "mt-1 sm:mt-0 sm:col-span-2") do
        super(method, options)
      end
    end
  end

  private

  def merge_options(defaults, new_options)
    (defaults.keys + new_options.keys).inject({}) { |h, key|
      h[key] = [defaults[key], new_options[key]].compact.join(" ")
      h
    }
  end
end
