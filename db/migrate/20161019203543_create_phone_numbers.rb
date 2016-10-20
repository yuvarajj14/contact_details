class CreatePhoneNumbers < ActiveRecord::Migration[5.0]
  def change
    create_table :phone_numbers do |t|
      t.belongs_to :contact_detail, index: true, foreign_key: true    
      t.string :mobile_number, null: false, default: "", limit: 13
      t.boolean :primary_number, default: false, null: false

      t.timestamps
    end
  end
end
