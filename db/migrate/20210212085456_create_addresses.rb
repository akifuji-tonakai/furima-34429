class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :post_number, null: false
      t.integer :send_from_id, null: false
      t.string :village_name, null: false
      t.string :village_number, null: false
      t.string :building_detail
      t.string :tele_number, null: false
      t.references :order, null: false, foreign_key: true
      t.timestamps
    end
  end
end
