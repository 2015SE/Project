class Belong < ActiveRecord::Base

  def Belong.find_by_project_id(id)
    @ret = Member.find_by_sql("select members.name from belongs,members,projects where projects.id = belongs.project_id and belongs.member_id = members.id and belongs.project_id = #{id}")
    return @ret
  end

  def Belong.insert(m_id, p_id)
    @b = Belong.new
    @b.member_id=m_id
    @b.project_id=p_id
    @b.save!
  end

  def Belong.delete_pair(m_id, p_id)
    Belong.delete_all("member_id = #{m_id} and project_id = #{p_id}")
  end

end
