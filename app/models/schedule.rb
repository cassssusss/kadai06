class Schedule < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date
  validates :memo, length: { maximum: 500 }

  private

end
