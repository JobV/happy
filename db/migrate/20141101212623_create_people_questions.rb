class CreatePeopleQuestions < ActiveRecord::Migration
  def change
    create_table :people_questions, id: false do |t|
      t.belongs_to :person, index: true
      t.belongs_to :question, index: true
    end
  end
end
