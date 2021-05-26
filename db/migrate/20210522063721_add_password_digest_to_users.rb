class AddPasswordDigestToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :auth_token, :password_digest
  end
end
