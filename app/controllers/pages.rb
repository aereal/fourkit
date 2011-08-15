WikiPs.controllers :pages do
	get :index, :map => '/' do
		@pages = Page.all(:order => :created_at.desc).uniq(&:title)
		render 'pages/index'
	end

	get :show, :map => '/:title' do
		@page = Page.first(:title => params[:title], :order => :created_at.desc) or
			halt 404
		render 'pages/show'
	end

	get :edit, :map => '/:title/edit' do
		@page = Page.first(:title => params[:title], :order => :created_at.desc) or
			halt 404
		render 'pages/edit'
	end
end
