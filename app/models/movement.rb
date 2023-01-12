class Movement < ApplicationRecord
# after_save :restar_saldo

    def guardad_movimientos(usuario)
        self.user_id = usuario.id
        if self.save
            self
        else
            nil
        end
        end

        # def restar_saldo
        #     self.cantidad = cantidad
        #     self.saldo = Account.
        #     resta = self.saldo - self.cantidad
        # end
end




