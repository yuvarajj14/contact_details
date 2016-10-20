class CreateContactDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :contact_details do |t|
      t.string :name, null: false, default: "", limit: 120
      t.string :email, default: ""

      t.timestamps
    end
  end
end
