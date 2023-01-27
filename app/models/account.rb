# == Schema Information
#
# Table name: accounts
#
#  id            :integer          not null, primary key
#  nombre        :string
#  descripcion   :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  saldo         :decimal(, )
#  tipo_cuenta   :integer
#  tipo_familiar :boolean
#  user_id       :integer          not null
#
class Account < ApplicationRecord
  validates :nombre, :descripcion, :saldo, :tipo_cuenta, :tipo_familiar, presence: true
  validates :saldo, numericality: { greater_than: 0, only_integer: true }
  belongs_to :user
  


    def guardar_cuenta(usuario)
      # Asigna el id del usuario al objeto cuenta
      self.user_id = usuario.id
      # Guarda el objeto cuenta y retorna el objeto si se guardó correctamente, en caso contrario retorna nil
      if self.save
        self
      else
        nil
      end
    end
  
    def self.cuentas_personales(user_id)
      # Busca los usuarios con el id especificado
      usuarios = User.where(id: user_id)
      # Si se encontraron usuarios, busca las cuentas relacionadas con esos usuarios y las retorna
      if usuarios
        Account.where(user_id: usuarios)
      else
        nil
      end
    end
  end
