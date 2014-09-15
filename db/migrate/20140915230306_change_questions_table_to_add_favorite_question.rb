class ChangeQuestionsTableToAddFavoriteQuestion < ActiveRecord::Migration
  def change
    remove_column :answers, :top_of_list
    add_column :questions, :favorite_answer_id, :integer
  end
end
