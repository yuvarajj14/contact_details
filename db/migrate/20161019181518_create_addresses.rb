class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.belongs_to :contact_detail, index: true, foreign_key: true	
      t.text :address_line, default: '', null: false
      t.boolean :primary_address, default: false, null: false

      t.timestamps
    end
  end
end
