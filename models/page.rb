class Page
  include MongoMapper::Document

  # key <name>, <type>
  key :title, String
  key :body, String
  key :parent_id, ObjectId
  timestamps!
end
