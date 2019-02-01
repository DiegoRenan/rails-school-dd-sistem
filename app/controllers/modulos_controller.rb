class ModulosController < ApplicationController
	http_basic_authenticate_with name: "root", password: "super", except: [:index, :show, :edit, :new, :update, :create]
        
	def create
		if logged_in? and current_user_tipo == "administrador"
			@curso = Curso.find(params[:curso_id])
			@modulo = @curso.modulos.create(modulo_params)
			redirect_to curso_path(@curso)
		else
			redirect_to login_path
		end
	end
	
	def destroy
		if logged_in? and current_user_tipo == "administrador"
			@curso = Curso.find(params[:curso_id])
			@modulo = @curso.modulos.find(params[:id])
			@modulo.destroy
			redirect_to curso_path(@curso)
		else
			redirect_to login_path
		end
	end
	
	private
		def modulo_params
			params.require(:modulo).permit(:nome)
		end
end
