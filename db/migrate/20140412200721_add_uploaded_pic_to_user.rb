class AddUploadedPicToUser < ActiveRecord::Migration
  def change
  	add_column :users, :uploaded_pic, :boolean
  end
end
