class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.text :username
      t.text :avatar
      t.text :email
      t.text :password
      t.boolean :verified, :default => 0
      t.boolean :admin, :default => 0
      t.boolean :banned, :default => 0
      

      t.timestamps
    end
  end
end
