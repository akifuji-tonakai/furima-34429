class CreateChats < ActiveRecord::Migration[6.0]
  def change
    create_table :chats do |t|
      t.text         :content, null: false
      t.references   :room, null: false
      t.references   :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
