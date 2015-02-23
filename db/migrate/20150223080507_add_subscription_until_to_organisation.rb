class AddSubscriptionUntilToOrganisation < ActiveRecord::Migration
  def change
    add_column :organisations, :subscription_until, :datetime
  end
end
