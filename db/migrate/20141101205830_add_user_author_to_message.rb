class AddUserAuthorToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :user_author, :boolean, default: :false
  end
end
