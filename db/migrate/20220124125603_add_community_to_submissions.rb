class AddCommunityToSubmissions < ActiveRecord::Migration[6.1]
  def change
    add_reference :submissions, :community, foreign_key: true
  end
end
