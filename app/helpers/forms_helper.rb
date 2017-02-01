module FormsHelper

  def form_group(model, field, &block)
    content = capture(&block)
    css_classes = ["form-group"]
    if model.errors.key?(field)
      css_classes << "has-error"
      content += content_tag(:p, model.errors[field].join(", "), class: "help-block")
    end
    content_tag(:div, content, class: css_classes)
  end
end
