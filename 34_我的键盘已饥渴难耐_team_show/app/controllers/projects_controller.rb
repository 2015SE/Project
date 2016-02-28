class ProjectsController < ApplicationController
  def new
    if session[:ut] != 'admin'
      redirect_to welcome_error_path
    end
  end

  def create
    redirect_to :projects

    @title = params[:project][:title]
    @text = params[:project][:text]
    # puts  @title, @text
    Project.insert(@title, @text)

  end

  def index
    @projects = Project.all.reverse_order
    @status = Status.find_by_sql("select * from statuses where 1=1 group by project_id order by created_at desc")

    @status_dict = {}
    @projects.each do |p|
      @status.each do |s|
        if p.id == s.project_id
          @status_dict[p.id] = s.status
        end
      end
    end
  end

  def show
    id = params[:id].to_i
    @project = Project.find_by_id(id)
    @members = Belong.find_by_project_id(id)
  end

  def modify
    if session[:ut] != 'admin'
      redirect_to welcome_error_path
    end

    @projects = Project.all
    # delete a project
    if params[:del]
      @del_id = params[:del]
      Project.delete(@del_id)
      Status.delete_by_project_id(@del_id)
    end
    # edit a project
    if params[:edt]
      @edt_id = params[:edt]
      # redirect_to
    end
  end

  # get project edit page
  def edt
    if session[:ut] != 'admin'
      redirect_to welcome_error_path
    end

    @edt_id = params[:edt]
    session[:edt_id] = @edt_id
    @project = Project.find(@edt_id)
    @status = Status.find_by_project_id(@edt_id.to_i)

    if params[:edt]
      session[:edt] = params[:edt]

      @members_added = Belong.find_by_project_id(params[:edt])
      @members_all = Member.all
      @map = {}

      # get map of whom are in group
      @members_all.each do |m|
        @members_added.each do |a|
          if m.name == a.name
            @map[m.id] = 'yes'
          end
        end
      end
      @projects_all = Project.all
      puts "#{@map}"
    end
  end

  def edt_handle
    # handle project edit post request
    if params[:projects_edt][:title]
      Project.update(session[:edt_id], :name => params[:projects_edt][:title],
                     :description => params[:projects_edt][:description])

      redirect_to projects_modify_path
    end
  end

  # get add_status page
  def add_status
    # request this page
    if params[:add]
      @add = params[:add]
      session[:add_id] = @add
    end
    # delete a status
    if params[:del_status_id]
      Status.delete(params[:del_status_id])
    end

    @status = Status.find_by_project_id(session[:add_id].to_i)
    @project_name = Project.find(session[:add_id]).name
    @projects_all = Project.all
  end

  # handle post status request.
  def add_status_handle

    Status.insert(session[:add_id], params[:status_add][:status])
    redirect_to projects_add_status_path + "?add=" +session[:add_id].to_s
  end

  # add members
  def add_members
    # get
    if params[:project_id]
      session[:project_id] = params[:project_id]

      @members_added = Belong.find_by_project_id(params[:project_id])
      @members_all = Member.all
      @map = {}

      # get map of whom are in group
      @members_all.each do |m|
         @members_added.each do |a|
           if m.name == a.name
             @map[m.id] = 'yes'
           end
         end
      end
      @projects_all = Project.all
      puts "#{@map}"
    end

    # post delete member
    if params[:del_member_id]
      Belong.delete_pair(params[:del_member_id], session[:project_id])
      redirect_to projects_add_members_path+'?project_id='+session[:project_id]
    end

    # post add member
    if params[:add_member_id]
      Belong.insert(params[:add_member_id], session[:project_id])
      redirect_to projects_add_members_path+'?project_id='+session[:project_id]
    end
  end

  # get user space
  def my_projects
    @member_id = Member.find_by_sql("select id from members where name = \'#{session[:un]}\'").first.id
    @my_projects = Project.find_by_member_id(@member_id)
    puts "#{@my_projects}"
  end

  def del
    @projects.all
  end

end
