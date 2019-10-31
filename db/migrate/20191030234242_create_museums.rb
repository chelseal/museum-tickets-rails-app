class CreateMuseums < ActiveRecord::Migration[5.2]
  def change
    create_table :museums do |t|
      t.string :name
      t.text :description
      t.time :opening_time
      t.time :closing_time
      t.boolean :wheelchair_accessible
      t.string :street
      t.string :city
      t.string :country
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
