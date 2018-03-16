class AddSupplierIDtoSupplier < ActiveRecord::Migration[5.1]
  def change
    add_column :suppliers, :supplier_id, :integer
  end
end
