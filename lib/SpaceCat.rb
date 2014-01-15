class SpaceCat
  include DataMapper::Resource
  property :id, Serial
  property :name, String, :required => true
  property :home_planet,  Text
  property :tagline,      String
  property :superpower,   String
  property :created_at,   DateTime
  property :updated_at,   DateTime 
end
