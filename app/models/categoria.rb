class Categoria < ApplicationRecord
	validates :categoria, presence: true, length: { maximum: 250 }
	has_and_belongs_to_many :questoes, dependent: :destroy
end
