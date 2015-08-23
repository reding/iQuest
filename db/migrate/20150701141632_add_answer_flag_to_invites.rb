class AddAnswerFlagToInvites < ActiveRecord::Migration
  def change
    add_column :invites, :answer_flag, :boolean
  end
end
