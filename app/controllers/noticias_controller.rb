class NoticiasController < ApplicationController
	
	http_basic_authenticate_with name: "root", password: "super", except: [:index, :show, :edit, :new, :update, :create]
	 
	def index
		@noticias = Noticia.all.order('id DESC')
	end
	
	def show
		@noticia = Noticia.find(params[:id])
	end
	
	def new
		if logged_in? and current_user_tipo == "administrador"
			@noticia = Noticia.new
		else
			redirect_to login_path
		end
	end
	
	def edit
		if logged_in? and current_user_tipo == "administrador"
			@noticia = Noticia.find(params[:id])
		else
			redirect_to login_path
		end
	end
	
	def create
		if logged_in? and current_user_tipo == "administrador"
			@noticia = Noticia.new(noticia_params)
	 
			if @noticia.save
				redirect_to @noticia
			else
				render 'edit'
			end
		else
			redirect_to login_path
		end
	end
		
	def update
		if logged_in? and current_user_tipo == "administrador"
			@noticia = Noticia.find(params[:id])
			
			if @noticia.update(noticia_params)
				redirect_to @noticia
			else
				render 'edit'
			end
		else
			redirect_to login_path
		end
	end
	
	def destroy
		if logged_in? and current_user_tipo == "administrador"
			@noticia = Noticia.find(params[:id])
			if @noticia.nil?
				flash[:error] = "object is not not found"
			elsif @noticia.destroy
				redirect_to noticias_path
			end
		else
			redirect_to login_path
		end
	end
	
	private
		def noticia_params
			params.require(:noticia).permit(:titulo, :texto, :uf, :vaga, :cargo, :salario, :banca, :edital, :inscricao, :resume)
		end
end
