class User < ApplicationRecord
    # 長さの強制をしてくれる
  before_save { email.downcase! }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
  format: { with: VALID_EMAIL_REGEX },
#   メールアドレスが小文字で統一されれば、大文字小文字を区別するマッチが問題なく動作できるからuniqueness: true
  uniqueness: true
  
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
