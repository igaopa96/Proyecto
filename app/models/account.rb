class Account < ApplicationRecord

    def guardar_cuenta(usuario)
        #cuenta = Account.new(user_id: usuario.id, nombre: nombre, descripcion: descripcion, saldo: saldo, tipo_cuenta: tipo_cuenta, tipo_familiar: tipo_familiar)
        self.user_id = usuario.id
        if self.save
            self
        else
            nil
        end
        
    end
    
end
