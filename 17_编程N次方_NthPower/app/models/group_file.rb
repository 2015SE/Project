class GroupFile < ActiveRecord::Base
  belongs_to:group
  belongs_to:nthfiles
  has_one:rights
end
