class ChangeTypeOfPhoneLeads < ActiveRecord::Migration[6.1]
  def change
    change_column :leads, :phone, :string
  end
end
