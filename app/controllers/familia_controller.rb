class FamiliaController < ApplicationController
  
    def mi_familia
        
    end

    def registro_nueva_fam
        @user = User.new
        @user.family_id = current_user.family_id
    end



end
