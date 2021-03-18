class CreateReservas < ActiveRecord::Migration[5.2]
  def change
    create_table :reservas do |t|
      t.references :veiculos, foreign_key: true
      t.references :cliente, foreign_key: true
      t.integer :tempo_de_espera
      t.decimal :valor_alugado
      t.datetime :reservado_de
      t.datetime :resevado_ate
      t.boolean :pagamento_no_destino

      t.timestamps
    end
  end
end
