class AddBodyFieldsToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :raw_body, :text, default: ''
    add_column :messages, :raw_html, :text, default: ''
    add_column :messages, :raw_text, :text, default: ''
    add_column :responses, :raw_body, :text, default: ''
    add_column :responses, :raw_html, :text, default: ''
    add_column :responses, :raw_text, :text, default: ''
  end
end
