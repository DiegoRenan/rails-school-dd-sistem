class Professor < ApplicationRecord
    validates :nome, presence: true
    validates :formacao, presence: true
    validates :curriculo, presence: true
end

