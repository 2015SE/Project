class Nthfile < ActiveRecord::Base
  has_many:user_files
  has_many:group_files
end
