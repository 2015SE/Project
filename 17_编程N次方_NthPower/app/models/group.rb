class Group < ActiveRecord::Base
  has_many:group_files
  belongs_to:user
end
