class NotificationMailer < ApplicationMailer
    default from: 'notifiacation_no_replay@familyadmin.com'

  
    def notification_movement(current_user, movement)
        @user = current_user
        @movement = movement
        mail(to: @user.email, subject: 'Notificación de movimiento')
    end

    def notification_warranty(current_user, warranty)
        @user = current_user
        @warranty = warranty
        mail(to: @user.email, subject: 'Notificacion de Garantia')
    end

    def notification_account(current_user, account)
        @user = current_user
        @account = account
        mail(to: @user.email, subject: 'Notificacion de Cuenta')
    end

    

end



#Esta linea se pegara despues de la accion en la que quiera que se envia la notificacion NotificationMailer.notification_movement(@user, @data).deliver_later