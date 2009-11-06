class Venue < ActiveRecord::Base
  has_many :shows
  has_many :songs,  :through => :shows
  validates_uniqueness_of :pt_id


  def self.find_or_create_by_pt_id(id)
    find_by_pt_id(id) || create_by_pt_id(id)
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
end
