class Movement < ApplicationRecord

  def guardad_movimientos(usuario)
      self.user_id = usuario.id
      if self.save
          self
      else
          nil
      end

      end


end


