class Questao < ApplicationRecord
  belongs_to :questionario
  
  has_many :alternativas, dependent: :destroy
  
  has_and_belongs_to_many :categorias 
  
  validate :validate_presence_categoria
  
  validates :questao, presence: true
  
  
  
  private
	def validate_presence_categoria
	  errors.add("Categoria",
			"deve haver ao menos uma categoria") if categorias.empty?
	end
        
        def answers=(alternativas)
            answers.reject(&:blank?)
        end
        
        def self.get_questao_by_categoria(categoria_id)
            
            if categoria_id == "todas"
                return Questao.all
            end
            
            @categoria = Categoria.find(categoria_id)
            if @categoria.questoes.empty?
                return "questoes empty"
            else
                return @categoria.questoes
            end
        end
        
end
