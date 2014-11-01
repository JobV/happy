class FixUserId < ActiveRecord::Migration
  def change
    change_table :questions do |t|
      t.rename :user, :user_id
    end
  end
end
