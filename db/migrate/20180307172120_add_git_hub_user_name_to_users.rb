class AddGitHubUserNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :github_username, :string
    add_column :users, :github_avatar_url, :string
  end
end
