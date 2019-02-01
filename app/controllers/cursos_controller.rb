class CursosController < ApplicationController

	http_basic_authenticate_with name: "root", password: "super", except: [:index, :show, :edit, :new, :update, :create]
	
	def index
		@cursos = Curso.all
	end
	
	def show
		@curso = Curso.find(params[:id])
	end
	
	def new
		if logged_in? and current_user_tipo == "administrador"
			@curso = Curso.new
		else
			redirect_to login_path
		end
	end
	
	def edit
		if logged_in? and current_user_tipo == "administrador"
			@curso = Curso.find(params[:id])
		else
			redirect_to login_path
		end
	end
	
	def create
		if logged_in? and current_user_tipo == "administrador"
			@curso = Curso.new(curso_params)
			if @curso.save
				redirect_to @curso
			else
				render 'edit'
			end
		else
			redirect_to login_path
		end
	end
	
	def update
		if logged_in? and current_user_tipo == "administrador"
			@curso = Curso.find(params[:id])
			
			if @curso.update(curso_params)
				redirect_to @curso
			else
				render 'edit'
			end
		else
			redirect_to login_path
		end
	end
	
	def destroy
		if logged_in? and current_user_tipo == "administrador"
			@curso = Curso.find(params[:id])
			if @curso.nil?
				flash[:error] = "object is not not found"
			elsif @curso.destroy
				redirect_to cursos_path
			end
		else
			redirect_to login_path
		end
	end
	
	private
		def curso_params
			params.require(:curso).permit(:nome, :descricao, :duracao)
		end	
end
