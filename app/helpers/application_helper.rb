module ApplicationHelper
	# Returns the full title on a per-page basis.
	def full_title(page_title = '')
		base_title = "D&D Concursos"
		if page_title.empty?
			base_title
		else
			page_title + " | " + base_title
		end
	end
        
        def add_url_protocol(link)
            unless link[/^https?:\/\//] || link[/^http?:\/\//]
                link = "http://#{link}"
            else
                link
            end
        end
end
