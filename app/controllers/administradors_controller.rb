class AdministradorsController < ApplicationController
  before_action :set_administrador, only: %i[ show edit update destroy ]

  #berofe_action => esta dizendo antes de qualquer ação que for executada neste controller ou qualquer controller que dependa dele.
  # ele vai executar esta função
  before_action :authenticate_admin!
  # estou sontruindo um método de login
  # neste método vou construir um cookie para armazenar informações de login e senha
  def authenticate_admin!
    #se o administrador estiver me branco. Vamos redireciona-lo para a rota de login
    if cookies[:administrador].blank?
      redirect_to '/administrador/login'
    end
  end 

  # GET /administradors or /administradors.json
  def index
    @administradors = Administrador.all
  end

  # GET /administradors/1 or /administradors/1.json
  def show
  end

  # GET /administradors/new
  def new
    @administrador = Administrador.new
  end

  # GET /administradors/1/edit
  def edit
  end

  # POST /administradors or /administradors.json
  def create
    @administrador = Administrador.new(administrador_params)

    respond_to do |format|
      if @administrador.save
        format.html { redirect_to @administrador, notice: "Administrador was successfully created." }
        format.json { render :show, status: :created, location: @administrador }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @administrador.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /administradors/1 or /administradors/1.json
  def update
    respond_to do |format|
      if @administrador.update(administrador_params)
        format.html { redirect_to @administrador, notice: "Administrador was successfully updated." }
        format.json { render :show, status: :ok, location: @administrador }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @administrador.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /administradors/1 or /administradors/1.json
  def destroy
    @administrador.destroy
    respond_to do |format|
      format.html { redirect_to administradors_url, notice: "Administrador was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_administrador
      @administrador = Administrador.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def administrador_params
      params.require(:administrador).permit(:nome, :login, :senha)
    end
end
