class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.datetime :date
      t.integer :room
      t.integer :user
      t.text :body

      t.timestamps
    end
  end
end
