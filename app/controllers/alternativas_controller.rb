class AlternativasController < ApplicationController
	http_basic_authenticate_with name: "root", password: "super", except: [:index, :show, :edit, :new, :update, :create]
	
	def show		
		@alternativa = Alternativa.find(params[:id])
	end

	def new
		if logged_in? and current_user_tipo == "administrador"
			@questao = Questao.find(params[:questao_id])
		else
			redirect_to login_path
		end
	end
	
	def edit
		if logged_in? and current_user_tipo == "administrador"
			@alternativa = Alternativa.find(params[:id])
		else
			redirect_to login_path
		end
	end
	
	def create
	
		if logged_in? and current_user_tipo == "administrador"
			@questao = Questao.find(params[:questao_id])
			@alternativa = @questao.alternativas.create(alternativa_params)
                        if @alternativa.id.present?                            
                            flash[:success] = "Salvo com sucesso"
                        else
                            flash[:danger] = "Alternativa não foi salva. Preencha todos os dados corretamente"
                        end
                        redirect_to questao_path(@questao)                        
		else
			redirect_to login_path
		end
		
	end
	
	def update
		if logged_in? and current_user_tipo == "administrador"
			@alternativa = Alternativa.find(params[:id])
			if @alternativa.update(alternativa_params)
				redirect_to @alternativa
			else
				render 'edit'
			end
		else
			redirect_to login_path
		end
	end
	
	def destroy
		if logged_in? and current_user_tipo == "administrador"
			@alternativa = Alternativa.find(params[:id])
			if @alternativa.nil?
				flash[:error] = "object is not not found"
			elsif @alternativa.destroy
				redirect_to @alternativa.questao
			end
		else
			redirect_to login_path
		end
	end
	
	private
		def alternativa_params
			params.require(:alternativa).permit(:alternativa, :qualidade)
		end
end
