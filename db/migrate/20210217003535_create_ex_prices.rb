class CreateExPrices < ActiveRecord::Migration[6.0]
  def change
    create_table :ex_prices do |t|
      t.string :etcprice, null: false
      t.references :item, null: false
      t.references :room, null: false, foreign_key: true
      t.timestamps
    end
  end
end
