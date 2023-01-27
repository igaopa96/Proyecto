class MovementsController < ApplicationController
  before_action :set_movement, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
 

  # GET /movements or /movements.json
  def index
    if current_user.nil?
      redirect_to new_user_session_path and return
    end
    if current_user.tipo_usuario == 1
      @movements = Movement.all
    else
      @movements = current_user.movements
    end
  end

  # GET /movements/1 or /movements/1.json
  def show
  end

  # GET /movements/new
  def new
    @movement = Movement.new
    @conceptos = Concept.conceptos_familiares(current_user.family_id) 
    @cuenta = Account.cuentas_personales(current_user.id)
    @goals = Goal.metas_familiares(current_user.family_id)

  end

  # GET /movements/1/edit
  def edit
    @conceptos = Concept.conceptos_familiares(current_user.family_id) 
    @cuenta = Account.cuentas_personales(current_user.id)
    @goals = Goal.metas_familiares(current_user.family_id)
  end

  # POST /movements or /movements.json
  def create
    @movement = Movement.new(movement_params)
    movimiento = @movement.guardad_movimientos(current_user)
    
    respond_to do |format|
      if movimiento
        NotificationMailer.notification_movement(current_user, @movement).deliver_later
        format.html { redirect_to movement_url(@movement), notice: "El movimiento ah sido creado correctamente. " }
        format.json { render :show, status: :created, location: @movement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movements/1 or /movements/1.json
  def update
    respond_to do |format|
      if @movement.update(movement_params)
        format.html { redirect_to movement_url(@movement), notice: "El movimiento ah sido modificado correctamente. " }
        format.json { render :show, status: :ok, location: @movement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movements/1 or /movements/1.json
  def destroy
    @movement.destroy

    respond_to do |format|
      format.html { redirect_to movements_url, notice: "El movimiento ah sido eliminado correctamebnte. " }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movement
      @movement = Movement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movement_params
      params.require(:movement).permit(:descripcion, :cantidad, :account_id, :concept_id, :user_id, :goal_id)
    end
end
