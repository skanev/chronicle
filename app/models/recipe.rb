class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ingredients, -> { order(:id) }

  validates :name, presence: true

  accepts_nested_attributes_for :ingredients, allow_destroy: true

  def source_domain
    source_url ? URI.parse(source_url)&.host&.gsub(/^www\./, '') : nil
  rescue URI::InvalidURIError
    nil
  end
end
