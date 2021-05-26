class CreateLeads < ActiveRecord::Migration[6.1]
  def change
    create_table :leads do |t|
      t.string :name
      t.string :last_name
      t.string :email
      t.integer :phone
      t.date :creation_date
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
