# TODO: Add uuid and key?
class Post < OrganizationRecord
  has_many :images, as: :imageable, dependent: :destroy

  belongs_to :author, class_name: 'Person'
  belongs_to :primary_image, class_name: 'Image', optional: true

  validates :author, {
    presence: true,
    inclusion: {
      in: Proc.new do |p|
        if p.author
          Person
            .where(
              owning_organization: p.owning_organization,
              primary_kind: :PRODUCER,
              id: p.author_id
            )
        else
          Person.none
        end
      end
    }
  }

  enum status: {
    DRAFT: 0,
    PUBLISHED: 10
  }

  validates :status, {
    presence: true
  }
  validates :title, {
    presence: true,
    length: {
      in: 1..255
    }
  }
  validates :content, {
    presence: true,
    length: {
      in: 1..2048
    }
  }
  validates :published_at, {
    presence: true,
    if: Proc.new{|p| p.status == 'PUBLISHED' }
  }
  validates :published_at, {
    absence: true,
    unless: Proc.new{|p| p.status == 'PUBLISHED' }
  }
end
