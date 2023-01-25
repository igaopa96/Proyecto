# == Schema Information
#
# Table name: concepts
#
#  id          :integer          not null, primary key
#  nombre      :string
#  tipo        :integer
#  descripcion :string
#  user_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Concept < ApplicationRecord
  validates :nombre, :tipo, :descripcion, presence: true
  #validates :tipo, numericality: { only_integer: true }
  validates :tipo, inclusion: { in: [1, 2] }


  def guardar_concept(usuario)
    # Asigna el id del usuario al objeto concepto
    self.user_id = usuario.id
    # Guarda el objeto concepto y retorna el objeto si se guardó correctamente, en caso contrario retorna nil
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
