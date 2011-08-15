class Page
	include MongoMapper::Document
	plugin MongoMapper::Plugins::IdentityMap

	# key <name>, <type>
	key :title, String
	key :body, String
	key :parent_id, ObjectId
	timestamps!

	belongs_to :parent, :class_name => :Page

	scope :titles, all.uniq(&:title)

	def versions
		self.class.where(:title => self.title)
	end

	def children
		self.class.where(:parent_id => self.id)
	end

	def descendant
		self.children.map {|child| [child, child.descendant] }
	end
end
