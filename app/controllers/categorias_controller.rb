class CategoriasController < ApplicationController
	http_basic_authenticate_with name: "root", password: "super", except: [:index, :show, :edit, :new, :create, :update]
	
	def index
		@categorias = Categoria.all
	end
	
	def show
		@categoria = Categoria.find(params[:id])
	end
	
	def new
		if logged_in? and current_user_tipo == "administrador"
			@categoria = Categoria.new
		else
			redirect_to login_path
		end
	end
	
	def edit
		if logged_in? and current_user_tipo == "administrador"
			@categoria = Categoria.find(params[:id])
		else
			redirect_to login_path
		end
	end
	
	def create
		if logged_in? and current_user_tipo == "administrador"
			@categoria = Categoria.new(categoria_params)
	 
			if @categoria.save
				redirect_to @categoria
			else
				render 'edit'
			end
		else
			redirect_to login_path
		end
	end
	
	def update
		if logged_in? and current_user_tipo == "administrador"
			@categoria = Categoria.find(params[:id])
			
			if @categoria.update(categoria_params)
				redirect_to @categoria
			else
				render 'edit'
			end
		else
			redirect_to login_path
		end
	end
	
	def destroy
		if logged_in? and current_user_tipo == "administrador"
			@categoria = Categoria.find(params[:id])
			if @categoria.nil?
				flash[:error] = "object is not not found"
			elsif @categoria.destroy
				redirect_to categorias_path
			end
		else
			redirect_to login_path
		end
	end
	
	private
		def categoria_params
			params.require(:categoria).permit(:categoria)
		end
	
end
