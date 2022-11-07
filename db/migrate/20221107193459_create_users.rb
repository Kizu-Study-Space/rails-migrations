class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :invitation_code
      t.string :password_digest, null: false
      t.string :email, null: false
      t.string :email_confirmation_token
      t.string :password_reset_token
      t.index [:email], name: :unique_email, unique: true
      t.index [:invitation_code], name: :unique_invitation_code, unique: true
      t.timestamps
    end
  end
end
