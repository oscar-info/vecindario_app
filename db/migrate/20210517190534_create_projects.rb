class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name_project
      t.string :type_project
      t.string :city
      t.string :address
      t.integer :price
      t.integer :area
      t.boolean :subsidy
      t.integer :restroom
      t.boolean :parking
      t.text :list_emails
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
