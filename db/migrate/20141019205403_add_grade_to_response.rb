class AddGradeToResponse < ActiveRecord::Migration
  def change
    add_column :responses, :grade, :integer, default: 0
  end
end
