class Event < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :attendances, dependent: :destroy

  validates :name, :location, :state, :date, presence: true
  # validates :date_cannot_be_today_and_in_the_past

  # def date_cannot_be_today_and_in_the_past
  #   if date.present? && date <= Date.today
  #     errors.add(:date, "can't be in the past")
  #   end
  # end
end
