class Usergroup < ActiveRecord::Base
  has_many:users
  belongs_to:group
  has_many:nthfiles
end
