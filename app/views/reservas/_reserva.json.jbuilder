json.extract! reserva, :id, :veiculos_id, :cliente_id, :tempo_de_espera, :valor_alugado, :reservado_de, :resevado_ate, :pagamento_no_destino, :created_at, :updated_at
json.url reserva_url(reserva, format: :json)
