class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
        t.string :name, null: false, default: "", comment: '名前'
        t.string :password, null: false, default: "", comment: 'パスワード'
				t.string :email, null: false, default: "", comment: 'メールアドレス'
				t.string :prefecture, null: false, default: "", comment: '県名'
        t.string :city, null: false, default: "", comment: '市，町'
        t.string :remember, null: false, default: "", comment: 'remember'


      t.timestamps
    end
  end
end
