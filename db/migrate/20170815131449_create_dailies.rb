class CreateDailies < ActiveRecord::Migration[5.0]
  def change
    create_table :dailies do |t|
      t.string :title, null: false, default: "", comment: 'タイトル'
      t.integer :user_id, null: false, default: 0, comment: 'ユーザーID'
      # t.integer :schedule_id, null: false, default: 0, comment: 'スケジュールID'
      t.string :comment, null: false, default: "", comment: '内容'
      t.string :image, null: false, default: "", comment: '画像'
      t.date :date, null: false, default: DateTime.now, comment: '日付'
      t.string :jenre, null: false, default: "", comment: 'ジャンル'


      t.timestamps
      t.index :user_id
      # t.index :schedule_id
    end
  end
end
