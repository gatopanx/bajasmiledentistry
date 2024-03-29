class CreateItemLeadMappings < ActiveRecord::Migration[5.2]
  def change
    create_table :item_lead_mappings do |t|
      t.references :owning_organization, foreign_key: { to_table: :organizations }
      t.references :item, foreign_key: true
      t.references :lead, foreign_key: true

      t.timestamps
    end
  end
end
