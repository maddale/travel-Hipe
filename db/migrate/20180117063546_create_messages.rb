class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.text :body
      t.integer :respondent_id
      t.boolean :read, default: false
      t.timestamps
    end
    add_index :messages, [:sender_id, :respondent_id]
  end
end
