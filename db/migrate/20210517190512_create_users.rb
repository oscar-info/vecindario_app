class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.integer :phone
      t.string :email
      t.string :auth_token

      t.timestamps
    end
  end
end
