class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.text :displayname
      t.text :email
      t.text :password
      t.boolean :verified
      t.boolean :admin
      t.boolean :banned

      t.timestamps
    end
  end
end
