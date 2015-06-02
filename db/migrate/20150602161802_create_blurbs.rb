class CreateBlurbs < ActiveRecord::Migration
  def change
    create_table :blurbs do |t|
      t.references :datasource, index: true, foreign_key: true
      t.text :description

      t.timestamps null: false
    end
  end
end
