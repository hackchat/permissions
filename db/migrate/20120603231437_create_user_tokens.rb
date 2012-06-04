class CreateUserTokens < ActiveRecord::Migration
  def change
    create_table :user_tokens do |t|
      t.string :user_token
      t.timestamps
    end
  end
end
