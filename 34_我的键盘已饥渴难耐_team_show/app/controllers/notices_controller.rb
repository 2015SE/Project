class NoticesController < ApplicationController
  def new
    if session[:ut] != 'admin'
      redirect_to welcome_error_path
    end
  end
  def create
    redirect_to :notices

    @title = params[:notice][:title]
    @text  = params[:notice][:text]
    @admin_name = session[:un]
    # puts  @title, @text
    Notice.insert(@title, @text, @admin_name)
  end

  def index
    @notices = Notice.all.reverse_order
  end

  def show
    id = params[:id].to_i
    # puts id
    if id == 1
      puts '11'
    end
    @notice = Notice.find_by_id(id)
  end

  def modify
    if session[:ut] != 'admin'
      redirect_to welcome_error_path
    end

    @notices = Notice.all
    # delete a notice
    if params[:del]
      @del_id = params[:del]
      Notice.delete(@del_id)
    end
    # edit a notice
    if params[:edt]
      @edt_id = params[:edt]
      # redirect_to
    end
  end

  # get notice edit page
  def edt
    if session[:ut] != 'admin'
      redirect_to welcome_error_path
    end

    @edt_id = params[:edt]
    session[:edt_id] = @edt_id
    @notice = Notice.find(@edt_id)

  end

  def edt_handle
    # handle notice edit post request
    if params[:notices_edt][:title]
      Notice.update(session[:edt_id], :title=>params[:notices_edt][:title],
                     :content => params[:notices_edt][:text])

      redirect_to notices_modify_path
    end
  end
  def del
    @notices = Notice.all
  end
end
