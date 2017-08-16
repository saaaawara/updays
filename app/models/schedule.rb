class Schedule < ApplicationRecord

    # add relation
    belongs_to :user

    # contents
    # 空白文字を許す 50文字までに制限
    validates(:contents, length: {maximum: 50})
end
