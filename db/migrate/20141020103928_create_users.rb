class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.text :image
      t.integer :wins
      t.integer :losses
      t.integer :draws
      t.string :email
      t.string :password_digest
      t.string :win_percentage

      t.timestamps
    end
  end
end
