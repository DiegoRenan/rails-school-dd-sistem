class UsersController < ApplicationController
    http_basic_authenticate_with name: "root", password: "super", except: [:index, :show, :new, :update, :create, :edit]
	
	def show
            if logged_in? and current_user_tipo == "administrador"
		          @user = User.find(params[:id])
            else
                redirect_to login_path
            end
	end
	
	def new
            if logged_in? and current_user_tipo == "administrador"
                @user = User.new
            else
		      redirect_to login_path
            end	
	end
	
	def create
            if logged_in? and current_user_tipo == "administrador"
                @user = User.new(user_params)
                if @user.save
                    log_in @user
                    flash[:success] = "Bem Vindo"
                    redirect_to @user
                else
                    render 'new'
                end
            else
                redirect_to login_path
            end
		
	end
	
	def destroy
            
            if logged_in? and current_user_tipo == "administrador"
                flash[:error] = "Usuario não pode ser removido"
            else
                redirect_to login_path
            end
	end
	
	private

		def user_params
			params.require(:user).permit(:nome, :email, :tipo, :password, :password_confirmation)
		end
	
end
