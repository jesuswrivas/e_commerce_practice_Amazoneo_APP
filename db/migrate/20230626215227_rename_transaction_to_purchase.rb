class RenameTransactionToPurchase < ActiveRecord::Migration[7.0]
  def change
    rename_table :transactions, :purchases
  end
end
