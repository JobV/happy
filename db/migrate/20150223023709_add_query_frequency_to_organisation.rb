class AddQueryFrequencyToOrganisation < ActiveRecord::Migration
  def change
    add_column :organisations, :query_frequency, :integer, default: 0
  end
end
