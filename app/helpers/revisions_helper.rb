# Helper methods defined here can be accessed in any controller or view in the application

FourKit.helpers do
	def show_revision_url(obj_or_params, opts={})
		id, title = obj_or_params.kind_of?(Hash) ?
			[obj_or_params[:id], obj_or_params[:page]] :
			[obj_or_params.id, obj_or_params.page.title]
		url_for(:revisions, :show, opts.merge(id: id, title: title))
	end
	alias_method :show_rev_url, :show_revision_url

	def edit_revision_url(obj_or_params, opts={})
		id, title = obj_or_params.kind_of?(Hash) ?
			[obj_or_params[:id], obj_or_params[:page]] :
			[obj_or_params.id, obj_or_params.page.title]
		url_for(:revisions, :edit, opts.merge(id: id, title: title))
	end
	alias_method :edit_rev_url, :edit_revision_url

	def fork_revision_url(obj_or_params, opts={})
		id, title = obj_or_params.kind_of?(Hash) ?
			[obj_or_params[:id], obj_or_params[:page]] :
			[obj_or_params.id, obj_or_params.page.title]
		url_for(:revisions, :fork, opts.merge(id: id, title: title))
	end
	alias_method :fork_rev_url, :fork_revision_url
end
