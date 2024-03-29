class CreateItemTestimonialMappings < ActiveRecord::Migration[5.2]
  def change
    create_table :item_testimonial_mappings do |t|
      t.references :owning_organization, foreign_key: { to_table: :organizations }
      t.references :item, foreign_key: true
      t.references :testimonial, foreign_key: true

      t.timestamps
    end
  end
end
