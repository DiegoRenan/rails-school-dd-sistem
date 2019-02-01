class QuestoesController < ApplicationController
	http_basic_authenticate_with name: "root", password: "super", except: [:index, :show, :edit, :new, :update, :create]
	
        def index
            if logged_in? and current_user_tipo == "administrador"
                @questoes = Questao.all
            else
		redirect_to login_path
            end
        end
        
        def show
            @questao = Questao.find(params[:id])
            
            if params[:db]
                @db = Questionario.find(params[:db])
            end
            
            if params[:categoria]
                @questoes = Questao.get_questao_by_categoria(params[:categoria])
                @categoria = params[:categoria]
                if !(@questao.id == @questoes.last.id)
                    @questao_next = @questoes.where("id > ?", @questao.id).first
                end
            else
                if !(@questao.id == Questao.last.id)
                    @questao_next = Questao.where("id > ?", @questao.id).first
                end
            end
            

            @answer = resposta
	end
	
	def new
		if logged_in? and current_user_tipo == "administrador"
			@questionario = Questionario.find(params[:questionario_id])
		else
			redirect_to login_path
		end
	end
	
	def edit
		if logged_in? and current_user_tipo == "administrador"
			@questao = Questao.find(params[:id])
		else
			redirect_to login_path
		end
	end
	
	def create
		if logged_in? and current_user_tipo == "administrador"
			@questionario = Questionario.find(params[:questionario_id])
			@questao = @questionario.questoes.create(questao_params)
                        if @questao.id.present?                            
                            flash[:success] = "Salvo com sucesso"
                        else
                            flash[:danger] = "Questão não foi salva. Preencha todos os dados corretamente"
                        end
                        redirect_to questao_path(@questao, db: @questionario.id)
		else
			redirect_to login_path
		end
		
	end
	
	def update
		if logged_in? and current_user_tipo == "administrador"
			@questao = Questao.find(params[:id])
			if @questao.update(questao_params)
				redirect_to @questao
			else
				render 'edit'
			end
		else
			redirect_to login_path
		end
	end
	
	def destroy
	
		if logged_in? and current_user_tipo == "administrador"
			@questionario = Questionario.find(params[:questionario_id])
			@questao = @questionario.questoes.find(params[:id])
			@questao.destroy
			redirect_to questionario_path(@questionario)
		else
			redirect_to login_path
		end
	end
	
	private
		def questao_params
			params.require(:questao).permit(:questao, :feedback, :valor, :penalidade, categoria_ids:[])
		end
                
                def resposta
                   @questao.alternativas.where("qualidade = true").ids
                end
end
