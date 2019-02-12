require "administrate/base_dashboard"

class LeadDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    item_lead_mappings: Field::HasMany,
    organization: Field::BelongsTo,
    person: Field::BelongsTo,
    id: Field::Number,
    status: Field::String.with_options(searchable: false),
    message: Field::Text,
    desired_date: Field::DateTime,
    desired_time_range: Field::String.with_options(searchable: false),
    preferred_conversation_channel: Field::String.with_options(searchable: false),
    source: Field::String.with_options(searchable: false),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :item_lead_mappings,
    :organization,
    :person,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :item_lead_mappings,
    :organization,
    :person,
    :id,
    :status,
    :message,
    :desired_date,
    :desired_time_range,
    :preferred_conversation_channel,
    :source,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :item_lead_mappings,
    :organization,
    :person,
    :status,
    :message,
    :desired_date,
    :desired_time_range,
    :preferred_conversation_channel,
    :source,
  ].freeze

  # Overwrite this method to customize how leads are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(lead)
  #   "Lead ##{lead.id}"
  # end
end
