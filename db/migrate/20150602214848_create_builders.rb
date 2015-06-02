class CreateBuilders < ActiveRecord::Migration
  def change
    create_table :builders do |t|
      t.string :name
      t.string :title

      t.timestamps null: false
    end
  end
end
