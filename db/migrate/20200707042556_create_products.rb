class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :text
      t.string :youtube_url
      t.string :video
      t.timestamps
    end
  end
end
