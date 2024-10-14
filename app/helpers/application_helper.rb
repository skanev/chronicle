module ApplicationHelper
  def inline_form_with(**options, &block)
    InlineFormBuilder.apply_to options
    form_with(**options, &block)
  end
end
