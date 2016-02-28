class Article < ActiveRecord::Base

  def Article.images_path
    @a = "/assets/images/"
    return @a
  end
  def Article.insert(title, text, admin_name)
    @a = Article.new
    @a.title = title
    @a.content = text
    @a.admin_id = admin_name
    @a.save!
  end
  def Article.find_by_id(id)
    @a = Article.all
    @a.each do |r|
      if r.id == id
        return r
      end
    end
  end
  def Article.delete_by_id(id)
  end

  def Article.find_by_title(title)
    @a = Article.find_by_sql("select id from articles where title = '#{title}'").first.id
    return @a
  end
end
