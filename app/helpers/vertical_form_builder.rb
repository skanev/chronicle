class VerticalFormBuilder < ActionView::Helpers::FormBuilder
  class << self
    def apply_to(options)
      options[:builder] = VerticalFormBuilder
      options[:class] = 'vertical-form'
    end
  end

  def inline_fields_for(*args, **kwargs, &block)
    kwargs[:builder] = InlineFormBuilder

    fields_for(*args, **kwargs, &block)
  end

  def text_field(method, **options)
    @template.content_tag :div, class: 'input-block' do
      label(method) + super + error_messages_on(method)
    end
  end

  def text_area(method, **options)
    @template.content_tag :div, class: 'input-block' do
      label(method) + super + error_messages_on(method)
    end
  end

  def number_field(method, **options)
    @template.content_tag :div, class: 'input-block' do
      label(method) + super + error_messages_on(method)
    end
  end

  def date_field(method, **options)
    @template.content_tag :div, class: 'input-block' do
      label(method) + super + error_messages_on(method)
    end
  end

  def submit(value, **options)
    extend_classes options, 'btn-primary'
    super
  end

  private

  def error_messages_on(method)
    messages = object.errors.messages_for method

    return '' if messages.empty?

    @template.content_tag :div, class: 'error-messages' do
      messages.map { @template.content_tag(:div, _1) }.join.html_safe
    end
  end

  def extend_classes(options, classes)
    options[:class] = [options[:class], classes].compact.join(' ')
  end
end
