class Questionario < ApplicationRecord
	has_many :questoes, dependent: :destroy
	
	validates :titulo, presence: true, length: { minimum: 5 }
        
end
