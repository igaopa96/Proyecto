class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
:recoverable, :rememberable, :validatable , :confirmable , :trackable

before_save :asignar_tipo
after_create :crear_familia 

attr_accessor :nombre_familia

protected

  def crear_familia
    
    #familia = Family.create(user_id: self.id, nombre: self.nombre_familia, saldo: 0)
    # if familia.id
    #   self.family_id = familia.id
    #   self.save
    # end
  end 

  def asignar_tipo
    if !self.family_id
      self.tipo_usuario = 1
    end
    

  end

end
