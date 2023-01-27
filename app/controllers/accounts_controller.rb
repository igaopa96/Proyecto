class AccountsController < ApplicationController
  before_action :set_account, only: %i[ show edit update destroy ]
  before_action :authenticate_user! 

  # GET /accounts or /accounts.json
  def index
    if current_user.nil?
      redirect_to new_user_session_path and return
    end
    if current_user.tipo_usuario == 1
      @accounts = Account.all
    else
      @accounts = current_user.accounts.where(tipo_familiar: true)
      @accounts += current_user.accounts.where(tipo_familiar: false)
    end
  end

  # GET /accounts/1 or /accounts/1.json
  def show
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts or /accounts.json
  def create
    @account = Account.new(account_params)
    cuenta = @account.guardar_cuenta(current_user)

    respond_to do |format|
      if cuenta
        NotificationMailer.notification_account(current_user, @account).deliver_later
        format.html { redirect_to accounts_path, notice: "Tu cuenta ah sido creada correctamente." }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1 or /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to account_url(@account), notice: "La cuenta se actializo correctamente." }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1 or /accounts/1.json
  def destroy
    @account.destroy

    respond_to do |format|
      format.html { redirect_to accounts_url, notice: "La cuenta se elimino correctamente" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def account_params
      params.require(:account).permit(:nombre, :descripcion, :saldo, :tipo_cuenta, :tipo_familiar, :user_id)
    end
end
