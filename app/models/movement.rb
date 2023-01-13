class Movement < ApplicationRecord
    after_save :decrementar_saldo
  
    def guardad_movimientos(usuario)
      # Asigna el id del usuario al objeto movimiento
      self.user_id = usuario.id
      # Guarda el objeto movimiento y retorna el objeto si se guardó correctamente, en caso contrario retorna nil
      if self.save
        self
      else
        nil
      end
    end
  
    def decrementar_saldo
      # Busca la cuenta relacionada con el id de cuenta del objeto movimiento
      cuenta = Account.find(self.account_id)
      # Actualiza el saldo de la cuenta restando la cantidad del movimiento
      cuenta.saldo = cuenta.saldo - self.cantidad.to_f
      # Guarda los cambios en la cuenta
      cuenta.save
    end
  end



