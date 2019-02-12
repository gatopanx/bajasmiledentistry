require "administrate/base_dashboard"

class ItemDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    attachments: Field::HasMany,
    images: Field::HasMany,
    item_lead_mappings: Field::HasMany,
    item_testimonial_mappings: Field::HasMany,
    category: Field::BelongsTo,
    organization: Field::BelongsTo,
    primary_attachment: Field::BelongsTo.with_options(class_name: "Attachment"),
    primary_image: Field::BelongsTo.with_options(class_name: "Image"),
    id: Field::Number,
    primary_attachment_id: Field::Number,
    primary_image_id: Field::Number,
    external_price_in_cents: Field::Number,
    form: Field::String.with_options(searchable: false),
    internal_price_in_cents: Field::Number,
    key: Field::String,
    name: Field::String,
    long_description: Field::Text,
    position: Field::Number,
    primary_kind: Field::String.with_options(searchable: false),
    short_description: Field::String,
    status: Field::String.with_options(searchable: false),
    url: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :attachments,
    :images,
    :item_lead_mappings,
    :item_testimonial_mappings,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :attachments,
    :images,
    :item_lead_mappings,
    :item_testimonial_mappings,
    :category,
    :organization,
    :primary_attachment,
    :primary_image,
    :id,
    :primary_attachment_id,
    :primary_image_id,
    :external_price_in_cents,
    :form,
    :internal_price_in_cents,
    :key,
    :name,
    :long_description,
    :position,
    :primary_kind,
    :short_description,
    :status,
    :url,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :attachments,
    :images,
    :item_lead_mappings,
    :item_testimonial_mappings,
    :category,
    :organization,
    :primary_attachment,
    :primary_image,
    :primary_attachment_id,
    :primary_image_id,
    :external_price_in_cents,
    :form,
    :internal_price_in_cents,
    :key,
    :name,
    :long_description,
    :position,
    :primary_kind,
    :short_description,
    :status,
    :url,
  ].freeze

  # Overwrite this method to customize how items are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(item)
  #   "Item ##{item.id}"
  # end
end
