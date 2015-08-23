class AddReadToInvites < ActiveRecord::Migration
  def change
    add_column :invites, :read, :boolean, default: false
  end
end
