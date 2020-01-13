class VtypesController < ApplicationController
  before_action :set_vtype, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /vtypes
  # GET /vtypes.json
  def index
    @vtypes = Vtype.all
  end

  # GET /vtypes/1
  # GET /vtypes/1.json
  def show
  end

  # GET /vtypes/new
  def new
    @vtype = Vtype.new
  end

  # GET /vtypes/1/edit
  def edit
  end

  # POST /vtypes
  # POST /vtypes.json
  def create
    @vtype = Vtype.new(vtype_params)

    respond_to do |format|
      if @vtype.save
        format.html { redirect_to @vtype, notice: 'Vtype was successfully created.' }
        format.json { render :show, status: :created, location: @vtype }
      else
        format.html { render :new }
        format.json { render json: @vtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vtypes/1
  # PATCH/PUT /vtypes/1.json
  def update
    respond_to do |format|
      if @vtype.update(vtype_params)
        format.html { redirect_to @vtype, notice: 'Vtype was successfully updated.' }
        format.json { render :show, status: :ok, location: @vtype }
      else
        format.html { render :edit }
        format.json { render json: @vtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vtypes/1
  # DELETE /vtypes/1.json
  def destroy
    @vtype.destroy
    respond_to do |format|
      format.html { redirect_to vtypes_url, notice: 'Vtype was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vtype
      @vtype = Vtype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vtype_params
      params.require(:vtype).permit(:name, vendor_ids: [])
    end
end
