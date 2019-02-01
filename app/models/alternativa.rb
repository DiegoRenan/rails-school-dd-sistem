class Alternativa < ApplicationRecord
  belongs_to :questao
  validates :alternativa, presence: true
end
