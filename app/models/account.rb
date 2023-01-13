class Account < ApplicationRecord

    def guardar_cuenta(usuario)
        self.user_id = usuario.id
        if self.save
            self
        else
            nil
        end
        
    end

    def self.cuentas_personales(user_id)
        usuarios = User.where(id: user_id)
        if usuarios
            Account.where(user_id: usuarios)
        else
            nil
        end
    end

    
    
end
