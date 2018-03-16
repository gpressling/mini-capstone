class CreateSuppliers < ActiveRecord::Migration[5.1]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.integer :supplier_id

      t.timestamps
    end
  end
end
