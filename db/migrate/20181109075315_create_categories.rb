class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.references :owning_organization, foreign_key: { to_table: :organizations }
      t.references :primary_image, foreign_key: { to_table: :images }
      t.string :key, index: true
      t.integer :position
      t.integer :status
      t.string :name
      t.string :short_description
      t.text :long_description

      t.timestamps
    end
  end
end
