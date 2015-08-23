class AddUserIdToAnswers < ActiveRecord::Migration
  def change
    add_foreign_key :answers, :users, on_delete: :cascade
  end
end
