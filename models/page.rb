class Page
	include MongoMapper::Document

	# key <name>, <type>
	key  :title, String
	many :revisions
	timestamps!
end
