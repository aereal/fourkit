FourKit.controllers :revisions, :map => '/:title' do
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
		@page = Page.find_by_title(params[:title])
		parent = @page.revisions.find(params[:revision][:parent_id])
		if rev = @page.revise(parent: parent, body: params[:revision][:body])
			flash[:notice] = "#{@page.title} was successfully updated."
			redirect url_for(:revisions, :show, :title => @page.title, :id => rev.id)
		end
	end
end
