class Noticia < ApplicationRecord
	validates_presence_of :titulo
	validates_presence_of :texto
	validates_presence_of :resume
        validates_presence_of :uf
end
