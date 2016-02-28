
class ArticlesController < ApplicationController
  protected
  def uploadfile(file)
    if !file.original_filename.empty?
      @filename = file.original_filename
      #设置目录路径，如果目录不存在，生成新目录
      FileUtils.mkdir("#{Rails.root}/app/assets/images") unless File.exist?("#{Rails.root}/app/assets/images")
      #写入文件
      ##wb 表示通过二进制方式写，可以保证文件不损坏
      File.open("#{Rails.root}/app/assets/images/#{@filename}", "wb") do |f|
        f.write(file.read)
      end
      return @filename
    end
  end
  public
# get
  def new
    if session[:ut] != 'admin'
      redirect_to welcome_error_path
    end
  end
# post
  def create
    redirect_to :articles

    @title = params[:article][:title]
    @text  = params[:article][:text]
    @admin_name = session[:un]


    Article.insert(@title, @text, @admin_name)

    if params[:article][:image]
      @id_just_gen = Article.find_by_title(@title)
      # put image into Image
      @image_file_name = uploadfile(params[:article][:image])
      # puts "----------------------"
      # puts @image_file_name
      # puts "----------------------"
      # put  @title, @text into Article
      Image.insert(@id_just_gen, @image_file_name)
    end
  end

  def index
    @articles = Article.all.reverse_order
  end

  def show
    id = params[:id].to_i
    # puts id
    if id == 1
      puts '11'
    end
    @article = Article.find_by_id(id)
    @image_path = Image.find_by_sql("select * from images where article_id = #{id}").first
    if @image_path
      @image_path = @image_path.image_path
    end
    puts @image_path
  end

  def modify
    if session[:ut] != 'admin'
      redirect_to welcome_error_path
    end

    @articles = Article.all
    # delete an article
    if params[:del]
      @del_id = params[:del]
      Article.delete(@del_id)
    end
    # edit an article
    if params[:edt]
      @edt_id = params[:edt]
      # redirect_to
    end
  end

  # get article edit page
  def edt
    if session[:ut] != 'admin'
      redirect_to welcome_error_path
    end

    @edt_id = params[:edt]
    session[:edt_id] = @edt_id
    @article = Article.find(@edt_id)

  end

  def edt_handle
    # handle article edit post request
    if params[:articles_edt][:title]
      Article.update(session[:edt_id], :title=>params[:articles_edt][:title],
      :content => params[:articles_edt][:text])

      redirect_to articles_modify_path
    end
  end
end
