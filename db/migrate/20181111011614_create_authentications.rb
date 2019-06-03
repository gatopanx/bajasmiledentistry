class CreateAuthentications < ActiveRecord::Migration[5.2]
  def change
    create_table :authentications do |t|
      t.references :owning_organization, foreign_key: { to_table: :organizations }
      t.references :person, foreign_key: true
      t.inet :ip
      t.string :token, index: true
      t.text :user_agent
      t.string :uuid, index: true

      t.timestamps
    end
  end
end
