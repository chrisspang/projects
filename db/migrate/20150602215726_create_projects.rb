class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :title
      t.boolean :verified
      t.decimal :latitude
      t.decimal :longitude
      t.references :builder, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
