class CreateBots < ActiveRecord::Migration
  def change
    create_table :bots do |t|
      t.text :question
      t.text :answer


      t.timestamps null: false
    end
  end
end
