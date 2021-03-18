class Reserva < ApplicationRecord
  belongs_to :veiculos
  belongs_to :cliente
end
