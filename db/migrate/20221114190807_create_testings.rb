class CreateTestings < ActiveRecord::Migration[7.0]
  def change
    create_table :testings do |t|
      t.references :disease
      t.references :user, null: false
      t.string :notes
      t.string :status, null: false
      t.string :result
      t.timestamps
    end
  end
end
