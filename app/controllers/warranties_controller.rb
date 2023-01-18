class WarrantiesController < ApplicationController
  before_action :set_warranty, only: %i[ show edit update destroy ]

  # GET /warranties or /warranties.json
  def index
    @warranties = Warranty.all
  end

  # GET /warranties/1 or /warranties/1.json
  def show
    
  end

  def show_image
    @warranty = Warranty.find(params[:id])
    if @warranty.comprobante_garantia.attached?
      @comprobante_garantia = @warranty.comprobante_garantia
    else
      redirect_to @warranty, notice: "La garantía no tiene ningún comprobante adjunto."
    end
end

def destroy_image
  @archivo = ActiveStorage::Blob.find_signed(params[:id])
  id_warranty = params[:warranty]
  @archivo.purge 
  redirect_to warranty_path(id_warranty), notice: "Comprobante de garantía eliminado correctamente."
end


def add_reference
   
  @warranty = Warranty.find(params[:id])
  if params[:warranty][:comprobante_garantia]
    if ["image/jpeg", "image/png"].include?(params[:warranty][:comprobante_garantia].content_type)
      @warranty.comprobante_garantia.attach(params[:warranty][:comprobante_garantia])
      if @warranty.comprobante_garantia.attached?
        redirect_to @warranty, notice: "Comprobante de garantía subido correctamente."
      else
        redirect_to @warranty, alert: "No se pudo subir el comprobante de garantía."
      end
    else
      redirect_to @warranty, alert: "Solo se permiten archivos de tipo JPEG y PNG"
    end
  else
    redirect_to @warranty, alert: "No se ha seleccionado ningún archivo para subir."
  end
end


  # GET /warranties/new
  def new
    @warranty = Warranty.new
  end

  # GET /warranties/1/edit
  def edit
  end

  # POST /warranties or /warranties.json
  def create
    @warranty = Warranty.new(warranty_params)
    garantia = @warranty.guardar_garantia(current_user)

    respond_to do |format|
      if garantia
        format.html { redirect_to warranty_url(@warranty), notice: "Warranty was successfully created." }
        format.json { render :show, status: :created, location: @warranty }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @warranty.errors, status: :unprocessable_entity }
      end
    end
  end

  

  # PATCH/PUT /warranties/1 or /warranties/1.json
  def update
    respond_to do |format|
      if @warranty.update(warranty_params)
        format.html { redirect_to warranty_url(@warranty), notice: "Warranty was successfully updated." }
        format.json { render :show, status: :ok, location: @warranty }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @warranty.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /warranties/1 or /warranties/1.json
  def destroy
    @warranty.destroy

    respond_to do |format|
      format.html { redirect_to warranties_url, notice: "Warranty was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_warranty
      @warranty = Warranty.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def warranty_params
      params.require(:warranty).permit(:nombre, :no_identificacion, :fecha_adq, :estado, :periodo_dias, :dias_restantes, :user_id, :comprobante_garantia)
    end
end
