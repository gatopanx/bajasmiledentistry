class Person < ApplicationRecord
  has_many :addresses, as: :addressable, dependent: :destroy
  has_many :authentications, dependent: :destroy
  has_many :emails, as: :emailable, dependent: :destroy
  has_many :images, as: :imageable, dependent: :destroy
  has_many :phones, as: :phoneable, dependent: :destroy

  belongs_to :organization
  belongs_to :primary_address, class_name: 'Address', optional: true
  belongs_to :primary_email, class_name: 'Email', optional: true
  belongs_to :primary_image, class_name: 'Image', optional: true
  belongs_to :primary_phone, class_name: 'Phone', optional: true

  enum primary_kind: {
    PRODUCER: 0,
    CONSUMER: 10
  }
  enum status: {
    ACTIVE: 0,
    INACTIVE: 10
  }

  validates :date_of_birth, {
    date: {
      after: proc { 128.years.ago }
    },
    allow_nil: true
  }
  validates :first_name, {
    presence: true,
    length: {
      in: 1..255
    }
  }
  validates :middle_name, {
    length: {
      in: 1..255
    },
    allow_nil: true
  }
  validates :last_name, {
    length: {
      in: 1..255
    },
    allow_nil: true
  }
  validates :primary_kind, {
    presence: true
  }
  validates :status, {
    presence: true
  }

  def calculated_full_name
    [
      first_name,
      middle_name,
      last_name
    ].compact.join(' ')
  end
end
