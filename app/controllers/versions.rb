WikiPs.controllers :versions, :map => '/:title' do
	get :index do
		@page = Page.first(:title => params[:title], :order => :created_at.desc)
		render 'versions/index'
	end

	get :show, :map => ":id" do
		@page = Page.find(params[:id])
		render 'versions/show'
	end

	post :create do
		if @page = Page.create(params[:page])
			flash[:notice] = "#{@page.title} was successfully posted."
			redirect url_for(:versions, :show, :title => @page.title, :id => @page.id)
		else
			halt 500
		end
	end
end
