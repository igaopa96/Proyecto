class GoalsController < ApplicationController
  before_action :set_goal, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /goals or /goals.json
  def index
    if current_user.nil?
      redirect_to new_user_session_path and return
    end
    if current_user.tipo_usuario == 1
      @goals = Goal.all
    else
      @goals = current_user.goals
    end
  end

  # GET /goals/1 or /goals/1.json
  def show
  end

  # GET /goals/new
  def new
    @goal = Goal.new
  end

  # GET /goals/1/edit
  def edit
  end

  # POST /goals or /goals.json
  def create
    @goal = Goal.new(goal_params)
    goal = @goal.guardar_metas(current_user)

    respond_to do |format|
      if goal
        format.html { redirect_to goal_url(@goal), notice: "La meta ah sido creada correctamente." }
        format.json { render :show, status: :created, location: @goal }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goals/1 or /goals/1.json
  def update
    respond_to do |format|
      if @goal.update(goal_params)
        format.html { redirect_to goal_url(@goal), notice: "La meta ah sido modificada correctamente." }
        format.json { render :show, status: :ok, location: @goal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goals/1 or /goals/1.json
  def destroy
    @goal.destroy

    respond_to do |format|
      format.html { redirect_to goals_url, notice: "La meta ah sido eliminada correctamente." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = Goal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def goal_params
      params.require(:goal).permit(:nombre, :descripcion, :cantidad, :saldo, :family_id, :user_id)
    end
end
