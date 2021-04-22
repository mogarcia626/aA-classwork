class FixUniqueness < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :username
    add_column :users, :username, :string, null: false, uniqueness: true
  end
end
