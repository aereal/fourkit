WikiPs.controllers :pages do
	get :index do
		@pages = Page.all(:order => :created_at.desc).uniq(&:title)
		render 'pages/index'
	end

	get :show, :with => :title do
		@page = Page.first(:title => params[:title], :order => :created_at.desc)
		render 'pages/show'
	end

	get :edit do
	end
end
