class Administrador < ApplicationRecord
    #vamos agora declarar um método de classe
    #lembrando que este mesmo método (login) está sendo usado. Na controller login_administrador_controller .rb
    def self.login(login, senha)
        #usando o método find eu busco o login e a senha digitada pelo usuario..
      Administrador.find_by(login: login, senha: senha)
    end
end
