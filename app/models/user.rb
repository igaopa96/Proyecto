class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
:recoverable, :rememberable, :validatable , :confirmable , :trackable

before_save :asignar_tipo

protected
  def asignar_tipo
    if !self.family_id
      self.tipo_usuario = 1
    end
    

  end

end
