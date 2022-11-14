class CreateDiseases < ActiveRecord::Migration[7.0]
  def change
    create_table :diseases do |t|
      t.string :name, null: false
      t.string :description
      t.index [:name], name: :unique_name, unique: true
      t.timestamps
    end
  end
end
