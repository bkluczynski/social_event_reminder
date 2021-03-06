class Event < ActiveRecord::Base

  validates :title, presence: true
  validates :date, presence: true
  belongs_to :user
  has_many :reminders, dependent: :destroy


end
