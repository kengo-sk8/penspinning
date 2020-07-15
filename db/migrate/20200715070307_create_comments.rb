class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :product #null: false
      t.references :user    #null: false
      t.text :text          #null: false
      t.timestamps
    end
  end
end
