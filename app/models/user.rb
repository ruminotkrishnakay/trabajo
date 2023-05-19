class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true, uniqueness: true,
    format: {
      with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
      message: :invalid
    }
    validates :password_digest, length: {minimum:6}

    before_save :downcase_attributes

    private

    def downcase_attributes
      self.email = email.downcase
    end
end
