class CreateSubs < ActiveRecord::Migration[5.2]
  def change
    create_table :subs do |t|
      t.string :title, null: false, index: {unique: true}
      t.string :description, null: false
      t.integer :moderator_id, null: false, index: true
      t.timestamps
    end
  end
end
