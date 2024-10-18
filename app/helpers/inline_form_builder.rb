class InlineFormBuilder < ActionView::Helpers::FormBuilder
  class << self
    def apply_to(options)
      options[:builder] = InlineFormBuilder
      options[:class] = 'contents inline-form'
    end
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
