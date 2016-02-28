class Product < ActiveRecord::Base
  belongs_to :shop
  #belongs_to :shopkeeper, through: :shop
  #has_many :orders
  #has_one :user, through: :orders
  
  validates_presence_of :title, :description, :price, :quantity
  validates_numericality_of :price
  validates_uniqueness_of :title

  validates_format_of :image_url,
	:with => %r{\A(http|https):.+\.(gif|jpg|png)\z}i,
	:message => "must be a URL for a GIF, JPG, or PNG image"
  def validate
    errors.add(:price, "should be positive")unless price.nil? || price > 0.0
  end

end
