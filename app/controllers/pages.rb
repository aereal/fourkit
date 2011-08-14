WikiPs.controllers :pages do
	get :index do
		@pages = Page.all(:order => :created_at.desc).uniq(&:title)
		render 'pages/index'
	end

	get :show do
	end

	get :edit do
	end
end
