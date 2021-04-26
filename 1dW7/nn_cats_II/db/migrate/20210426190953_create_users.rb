class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, null: false, uniqueness: true
      t.string :password_digest, length: {minimum: 6, nil: true}
      t.string :session_token, uniqueness: true, null: false
      t.timestamps
    end
    add_index :users, :session
  end
end
