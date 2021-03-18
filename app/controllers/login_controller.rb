class LoginController < UsuariosController
  skip_before_action :verify_authenticity_token, only: :logar
  def sigin
  end

  def cadastrar
  end

  def login
  end

  def logar
    usuario = Usuario.login(params[:login], params[:senha])
    #se usuario for encontrado nós preenchemos o cookie com o usuario.id
    if usuario.present?
    #preenchemos o cookie com o usuario.id
      cookies[:usuario] = usuario.id
    #redireciona para a rota root /  
      redirect_to '/'
    else
    #caso não ache o cookie, nos vamos. rederiza o login novamente
    render :login
    end
  end

  def logout
    cookies[:usuario] = nil
    redirect_to '/'
  end
end
