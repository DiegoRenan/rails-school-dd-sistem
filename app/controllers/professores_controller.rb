class ProfessoresController < ApplicationController
	
	http_basic_authenticate_with name: "root", password: "super", except: [:index, :show, :new, :update, :create, :edit]
	
	def index
		@professores = Professor.all
	end
	
	def show
		@professor = Professor.find(params[:id])
	end
	
	def new
		if logged_in? and current_user_tipo == "administrador"
			@professor = Professor.new
		else
			redirect_to login_path
		end
	end
	
	def edit
		if logged_in? and current_user_tipo == "administrador"
			@professor = Professor.find(params[:id])
		else
			redirect_to login_path
		end
	end
	
	def create
		if logged_in? and current_user_tipo == "administrador"
			@professor = Professor.new(professor_params)
	 
			if @professor.save
				redirect_to @professor	
			else
				render 'edit'
			end
		else
			redirect_to login_path
		end
	end
	
	def update		
		if logged_in? and current_user_tipo == "administrador"
		@professor = Professor.find(params[:id])
			if @professor.update(professor_params)
				redirect_to @professor
			else
				render 'edit'
			end
		else
			redirect_to login_path
		end
	end
	
	def destroy
		if logged_in? and current_user_tipo == "administrador"
			@professor = Professor.find(params[:id])
			if @professor.nil?
				flash[:error] = "object is not not found"
			elsif @professor.destroy
				redirect_to professores_path
			end
		else
			redirect_to login_path
		end
	end
	
	private
		def professor_params
			params.require(:professor).permit(:nome, :formacao, :curriculo)
		end
end
