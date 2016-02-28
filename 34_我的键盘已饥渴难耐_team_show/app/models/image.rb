class Image < ActiveRecord::Base
  # insert image into database
  def Image.insert(article_id, path)
    @i = Image.new
    @i.article_id = article_id
    @i.image_path = path
    @i.save!
  end
end
