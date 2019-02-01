module QuestoesHelper
	def checked(area)
		@questao.categoria.nil? ? false : @questao.categoria.match(area)
	end
end
