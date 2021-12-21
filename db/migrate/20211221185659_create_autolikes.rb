class CreateAutolikes < ActiveRecord::Migration[5.2]
  def change
    create_table :autolikes do |t|
      t.integer :autolike_follower_id
      t.integer :autolike_following_id

      t.timestamps
    end

    add_foreign_key :autolikes, :users, column: :autolike_follower_id
    add_foreign_key :autolikes, :users, column: :autolike_following_id
  end
end
