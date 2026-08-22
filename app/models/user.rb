class User < ApplicationRecord
  has_secure_password
  validates :name, presence: { message: "名前を入力してください" },
                    length: { maximum: 50, message: "名前は50文字以内で入力してください" }
  validates :email, presence: { message: "メールアドレスを入力してください" },
                     length: { maximum: 255, message: "メールアドレスは255文字以内で入力してください" },
                     format: { with: URI::MailTo::EMAIL_REGEXP, message: "メールアドレスの形式が正しくありません" },
                     uniqueness: { case_sensitive: false, message: "メールアドレスは既に使用されています" }
  validates :password, presence: { message: "パスワードを入力してください" },
                        length: { minimum: 6, message: "パスワードは6文字以上で入力してください" },
                        allow_nil: true
  validates :password_confirmation, presence: { message: "パスワード確認を入力してください" },
  allow_nil: true
end
# 유효성 검사
