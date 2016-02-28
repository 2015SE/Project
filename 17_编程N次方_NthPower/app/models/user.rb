class User < ActiveRecord::Base
  has_many:user_files
  validates :username, presence: true, length: { maximum: 50 }
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: false
end
