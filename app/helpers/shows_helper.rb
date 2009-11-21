module ShowsHelper

  def show_text(show)
    "#{show.date}" + (show.venue ? " #{show.venue.name}, #{show.venue.city} #{show.venue.state}" : "")
  end
end
