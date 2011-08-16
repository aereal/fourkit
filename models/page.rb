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
end
