class Revision
	include MongoMapper::EmbeddedDocument
	plugin MongoMapper::Plugins::IdentityMap

	# key <name>, <type>
	key :parent_id, ObjectId
	key :body, String
	key :created_at, Time

	belongs_to :parent, :class_name => :Revision

	def children
		self.class.where(parent_id: self.id)
	end
end
