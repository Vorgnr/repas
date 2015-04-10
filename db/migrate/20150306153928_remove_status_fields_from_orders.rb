class RemoveStatusFieldsFromOrders < ActiveRecord::Migration
  def change
    remove_columns :orders, :is_payed, :is_delivered
  end
end
