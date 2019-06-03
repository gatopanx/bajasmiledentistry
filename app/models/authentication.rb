class Authentication < OrganizationRecord
  belongs_to :person

  validates :token, {
    presence: true,
    uniqueness: {
      scope: %i[owning_organization_id]
    },
  }
  validates :secret, {
    presence: true
  }
  validates :ip, {
    presence: true
  }
  validates :user_agent, {
    presence: true,
    length: {
      in: 1..512
    }
  }
  validates :uuid, {
    uniqueness: {
      scope: %i[owning_organization_id]
    },
    presence: true,
  }

  before_validation do
    self.uuid ||= calculated_uuid
    self.token ||= calculated_token
  end

  private

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

  def calculated_token
    return unless self.owning_organization

    calculated_token = nil

    loop do
      calculated_token = SecureRandom.uuid

      break unless self.class.exists?(
        owning_organization: self.owning_organization,
        token: calculated_token
      )
    end

    calculated_token
  end
end
