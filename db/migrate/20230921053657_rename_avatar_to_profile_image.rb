class RenameAvatarToProfileImage < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :avatar, :profile_image
  end
end
