class Email < OrganizationRecord
  belongs_to :emailable, polymorphic: true

  acts_as_list(scope: %i[owning_organization_id emailable_type emailable_id])

  validates :address, {
    presence: true,
    email: true
  }
  validates :address, {
    uniqueness: {
      scope: %i[owning_organization_id emailable_type emailable_id]
    },
    if: proc { |email| email.address && !(email.confirmed) }
  }
  validates :address, {
    uniqueness: {
      scope: %i[owning_organization_id emailable_type confirmed]
    },
    if: proc { |email| email.address && email.confirmed }
  }
  validates :confirmed, {
    inclusion: {
      in: [true, false]
    }
  }
end
