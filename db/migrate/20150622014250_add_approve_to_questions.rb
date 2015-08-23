class AddApproveToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :approve, :integer, default: 0
  end
end
