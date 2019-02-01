class Curso < ApplicationRecord
	has_many :modulos, dependent: :destroy
	has_many :carreiras, dependent: :destroy
        
        validates :nome, presence: true, length: { maximum: 50 }
        validates :descricao, presence: true
        validates :duracao, presence: true, length: { maximum: 50 }
end
