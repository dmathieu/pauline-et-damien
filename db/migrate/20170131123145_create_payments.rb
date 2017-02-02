class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.string  :name
      t.integer :amount_cent
      t.integer :present_id

      t.timestamps
    end

    add_foreign_key :payments, :presents
  end
end
