class FamiliaController < ApplicationController
      before_action :authenticate_user!
  
    # Acción para mostrar los miembros de la familia del usuario actual
    def mi_familia
        # buscar el registro de la familia del usuario actual utilizando su id de familia
        @familia = Family.find(current_user.family_id)
    end

    # Acción para registrar un nuevo miembro de la familia
    def registro_nuevo_familar
        if current_user.tipo_usuario == 1
            # Crear un nuevo objeto de usuario con los parámetros enviados desde el formulario
            @user = User.new(nombre: params[:user][:nombre], telefono: params[:user][:telefono],email: params[:user][:email], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])
            # Asignar el id de familia del usuario actual al nuevo usuario y un tipo de usuario especifico
            @user.family_id = current_user.family_id
            @user.tipo_usuario = 2
            # Guardar el nuevo usuario en la base de datos y redirigir al usuario a la vista de miembros de la familia con un mensaje de notificación
            if @user.save
                redirect_to(mi_familia_path, notice: 'Familiar creado correctamente.')
            else
                #no se maneja errores en caso de no guardar correctamente
            end
        else
            redirect_to(mi_familia_path, notice: 'Solo el usuario administrador puede agregar familiares.')
        end
    end

    # Acción para mostrar un formulario para registrar un nuevo miembro de la familia
    def nuevo_familiar
        # Crear una nueva instancia de usuario para mostrar un formulario vacío
        @user = User.new
    end
end