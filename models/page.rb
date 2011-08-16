class Page
	include MongoMapper::Document

	# key <name>, <type>
	key  :title, String
	many :revisions, class_name: 'Revision'
	timestamps!

	def revise(attrs)
		Revision.new(attrs.merge(created_at: Time.now)).tap do |rev|
			self.revisions << rev
			self.save
		end
	end

	def latest_revision
		self.revisions.sort_by(&:created_at).first
	end
	alias_method :latest, :latest_revision

	def body
		self.latest_revision.body
	end

	def revised_at
		self.latest_revision.created_at
	end
end
