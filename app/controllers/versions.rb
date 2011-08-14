WikiPs.controllers :versions, :map => 'pages/:title' do
	get :index do
		@page = Page.first(:title => params[:title], :order => :created_at.desc)
		render 'versions/index'
	end

	get :show do
	end
end
