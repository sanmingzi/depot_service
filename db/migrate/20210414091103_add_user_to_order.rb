class AddUserToOrder < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :user, index: true
  end
end
