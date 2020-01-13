class CtypesController < ApplicationController
  before_action :set_ctype, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /ctypes
  # GET /ctypes.json
  def index
    @ctypes = Ctype.all
  end

  # GET /ctypes/1
  # GET /ctypes/1.json
  def show
  end

  # GET /ctypes/new
  def new
    @ctype = Ctype.new
  end

  # GET /ctypes/1/edit
  def edit
  end

  # POST /ctypes
  # POST /ctypes.json
  def create
    @ctype = Ctype.new(ctype_params)

    respond_to do |format|
      if @ctype.save
        format.html { redirect_to @ctype, notice: 'Ctype was successfully created.' }
        format.json { render :show, status: :created, location: @ctype }
      else
        format.html { render :new }
        format.json { render json: @ctype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ctypes/1
  # PATCH/PUT /ctypes/1.json
  def update
    respond_to do |format|
      if @ctype.update(ctype_params)
        format.html { redirect_to @ctype, notice: 'Ctype was successfully updated.' }
        format.json { render :show, status: :ok, location: @ctype }
      else
        format.html { render :edit }
        format.json { render json: @ctype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ctypes/1
  # DELETE /ctypes/1.json
  def destroy
    @ctype.destroy
    respond_to do |format|
      format.html { redirect_to ctypes_url, notice: 'Ctype was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ctype
      @ctype = Ctype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ctype_params
      params.require(:ctype).permit(:name, customer_ids: [])
    end
end
