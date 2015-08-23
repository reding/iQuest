class AddDisapproveToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :disapprove, :integer, default:0
  end
end
