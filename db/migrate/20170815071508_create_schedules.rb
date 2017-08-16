class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.integer :user_id, null: false, default: 0, comment: 'ユーザーID'
      t.string :contents, null: false, default: "", comment: '内容'
      t.date :date, null: false, comment: '予定日'
      t.string :jenre, null: false, default: "", comment: 'ジャンル'

      t.timestamps
      t.index :user_id
    end
  end
end
