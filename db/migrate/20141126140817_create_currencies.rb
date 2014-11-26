class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.string :title
      t.string :country
      t.text :description
      t.string :recipe_link
      t.string :music_link
      t.datetime :added_date

      t.timestamps
    end
  end
end
