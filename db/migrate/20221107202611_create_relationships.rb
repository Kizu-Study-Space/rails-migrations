class CreateRelationships < ActiveRecord::Migration[7.0]
  def change
    create_table :relationships do |t|
      t.references :requesting_user, foreign_key: { to_table: :users }, null: false
      t.references :requested_user, foreign_key: { to_table: :users }, null: false
      t.string :status, null: false
      t.boolean :sexual, null: false
      t.string :description
      t.index [:requesting_user_id, :requested_user_id], name: :unique_relationship_id, unique: true
      t.timestamps
    end
  end
end
