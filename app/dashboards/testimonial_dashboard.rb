require "administrate/base_dashboard"

class TestimonialDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    images: Field::HasMany,
    item_testimonial_mappings: Field::HasMany,
    after_image: Field::BelongsTo.with_options(class_name: "Image"),
    before_image: Field::BelongsTo.with_options(class_name: "Image"),
    organization: Field::BelongsTo,
    person: Field::BelongsTo,
    id: Field::Number,
    after_image_id: Field::Number,
    before_image_id: Field::Number,
    date: Field::DateTime,
    long_text: Field::Text,
    rating: Field::Number,
    short_text: Field::String,
    status: Field::String.with_options(searchable: false),
    source: Field::String.with_options(searchable: false),
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
    :images,
    :item_testimonial_mappings,
    :after_image,
    :before_image,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :images,
    :item_testimonial_mappings,
    :after_image,
    :before_image,
    :organization,
    :person,
    :id,
    :after_image_id,
    :before_image_id,
    :date,
    :long_text,
    :rating,
    :short_text,
    :status,
    :source,
    :url,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :images,
    :item_testimonial_mappings,
    :after_image,
    :before_image,
    :organization,
    :person,
    :after_image_id,
    :before_image_id,
    :date,
    :long_text,
    :rating,
    :short_text,
    :status,
    :source,
    :url,
  ].freeze

  # Overwrite this method to customize how testimonials are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(testimonial)
  #   "Testimonial ##{testimonial.id}"
  # end
end
