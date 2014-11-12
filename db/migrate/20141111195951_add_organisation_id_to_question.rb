class AddOrganisationIdToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :organisation_id, :integer
  end
end
