class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :text
      t.string :youtube_url
      t.string :image
      t.references :pen_history
      t.references :category
      t.timestamps
    end
  end
end
