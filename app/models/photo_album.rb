require 'picasa'
class PhotoAlbum < ActiveRecord::Base
  has_many :photos
  belongs_to :show
  belongs_to :venue
  before_create :process_photos, :process_show, :process_venue
  validates_uniqueness_of :picasa_id

  named_scope :with_photos, {:include => :photos}

  def self.sync_from_picasa
    albums = Picasa.albums(:google_user => PICASA_USER)
    albums.each do |album|
      PhotoAlbum.find_or_create_from_picasa(album)
    end
  end

  def self.find_or_create_from_picasa(album)
    album.merge!(parse_picasa_title(album[:title]))
    PhotoAlbum.find_or_create_by_picasa_id(:picasa_id => album[:id], :title => album[:title],
                                           :photo => album[:photo], :thumbnail => album[:thumbnail],
                                           :credit => album[:credit], :date  => album[:date])
  end

  def self.parse_picasa_title(title)
    rtr = {}
    rtr[:credit] = title.slice!(/\(.+\)/).gsub("(", "").gsub(")", "")
    rtr[:date] = Date.parse(title.slice!(Date.parse(title).to_s))
    rtr[:title] = title.gsub(" - ", "").strip
    rtr
  end

  def photos_from_picasa
    begin
      @album_photos ||= Picasa.photos(:google_user => PICASA_USER, :album_id => picasa_id)[:photos]
    rescue
      []
    end
  end

  def photos_json
    photos_hash.to_json.to_a.pack("m")
  end

  def photos_hash
    photos.collect{|photo| {:photo => photo.photo, :thumbnail => photo.thumbnail, :title => photo.title}}
  end

  def photo_count
    photos.count
  end

  def to_json(opts = {})
    opts.merge!(:methods =>[:photos_json], :except =>[:picasa_id, :created_at, :updated_at])
    super(opts)
  end


  private

  def process_photos
    photos_from_picasa.each { |photo| self.photos << Photo.find_or_initialize_by_photo(photo) }
  end

  def process_show
    self.show = Show.find_by_date(date)
  end

  def process_venue
    self.venue = show.try(:venue)
  end

end
