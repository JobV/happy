class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.text :body
      t.string :email

      t.timestamps
    end
  end
end
