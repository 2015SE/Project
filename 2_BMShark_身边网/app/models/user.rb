class User < ActiveRecord::Base
has_many :products, through: :shop
before_save { self.email = email.downcase }
before_create :create_remember_token

validates :name, presence: true,length:{maximum:15},uniqueness: true
validates :telephone, presence: true,format:{with:/[0-9]*/}
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email,  format: { with: VALID_EMAIL_REGEX }

before_save { self.email = email.downcase }#转化为小写

has_secure_password
validates :password, length: { minimum: 6 }


def User.new_remember_token
	SecureRandom.urlsafe_base64
end
def User.encrypt(token)
	Digest::SHA1.hexdigest(token.to_s)
end

private
	def create_remember_token
		self.remember_token = User.encrypt(User.new_remember_token)
	end
end
