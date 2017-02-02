class CreatePresents < ActiveRecord::Migration[5.0]
  def change
    create_table :presents do |t|
      t.string  :title
      t.string  :description
      t.integer :price_cent

      t.timestamps
    end
  end
end
