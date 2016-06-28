class AddUserTokensCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_tokens_count, :integer
  end
end
