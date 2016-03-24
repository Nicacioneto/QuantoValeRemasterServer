class AddIdFacebookToUser < ActiveRecord::Migration
  def change
    add_column :users, :idFacebook, :string
  end
end
