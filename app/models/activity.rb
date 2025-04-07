class Activity < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :schedule, presence: true
  validates :slug, uniqueness: true, allow_blank: true

  before_validation :set_slug, if: -> { slug.blank? }

  def to_param
    slug
  end

  private

  def set_slug
    base_slug = title.parameterize if title.present?
    unique_slug = base_slug
    counter = 0

    # Check if the slug already exists and generate a unique one if needed
    while Activity.where(slug: unique_slug).exists?
      counter += 1
      unique_slug = "#{base_slug}-#{counter}"
    end

    self.slug = unique_slug
  end
end
