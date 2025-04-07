class Event < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true

  # Return only future events, ordered by date
  scope :upcoming, -> { where("date >= ?", Date.today).order(:date) }

  # Return past events, ordered by date descending
  scope :past, -> { where("date < ?", Date.today).order(date: :desc) }
end
