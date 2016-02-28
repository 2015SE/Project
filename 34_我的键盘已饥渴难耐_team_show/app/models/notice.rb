class Notice < ActiveRecord::Base
  def Notice.insert(title, text, admin_name)
    @a = Notice.new
    @a.title = title
    @a.content = text
    @a.admin_id = admin_name
    @a.save!
  end
  def Notice.find_by_id(id)
    @a = Notice.all
    @a.each do |r|
      if r.id == id
        return r
      end
    end
  end
end
