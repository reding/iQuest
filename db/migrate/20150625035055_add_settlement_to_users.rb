class AddSettlementToUsers < ActiveRecord::Migration
  def change
    add_column :users, :settlement, :stringstring
  end
end
