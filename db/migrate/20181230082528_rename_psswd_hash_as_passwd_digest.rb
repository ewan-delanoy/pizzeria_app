class RenamePsswdHashAsPasswdDigest < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.rename :password_hash, :password_digest
    end
    change_table :admins do |t|
      t.rename :password_hash, :password_digest
    end
  end
end
