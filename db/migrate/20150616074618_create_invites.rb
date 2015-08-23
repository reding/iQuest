class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.integer :invite_id
      t.integer :invited_id
      t.integer :question_id

      t.timestamps
    end
    add_index :invites, [:invited_id, :created_at]
  end
end
