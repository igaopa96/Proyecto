class Goal < ApplicationRecord
  
  def guardar_metas(usuario)
    # Asigna el id del usuario y el id de la familia del usuario al objeto meta
    self.user_id = usuario.id
    self.family_id = usuario.family_id
    # Guarda el objeto meta y retorna el objeto si se guardó correctamente, en caso contrario retorna nil
    if self.save
      self
    else
      nil
    end
  end

  def self.metas_familiares(family_id)
    # Busca los usuarios con el id de familia especificado
    usuarios = User.where(family_id: family_id)
    # Si se encontraron usuarios, busca las metas relacionadas con esos usuarios y las retorna
    if usuarios
      Goal.where(user_id: usuarios)
    else
      nil
    end
  end
end



  