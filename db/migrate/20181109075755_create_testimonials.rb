class CreateTestimonials < ActiveRecord::Migration[5.2]
  def change
    create_table :testimonials do |t|
      t.references :after_image, foreign_key: { to_table: :images }
      t.references :before_image, foreign_key: { to_table: :images }
      t.references :owning_organization, foreign_key: { to_table: :organizations }
      t.references :person, foreign_key: true

      t.date :date
      t.text :text
      t.integer :rating
      t.integer :status
      t.integer :source
      t.string :url

      t.timestamps
    end
  end
end
