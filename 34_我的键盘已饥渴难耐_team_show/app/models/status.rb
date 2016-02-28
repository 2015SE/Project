class Status < ActiveRecord::Base

  def Status.insert(project_id, status)
    @r = Status.new
    @r.project_id = project_id
    @r.status = status
    @r.save!
  end

  def Status.find_by_project_id(id)
    @r = Status.all
    @y = []
    @r.each do |r|
      if r.project_id==id
        @y.append(r)
      end
    end
    return @y
  end

  def Status.delete_by_project_id(id)
    Status.delete_all("project_id = "+id.to_s)
  end
end
