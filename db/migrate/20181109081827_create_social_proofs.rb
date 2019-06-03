class CreateSocialProofs < ActiveRecord::Migration[5.2]
  def change
    create_table :social_proofs do |t|
      t.references :owning_organization, foreign_key: { to_table: :organizations }
      t.references :primary_image, foreign_key: { to_table: :images }
      t.integer :position
      t.string :title
      t.text :description
      t.string :url

      t.timestamps
    end
  end
end
