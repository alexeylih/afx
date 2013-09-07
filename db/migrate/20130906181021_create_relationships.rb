class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :obj_id
      t.integer :subj_id
      t.text :type

      t.timestamps
    end
  end
end
