WikiPs.controllers :revisions, :map => '/:title' do
	get :index do
		@page = Page.find_by_title(params[:title])
		render 'revisions/index'
	end

	get :show, :map => ":id" do
		@page = Page.find_by_title(params[:title])
		@revision = @page.revisions.find(params[:id])
		render 'revisions/show'
	end

	get :fork, :map => ':id/fork' do
		@page = Page.find_by_title(params[:title])
		@revision = @page.revisions.find(params[:id])
		render 'revisions/fork'
	end

	post :create do
		if @page = Page.create(params[:page].merge(:parent => Page.find(params[:parent_id])))
			flash[:notice] = "#{@page.title} was successfully posted."
			redirect url_for(:versions, :show, :title => @page.title, :id => @page.id)
		else
			halt 500
		end
	end
end
