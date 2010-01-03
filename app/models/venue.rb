class Venue < ActiveRecord::Base
  has_many :shows
  has_many :songs,  :through => :shows
  validates_uniqueness_of :pt_id
  acts_as_mappable
  before_validation_on_create :geocode_address

  def self.find_or_create_by_pt_id(id)
    find_by_pt_id(id) || create_by_pt_id(id)
  end

  def address
    "#{city}, #{state}"
  end

  def self.create_by_pt_id(id)
    pt_data = PhantasyTour.new.venue_info_from_id(id)

    venue = new
    venue.name = pt_data[:name]
    venue.pt_id = pt_data[:pt_id]
    venue.city = pt_data[:city]
    venue.state = pt_data[:state]
    venue.save!
    venue
  end

  def to_json(opts = {})
    opts.merge!(:except =>[:created_at, :updated_at, :pt_id])
    super(opts)
  end

  private
  def geocode_address
      geo=Geokit::Geocoders::MultiGeocoder.geocode(address)
      #errors.add(:address, "Could not Geocode address") if !geo.success
      self.lat, self.lng = geo.lat,geo.lng if geo.success
    end

end
