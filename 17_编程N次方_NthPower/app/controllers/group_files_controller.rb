class GroupFilesController < ApplicationController
  before_action :set_group_file, only: [:show, :edit, :update, :destroy]

  # GET /group_files
  # GET /group_files.json
  def index
    @group_files = GroupFile.all
  end

  # GET /group_files/1
  # GET /group_files/1.json
  def show
  end

  # GET /group_files/new
  def new
    @group_file = GroupFile.new
  end

  # GET /group_files/1/edit
  def edit
  end

  # POST /group_files
  # POST /group_files.json
  def create
    @group_file = GroupFile.new(group_file_params)

    respond_to do |format|
      if @group_file.save
        format.html { redirect_to @group_file, notice: 'Group file was successfully created.' }
        format.json { render :show, status: :created, location: @group_file }
      else
        format.html { render :new }
        format.json { render json: @group_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_files/1
  # PATCH/PUT /group_files/1.json
  def update
    respond_to do |format|
      if @group_file.update(group_file_params)
        format.html { redirect_to @group_file, notice: 'Group file was successfully updated.' }
        format.json { render :show, status: :ok, location: @group_file }
      else
        format.html { render :edit }
        format.json { render json: @group_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_files/1
  # DELETE /group_files/1.json
  def destroy
    @group_file.destroy
    respond_to do |format|
      format.html { redirect_to group_files_url, notice: 'Group file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_file
      @group_file = GroupFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_file_params
      params.require(:group_file).permit(:group_id, :file_id, :filename, :resize)
    end
end
