class NthfilesController < ApplicationController
  before_action :set_nthfile, only: [:show, :edit, :update, :destroy]

  # GET /nthfiles
  # GET /nthfiles.json
  def index
    @nthfiles = Nthfile.all
  end

  # GET /nthfiles/1
  # GET /nthfiles/1.json
  def show
  end

  # GET /nthfiles/new
  def new
    @nthfile = Nthfile.new
  end

  # GET /nthfiles/1/edit
  def edit
  end

  # POST /nthfiles
  # POST /nthfiles.json
  def create
    @nthfile = Nthfile.new(nthfile_params)

    respond_to do |format|
      if @nthfile.save
        format.html { redirect_to @nthfile, notice: 'Nthfile was successfully created.' }
        format.json { render :show, status: :created, location: @nthfile }
      else
        format.html { render :new }
        format.json { render json: @nthfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nthfiles/1
  # PATCH/PUT /nthfiles/1.json
  def update
    respond_to do |format|
      if @nthfile.update(nthfile_params)
        format.html { redirect_to @nthfile, notice: 'Nthfile was successfully updated.' }
        format.json { render :show, status: :ok, location: @nthfile }
      else
        format.html { render :edit }
        format.json { render json: @nthfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nthfiles/1
  # DELETE /nthfiles/1.json
  def destroy
    @nthfile.destroy
    respond_to do |format|
      format.html { redirect_to nthfiles_url, notice: 'Nthfile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nthfile
      @nthfile = Nthfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nthfile_params
      params.require(:nthfile).permit(:rename, :filesize, :count, :resize)
    end
end
