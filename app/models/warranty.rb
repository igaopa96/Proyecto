class Warranty < ApplicationRecord

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
    dias_restantes = (fecha_final - Date.today).to_i
    dias_restantes
  end
  
end
