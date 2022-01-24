class AddCommunityToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :community, foreign_key: true
  end
end
