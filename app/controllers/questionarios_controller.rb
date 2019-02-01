class QuestionariosController < ApplicationController
	http_basic_authenticate_with name: "root", password: "super", except: [:index, :show, :new, :update, :create, :edit]
	
	def index
            redirect_to root_path
            ##if logged_in? and current_user_tipo == "administrador"
            #    @questionarios = Questionario.all
            #else
            #    redirect_to Questionario.where("Titulo = 'Banco de exemplo'").first
            #end*/
	end
	
	def show
            @questionario = Questionario.find(params[:id])
	end
	
	def new
		if logged_in? and current_user_tipo == "administrador"
			@questionario = Questionario.new
		else
			redirect_to login_path
		end
	end
	
	def edit
		if logged_in? and current_user_tipo == "administrador"
			@questionario = Questionario.find(params[:id])
		else
			redirect_to login_path
		end
	end
	
	def create
		if logged_in? and current_user_tipo == "administrador"
			@questionario = Questionario.new(questionario_params)
			if @questionario.save
                                flash[:success] = "Salvo com sucesso"
				redirect_to @questionario
			else
				render 'edit'
			end
		else
			redirect_to login_path
		end
	end
	
	def update
		if logged_in? and current_user_tipo == "administrador"
			@questionario = Questionario.find(params[:id])
			if @questionario.update(questionario_params)
                            flash[:success] = "Salvo com sucesso"	
                            redirect_to @questionario
			else
				render 'edit'
			end
		else
			redirect_to login_path
		end
	end
	
	def destroy
		if logged_in? and current_user_tipo == "administrador"
			@questionario = Questionario.find(params[:id])
			if @questionario.nil?
				flash[:error] = "object is not not found"
			elsif @questionario.destroy
                                flash[:success] = "Banco de Questões deletado com successo"
				redirect_to @questionario
			end
		else
			redirect_to login_path
		end
	end
	
	private
		def questionario_params
			params.require(:questionario).permit(:titulo, :feedback)
		end

end
