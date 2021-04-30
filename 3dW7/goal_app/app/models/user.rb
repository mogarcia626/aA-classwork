# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    validates :session_token, presence: true, uniqueness: true
    validates :password, length: {minimum: 6, allow_nil: true}
    validates :password_digest, presence: true
    after_initialize :ensure_session_token

    attr_reader :password
    #SSPIRE

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        return nil unless user
        return nil unless user.is_password?(password)
        user
    end

    def self.generate_session_token   
        SecureRandom.urlsafe_base64(16)
    end

    def password=(password)
        @password = password
        self.password_digest = Bcrypt::Password.create(password)
    end

    def is_password?(password)
        Bcrypt::Password.new(self.password_digest).is_password?(password)
    end

    private
    def reset_session_token!
        self.session_token = User.generate_session_token
    end

    def ensure_session_token  
        self.session_token ||= User.generate_session_token
    end
end
