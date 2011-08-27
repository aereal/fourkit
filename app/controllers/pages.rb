FourKit.controllers :pages do
	get :index, :map => '/' do
		@pages = Page.all(order: :created_at.desc)
		render 'pages/index'
	end

	get :show, :map => '/:title' do
		@page = Page.find_by_title(params[:title]) or halt 404
		render 'pages/show'
	end

	get :edit, :map => '/:title/edit' do
		@page = Page.find_by_title(params[:title]) or halt 404
		render 'pages/edit'
	end
end
