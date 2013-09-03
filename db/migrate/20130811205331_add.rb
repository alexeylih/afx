class Add < ActiveRecord::Migration
  def change
  	add_column :subitems, :subdata_id, :integer
  end
end
