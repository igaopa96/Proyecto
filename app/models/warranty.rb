# == Schema Information
#
# Table name: warranties
#
#  id                :integer          not null, primary key
#  nombre            :string
#  no_identificacion :string
#  fecha_adq         :date
#  estado            :string
#  periodo_dias      :integer
#  dias_restantes    :integer
#  user_id           :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Warranty < ApplicationRecord
  validates :nombre, :no_identificacion, :estado, :fecha_adq, presence: true
  validates :periodo_dias, presence: true, numericality: { only_integer: true, greater_than: 0 }
  
  # Declarar una relación uno a uno con un archivo adjunto llamado "comprobante_garantia"
  # que se manejará mediante ActiveStorage
  has_many_attached :comprobante_garantia

  def guardar_garantia(usuario)
    # Asigna el id del usuario al objeto garantía
    self.user_id = usuario.id
    # Guarda el objeto garantía y retorna el objeto si se guardó correctamente, en caso contrario retorna nil
    if self.save
      self
    else
      nil
    end
  end

  def dias_restantes
    # Calcula la fecha final de la garantía sumando los días de duración a la fecha de adquisición
    fecha_final = self.fecha_adq + self.periodo_dias
    # Calcula los días restantes restando la fecha actual a la fecha final de la garantía
    self.dias_restantes = (fecha_final - Date.today).to_i
    self.save
  end

  


  
end
