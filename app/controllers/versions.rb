WikiPs.controllers :versions, :map => '/:title' do
	get :index do
		@page = Page.first(:title => params[:title], :order => :created_at.desc)
		render 'versions/index'
	end

	get :show, :map => ":id" do
		@page = Page.find(params[:id])
		render 'versions/show'
	end
end
