class Project < ActiveRecord::Base

  def Project.insert(title, text)
    @a = Project.new
    @a.name = title
    @a.description = text
    @a.save!
  end

  def Project.find_by_id(id)
    @a = Project.all
    @a.each do |r|
      if r.id == id
        return r
      end
    end
  end

  def Project.find_by_member_id(id)
    @ret = Project.find_by_sql("select projects.id,projects.name,projects.description from belongs,members,projects where projects.id = belongs.project_id and belongs.member_id = members.id and belongs.member_id = #{id}")
    return @ret
  end
end
