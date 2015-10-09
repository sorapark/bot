class CreateChatLogs < ActiveRecord::Migration
  def change
    create_table :chat_logs do |t|
      t.text :person
      t.text :bot

      t.timestamps null: false
    end
  end
end
