class CreateAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :attachments do |t|
      t.references :attachable, polymorphic: true
      t.references :owning_organization, foreign_key: { to_table: :organizations }
      t.integer :position
      t.string :title
      t.text :description
      t.string :payload

      t.timestamps
    end
  end
end
