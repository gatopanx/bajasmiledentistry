require "administrate/base_dashboard"

class PersonDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    addresses: Field::HasMany,
    authentications: Field::HasMany,
    emails: Field::HasMany,
    images: Field::HasMany,
    phones: Field::HasMany,
    organization: Field::BelongsTo,
    primary_address: Field::BelongsTo.with_options(class_name: "Address"),
    primary_email: Field::BelongsTo.with_options(class_name: "Email"),
    primary_image: Field::BelongsTo.with_options(class_name: "Image"),
    primary_phone: Field::BelongsTo.with_options(class_name: "Phone"),
    id: Field::Number,
    primary_address_id: Field::Number,
    primary_email_id: Field::Number,
    primary_image_id: Field::Number,
    primary_phone_id: Field::Number,
    date_of_birth: Field::DateTime,
    name: Field::String,
    primary_kind: Field::String.with_options(searchable: false),
    status: Field::String.with_options(searchable: false),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :addresses,
    :authentications,
    :emails,
    :images,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :addresses,
    :authentications,
    :emails,
    :images,
    :phones,
    :organization,
    :primary_address,
    :primary_email,
    :primary_image,
    :primary_phone,
    :id,
    :primary_address_id,
    :primary_email_id,
    :primary_image_id,
    :primary_phone_id,
    :date_of_birth,
    :name,
    :primary_kind,
    :status,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :addresses,
    :authentications,
    :emails,
    :images,
    :phones,
    :organization,
    :primary_address,
    :primary_email,
    :primary_image,
    :primary_phone,
    :primary_address_id,
    :primary_email_id,
    :primary_image_id,
    :primary_phone_id,
    :date_of_birth,
    :name,
    :primary_kind,
    :status,
  ].freeze

  # Overwrite this method to customize how people are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(person)
  #   "Person ##{person.id}"
  # end
end
