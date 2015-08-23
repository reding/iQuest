class CreateAnswermsgs < ActiveRecord::Migration
  def change
    create_table :answermsgs do |t|
      t.integer :question_id
      t.integer :user_id
      t.integer :answer_user
      t.boolean :read

      t.timestamps
    end
    add_index :answermsgs, [:user_id, :created_at]
  end
end
