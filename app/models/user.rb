class User < ApplicationRecord
    # has_many :schedules
    # attr_accessor :remember_token
    has_many :event

    # 永続セッションのためにユーザーをデータベースに記憶する
    def remember
        user_id = self.id.to_s
        update_attribute(:remember, user_id)
    end

    # 渡されたトークンがダイジェストと一致したらtrueを返す
    def authenticated?(token)
        
    end

    # ユーザーのログイン情報を破棄する
    def forget
        update_attribute(:remember, "")
    end

end
