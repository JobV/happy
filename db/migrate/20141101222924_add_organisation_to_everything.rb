class AddOrganisationToEverything < ActiveRecord::Migration
  def change
    add_column :responses, :organisation_id, :integer
    add_column :users, :organisation_id, :integer
    add_column :people, :organisation_id, :integer
    add_column :messages, :organisation_id, :integer
  end
end
