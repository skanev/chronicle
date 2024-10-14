class InlineFormBuilder < ActionView::Helpers::FormBuilder
  class << self
    def apply_to(options)
      options[:builder] = InlineFormBuilder
      options[:class] = 'contents'
    end
  end

  def collection_select(method, collection, value_method, text_method, select_options = {}, html_options = {})
    extend_classes html_options, "w-full rounded-lg shadow py-2 px-4"
    html_options[:class] << " border-red-500" if object.errors.key? method
    super
  end

  def number_field(method, **options)
    extend_classes options, "w-full rounded-lg shadow py-2 px-4"
    options[:class] << " border-red-500" if object.errors.key? method
    super
  end

  def submit(value, **options)
    extend_classes options, 'btn-primary'
    super
  end

  private

  def extend_classes(options, classes)
    options[:class] = [options[:class], classes].compact.join(' ')
  end
end
