require "administrate/base_dashboard"

class CategoryDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    images: Field::HasMany,
    items: Field::HasMany,
    organization: Field::BelongsTo,
    primary_image: Field::BelongsTo.with_options(class_name: "Image"),
    id: Field::Number,
    primary_image_id: Field::Number,
    position: Field::Number,
    status: Field::String.with_options(searchable: false),
    name: Field::String,
    short_description: Field::String,
    long_description: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :images,
    :items,
    :organization,
    :primary_image,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :images,
    :items,
    :organization,
    :primary_image,
    :id,
    :primary_image_id,
    :position,
    :status,
    :name,
    :short_description,
    :long_description,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :images,
    :items,
    :organization,
    :primary_image,
    :primary_image_id,
    :position,
    :status,
    :name,
    :short_description,
    :long_description,
  ].freeze

  # Overwrite this method to customize how categories are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(category)
  #   "Category ##{category.id}"
  # end
end
