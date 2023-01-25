# == Schema Information
#
# Table name: movements
#
#  id          :integer          not null, primary key
#  descripcion :string
#  cantidad    :decimal(, )
#  account_id  :integer          not null
#  concept_id  :integer          not null
#  user_id     :integer          not null
#  goal_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Movement < ApplicationRecord
belongs_to :user



  def guardad_movimientos(usuario)
      self.user_id = usuario.id
      concepto = Concept.find(self.concept_id)
      if concepto.tipo == 1
        incrementar_saldo
      elsif concepto.tipo == 2
        decrementar_saldo
      end
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

    def incrementar_saldo
      cuenta = Account.find(self.account_id)
      cuenta.saldo = cuenta.saldo + self.cantidad.to_f
      cuenta.save
    end