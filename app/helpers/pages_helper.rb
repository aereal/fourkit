# Helper methods defined here can be accessed in any controller or view in the application

FourKit.helpers do
	def show_page_url(title, opts={})
		url_for(:pages, :show, title: title)
	end

	def edit_page_url(title, opts={})
		url_for(:pages, :edit, title: title)
	end
end
