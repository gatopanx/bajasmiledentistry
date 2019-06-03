class OrganizationRecord < ApplicationRecord
  self.abstract_class = true

  belongs_to :owning_organization, class_name: 'Organization'

  before_validation do
    self.owning_organization ||= RequestStore.store[:current_organization]
  end
end
