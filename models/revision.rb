class Revision
	include MongoMapper::EmbeddedDocument

	# key <name>, <type>
	key :body, String
	key :created_at, Time

	embedded_in :page
	belongs_to :parent, :class_name => 'Revision'
end
