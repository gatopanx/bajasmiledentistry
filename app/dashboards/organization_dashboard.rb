require "administrate/base_dashboard"

class OrganizationDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    addressable_addresses: Field::HasMany.with_options(class_name: "Address"),
    addresses: Field::HasMany,
    attachable_attachments: Field::HasMany.with_options(class_name: "Attachment"),
    attachments: Field::HasMany,
    authentications: Field::HasMany,
    categories: Field::HasMany,
    emailable_emails: Field::HasMany.with_options(class_name: "Email"),
    emails: Field::HasMany,
    imageable_images: Field::HasMany.with_options(class_name: "Image"),
    images: Field::HasMany,
    items: Field::HasMany,
    item_lead_mappings: Field::HasMany,
    item_testimonial_mappings: Field::HasMany,
    leads: Field::HasMany,
    people: Field::HasMany,
    phoneable_phones: Field::HasMany.with_options(class_name: "Phone"),
    phones: Field::HasMany,
    social_proofs: Field::HasMany,
    testimonial: Field::HasMany,
    primary_address: Field::BelongsTo.with_options(class_name: "Address"),
    primary_email: Field::BelongsTo.with_options(class_name: "Email"),
    primary_image: Field::BelongsTo.with_options(class_name: "Image"),
    primary_phone: Field::BelongsTo.with_options(class_name: "Phone"),
    id: Field::Number,
    name: Field::String,
    subdomain: Field::String,
    status: Field::String.with_options(searchable: false),
    url: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    primary_address_id: Field::Number,
    primary_phone_id: Field::Number,
    primary_image_id: Field::Number,
    primary_email_id: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :addressable_addresses,
    :addresses,
    :attachable_attachments,
    :attachments,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :addressable_addresses,
    :addresses,
    :attachable_attachments,
    :attachments,
    :authentications,
    :categories,
    :emailable_emails,
    :emails,
    :imageable_images,
    :images,
    :items,
    :item_lead_mappings,
    :item_testimonial_mappings,
    :leads,
    :people,
    :phoneable_phones,
    :phones,
    :social_proofs,
    :testimonial,
    :primary_address,
    :primary_email,
    :primary_image,
    :primary_phone,
    :id,
    :name,
    :subdomain,
    :status,
    :url,
    :created_at,
    :updated_at,
    :primary_address_id,
    :primary_phone_id,
    :primary_image_id,
    :primary_email_id,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :addressable_addresses,
    :addresses,
    :attachable_attachments,
    :attachments,
    :authentications,
    :categories,
    :emailable_emails,
    :emails,
    :imageable_images,
    :images,
    :items,
    :item_lead_mappings,
    :item_testimonial_mappings,
    :leads,
    :people,
    :phoneable_phones,
    :phones,
    :social_proofs,
    :testimonial,
    :primary_address,
    :primary_email,
    :primary_image,
    :primary_phone,
    :name,
    :subdomain,
    :status,
    :url,
    :primary_address_id,
    :primary_phone_id,
    :primary_image_id,
    :primary_email_id,
  ].freeze

  # Overwrite this method to customize how organizations are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(organization)
  #   "Organization ##{organization.id}"
  # end
end
