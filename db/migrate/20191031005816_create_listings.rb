class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :title
      t.string :name
      t.text :description
      t.date :start_date
      t.date :end_date
      t.string :curator
      t.string :exhibit_patron
      t.text :photo_credit
      t.references :museum, foreign_key: true
      t.integer :price
      t.integer :status

      t.timestamps
    end
  end
end
