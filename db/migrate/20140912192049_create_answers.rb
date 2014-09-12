class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :description
      t.belongs_to :user
      t.integer :question_id
      t.boolean :top_of_list

      t.timestamps
    end
  end
end
