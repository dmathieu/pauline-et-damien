class AddPhotoToPresents < ActiveRecord::Migration[5.0]
  def change
    add_column :presents, :photo, :string
  end
end
