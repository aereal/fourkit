class Revision
  include MongoMapper::Document

  # key <name>, <type>
  key :body, Body
  timestamps!
end
