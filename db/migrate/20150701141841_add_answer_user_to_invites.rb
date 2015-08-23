class AddAnswerUserToInvites < ActiveRecord::Migration
  def change
    add_column :invites, :answer_user, :integer
  end
end
