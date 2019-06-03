class Attachment < OrganizationRecord
  belongs_to :attachable, polymorphic: true

  acts_as_list(scope: %i[owning_organization_id attachable_type attachable_id])

  mount_base64_uploader :payload, AttachmentPayloadUploader

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
