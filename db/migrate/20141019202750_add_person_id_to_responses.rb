class AddPersonIdToResponses < ActiveRecord::Migration
  def change
    add_column :responses, :person_id, :integer
  end
end
