enable :sessions 

#Bloque de codigo que se ejecuta antes de la ruta welcome
before '/welcome' do
  unless session[:user_mail]
    #Envia mensaje de error al ususario 
    session[:error] = "No has iniciado sesión"
    redirect to "/"
  end
  @user = User.find_by(mail: session[:user_mail])
end

get '/' do
  erb :index
end

get '/welcome' do  
   erb :welcome
end   

#ruta para el logout de la sesion 
get '/logout' do
  session.clear
  redirect to "/"  
 end


post '/user' do
  @user_mail = params[:user_mail]
  @password = params[:user_password]
 
  #Regresa true si el ususario y ña contraseña existen en la base de datos
  valid_user = User.validation(@user_mail, @password)
  if valid_user
    session[:user_mail] = @user_mail
    redirect to '/welcome'
  else
    redirect to '/welcome'
  end
end    





