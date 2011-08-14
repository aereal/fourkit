MongoMapper.connection = Mongo::Connection.new('localhost', nil, :logger => logger)

case Padrino.env
  when :development then MongoMapper.database = 'wiki_ps_development'
  when :production  then MongoMapper.database = 'wiki_ps_production'
  when :test        then MongoMapper.database = 'wiki_ps_test'
end
