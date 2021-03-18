class Marca < ApplicationRecord
    #Uma (marca, pode ter varios veiculos => o has_many para dizer isto)
    has_many :veiculos
end
