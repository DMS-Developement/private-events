class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  has_many :participations, dependent: :destroy
  has_many :attendees, through: :participations, source: :user

  def self.past_events
    where('event_time < ?', Time.now)
  end

  def self.upcoming_events
    where('event_time > ?', Time.now)
  end
end
