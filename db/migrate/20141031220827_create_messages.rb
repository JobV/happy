class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :body
      t.integer :person_id
      t.integer :user_id
      t.integer :response_id

      t.timestamps null: false
    end
  end
end
