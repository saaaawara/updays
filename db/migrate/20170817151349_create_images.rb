class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :image, null: false, default: "", comment: '画像'
      t.string :jenre, null: false, default: "", comment: 'ジャンル'

      t.timestamps
    end
  end
end
