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
    full_address || "#{city}, #{state}"
  end

  def set_pt_info
    self.name = pt_info[:name]
    self.pt_id = pt_info[:pt_id]
    self.city = pt_info[:city]
    self.state = pt_info[:state]
    self.full_address = pt_info[:full_address]
  end

  def self.create_by_pt_id(id)
    venue = new(:pt_id => id)
    venue.set_pt_info
    venue.save!
    venue
  end

  def update_pt_info
    self.set_pt_info
    geocode_address
    self.save
  end

  def pt_info
   @pt_info ||= PhantasyTour.new.venue_info_from_id(pt_id)
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
