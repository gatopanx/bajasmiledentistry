class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.references :owning_organization, foreign_key: { to_table: :organizations }
      t.string :email_address
      t.text :message
      t.string :person_name
      t.string :phone_country_code
      t.string :phone_number
      t.integer :preferred_conversation_channel
      t.date :preferred_date
      t.integer :preferred_time_range
      t.integer :source
      t.integer :status
      t.uuid :uuid

      t.timestamps
    end
  end
end
