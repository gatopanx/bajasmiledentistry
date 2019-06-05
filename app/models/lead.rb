# TODO - Add status change timestamps
# TODO - Add status dependant validations
# TODO - Remove timezone from date validations
class Lead < OrganizationRecord
  has_many :item_lead_mappings, dependent: :destroy
  has_many :items, through: :item_lead_mappings

  enum preferred_time_range: {
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

  validates :email_address, {
    presence: true,
    email: true
  }
  validates :message, {
    length: {
      in: 0..2048
    },
    allow_nil: true
  }
  validates :person_name, {
    presence: true,
    length: {
      in: 1..255
    }
  }
  validates :phone_country_code, {
    presence: true
  }
  validates :phone_number, {
    presence: true,
    numericality: {
      only_integer: true
    },
    phone: {
      possible: true,
      types: [
        :personal_number,
        :fixed_or_mobile,
        :voip
      ],
      country_specifier: -> lead { lead.phone_country_code },
      extensions: false
    }
  }
  validates :preferred_date, {
    presence: true,
    date: {
      after: proc { 1.day.ago - 8.hours }
    },
    on: :create
  }
  validates :preferred_date, {
    presence: true,
    date: true,
    on: :update
  }
  validates :source, {
    presence: true
  }
  validates :status, {
    presence: true
  }
  validates :text, {
    allow_nil: true,
    length: {
      in: 1..2048
    }
  }
  validates :uuid, {
    uniqueness: {
      scope: %i[owning_organization_id]
    },
    presence: true,
  }

  before_validation(on: :create) do
    self.uuid ||= calculated_uuid
    self.status ||= 'DRAFT'
  end

  def calculated_uuid
    return unless self.owning_organization

    calculated_uuid = nil

    loop do
      calculated_uuid = SecureRandom.uuid

      break unless self.class.exists?(
        owning_organization: self.owning_organization,
        uuid: calculated_uuid
      )
    end

    calculated_uuid
  end

  def to_param
    self.uuid
  end
end
