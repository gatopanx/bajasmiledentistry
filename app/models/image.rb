class Image < OrganizationRecord
  belongs_to :imageable, polymorphic: true

  acts_as_list(scope: %i[owning_organization_id imageable_type imageable_id])

  mount_base64_uploader :payload, ImagePayloadUploader

  validates :description, {
    length: {
      in: 0..512
    },
    allow_nil: true
  }
  validates :payload, {
    presence: true
  }
  validates :title, {
    presence: true,
    length: {
      in: 2..255
    }
  }
end
