class CreateUserTokens < ActiveRecord::Migration
  def change
    create_table :user_tokens do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :token
      t.string :installation_identifier
      t.string :push_token
      t.boolean :locked
      t.string :form_factor
      t.string :os

      t.timestamps null: false
    end
    add_index :user_tokens, :installation_identifier
  end
end
