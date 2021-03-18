class ReservasController < AdministradorsController
  before_action :set_reserva, only: %i[ show edit update destroy ]
  

  # GET /reservas or /reservas.json
  def index
    @reservas = Reserva.all
  end

  # GET /reservas/1 or /reservas/1.json
  def show
  end

  

  # DELETE /reservas/1 or /reservas/1.json
  def destroy
    @reserva.destroy
    respond_to do |format|
      format.html { redirect_to reservas_url, notice: "Reserva was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reserva
      @reserva = Reserva.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reserva_params
      params.require(:reserva).permit(:veiculos_id, :cliente_id, :tempo_de_espera, :valor_alugado, :reservado_de, :resevado_ate, :pagamento_no_destino)
    end
end
