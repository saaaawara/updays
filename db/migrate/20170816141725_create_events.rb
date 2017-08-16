class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.integer :user_id, null: false, default: 0, comment: 'ユーザーID'
      t.string :events, null: false, default: "", comment: 'イベント'

      t.timestamps
      t.index :user_id
    end
  end
end
