class Shop < ActiveRecord::Base
  has_many :products
  #belongs_to :shopkeeper
end
