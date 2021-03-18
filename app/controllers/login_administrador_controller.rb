class LoginAdministradorController < ApplicationController
  # este skip faz pular ação de autenticação que o rails faz automaticamente.
  layout 'login'
  # mas depois vamos implementar melhor esta ação (verify_authenticity_token)
skip_before_action :verify_authenticity_token, only: :logar

   def login

   end
    # este é o método reponsavel por logar
    def logar
    #estou acessando o meu modelo de Administrador
    #vmaos seuigr o  padrão camelCase os modelos do rails
    administrador  = Administrador.login(params[:login], params[:senha])
    #se ele for encontrado vamos criar o cookie
    #Lembrete do rails não precisamos colocar o return, sempre a ultima linha já faz isto.
    if administrador.present?
      cookies[:administrador] = administrador.nome
      #ao achar o o login e senha do administrador
      #faço o redicionamento para a rota root /
      redirect_to '/administradors'
    end
  end

    def logout
      cookies[:administrador] = nil
      redirect_to '/administrador/login'
    end
end
