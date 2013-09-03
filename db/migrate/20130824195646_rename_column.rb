class RenameColumn < ActiveRecord::Migration
  def change
  	change_column :reading_articles, :read, :boolean, :default => false
  	change_column :reading_articles, :like, :boolean, :default => false
  end
end
