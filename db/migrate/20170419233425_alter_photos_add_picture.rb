class AlterPhotosAddPicture < ActiveRecord::Migration
  def change
    remove_column :photos, :pictures
    add_column :photos, :picture, :string
  end
end
