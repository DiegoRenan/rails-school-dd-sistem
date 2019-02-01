class CarreirasController < ApplicationController
        http_basic_authenticate_with name: "root", password: "super", except: [:index, :show, :edit, :new, :update, :create]
    
	def create
		if logged_in? and current_user_tipo == "administrador"
			@curso = Curso.find(params[:curso_id])
			@carreira = @curso.carreiras.create(carreira_params)
			redirect_to curso_path(@curso)
		else
			redirect_to login_path
		end
	end
	
	def destroy
		if logged_in? and current_user_tipo == "administrador"
			@curso = Curso.find(params[:curso_id])
			@carreira = @curso.carreiras.find(params[:id])
			@carreira.destroy
			redirect_to curso_path(@curso)
		else
			redirect_to login_path
		end
	end
	
	private
		def carreira_params
			params.require(:carreira).permit(:nome)
		end
end
