class CreateQapproves < ActiveRecord::Migration
  def change
    create_table :qapproves do |t|
      t.integer :question_id
      t.integer :user_id

      t.timestamps
    end
    add_index :qapproves, [:question_id, :created_at]
  end
end
