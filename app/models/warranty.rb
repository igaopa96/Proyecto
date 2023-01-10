class Warranty < ApplicationRecord
  def guardar_garantia(usuario)
    self.user_id = usuario.id
    if self.save
      self
    else
      nil
    end
    
  # def calculo_dias_restantes()
    
  # end

  end
end
