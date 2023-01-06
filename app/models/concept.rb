class Concept < ApplicationRecord

    def guardar_concept(usuario)
      self.user_id = usuario.id
      if self.save
        self
      else
        nil
      end
      
    end

    def self.conceptos_familiares(family_id)
      #consulta para traer todos los usuarios de una familia 
      #select * from users where family_id = [family_id]
      usuarios = User.where(family_id: family_id)
      if usuarios
        #consulta para optener los conceptos de los usuarios optenidos 
        Concept.where(user_id: usuarios)
      else
        nil
      end

    end

end
