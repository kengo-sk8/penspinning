class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :text
      t.string :youtube_url
      t.string :video
      t.references :pen_type
      t.timestamps
    end
  end
end
