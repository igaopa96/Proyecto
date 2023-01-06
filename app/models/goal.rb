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

end


#belongs_to :family
  #belongs_to :user
  