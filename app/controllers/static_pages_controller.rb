class StaticPagesController < ApplicationController
	
        def home
            @noticias_last = home_news
	end
  
	def eventos
	end
	
	def contato
	end
	
	def controlpanel
		@user = User.find_by(params[:id])
	end
	
	def quemsomos
	end
        
        def banco_questoes
            @user = User.find_by(params[:id])
            @bd_questoes = Questionario.all
        end
        
        def testeapoio
            @user = User.find_by(params[:id])
            @questionario = Questionario.find_by(params[:id])
        end
        
	private
		def home_news
			@noticias = Noticia.all.order("id DESC")
			if @noticias.count > 5
				@noticiaslast = Noticia.last(6).reverse
			else
				@noticias
			end
		end
	
end
