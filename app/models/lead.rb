class Lead < ApplicationRecord
  has_many :item_lead_mappings, dependent: :destroy

  belongs_to :organization
  belongs_to :person

  enum desired_time_range: {
    ANYTIME: 0,
    MORNING: 10,
    AFTERNOON: 20,
    EVENING: 30
  }
  enum preferred_conversation_channel: {
    PHONE: 0,
    EMAIL: 10
  }
  enum source: {
    WEBSITE: 0
  }
  enum status: {
    DRAFT: 0,
    SUBMITTED: 10,
    ACCEPTED: 20,
    REJECTED: 30,
    CANCELLED: 40
  }

  validates :desired_date, {
    date: {
      after: proc { Date.today }
    },
    on: :create
  }
  validates :desired_date, {
    date: true,
    on: :update
  }
  validates :desired_time_range, {
    presence: true
  }
  validates :message, {
    presence: true,
    length: {
      in: 1..2048
    }
  }
  validates :preferred_conversation_channel, {
    presence: true
  }
  validates :source, {
    presence: true
  }
  validates :status, {
    presence: true
  }
end
