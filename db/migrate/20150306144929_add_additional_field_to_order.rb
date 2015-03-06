class AddAdditionalFieldToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :additional, :string
  end
end
