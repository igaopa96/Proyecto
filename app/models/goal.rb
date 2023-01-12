class Goal < ApplicationRecord
    
    def guardar_metas(usuario)
      self.user_id = usuario.id
      self.family_id = usuario.family_id
      if self.save
          self
      else
          nil
      end
    end

    def self.metas_familiares(family_id)
      usuarios = User.where(family_id: family_id)
      if usuarios
        Goal.where(user_id: usuarios)
      else
        nil
      end

    end


end



  