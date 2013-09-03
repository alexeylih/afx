class CreateReadingArticles < ActiveRecord::Migration
  def change
    create_table :reading_articles do |t|
      t.boolean :read
      t.boolean :like

      t.timestamps
    end
  end
end
