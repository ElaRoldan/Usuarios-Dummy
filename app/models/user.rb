class User < ActiveRecord::Base
  # Remember to create a migration!  
  #Validacion que ìde que exista un correo electronico y que cada correo sea unico             
  validates :mail, uniqueness: true,  presence: true
  #La validacion del password es solo que este presente
  validates :password, presence: true

  #Metodo que comprueba que el email y el password existan en la base de datos
  def self.validation(mail,password)
    valid_user = User.find_by(mail: mail, password: password)
 
  end  
end
