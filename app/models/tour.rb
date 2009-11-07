class Tour < ActiveRecord::Base
  has_many :shows

  validates_presence_of :name
  validates_uniqueness_of :pt_id

  def self.find_or_create_by_pt_id(id)
    pt_data = PhantasyTour.new.tour_info_from_id(id)

    tour = new
    tour.name = pt_data[:name]
    tour.pt_id = pt_data[:pt_id]
    tour.save!
    tour
  end
end
