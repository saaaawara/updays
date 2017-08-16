class Daily < ApplicationRecord
    mount_uploader :image, ImageUploader

    # add relation
    belongs_to :user
    # belongs_to :schedule

    # comment
    # 空白文字を許す 140文字までに制限
    validates(:comment, length: {maximum: 140})
end
