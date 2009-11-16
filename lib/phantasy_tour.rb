class PhantasyTour


  def song_info_from_id(id)
    url = base_url + "/songs.cgi?songID=#{id}"
    song_info_from_url(url)
  end

  def song_info_from_url(url)
    info = {}
    page = agent.get(url)
    doc = page.parser
    item = doc.search("//td[contains(text(), 'Song Details')]/../../tr[2]/td")
    info[:pt_id] = url.split("=").last.to_i
    info[:name] = (item/"b").inner_text
    info[:original] = (item/"i").inner_text == "original song"
    info_box = item.inner_html.gsub("\n", "").split("<br>")
    info_box.each do |box|
      info[:pt_nickname] = box.gsub("PT nickname: ", "") if box.include?("PT nickname")
      info[:author] = box.gsub("Written by: ", "") if box.include?("Written by:")
    end
    info
  end

  def show_info_from_id(id)
    url = base_url + "/shows.cgi?showID=#{id}"
    show_info_from_url(url)
  end

  def show_info_from_url(url)
    info = {}
    page = agent.get(url)
    doc = page.parser
    item = doc.search("//td[contains(text(), 'Show Details')]/../../tr[2]/td")
    info[:pt_id] = url.split("=").last.to_i
    bold_items = (item/"b")
    bold_items.shift if bold_items.inner_text.include?("CANCEL")
    info[:date] = Date.parse(bold_items.shift.try(:inner_text))
    info[:show_name] = bold_items.shift.try(:inner_text)
    links = (item/"a")
    links.each do |link|
      if link.attribute("href").value.include?("tours.cgi?tourID=")
        info[:tour_name] = link.inner_text
        info[:pt_tour_id] = link.attribute("href").value.gsub("tours.cgi?tourID=", "").to_i
      elsif link.attribute("href").value.include?("venues.cgi?venueID=")
        info[:venue_name] = link.inner_text
        info[:pt_venue_id] = link.attribute("href").value.gsub("venues.cgi?venueID=", "").to_i
      else
        info[:show_name] = link.inner_text.strip
        info[:show_link] = link.attribute("href").value
      end
    end


    #SETLIST
    setlist = doc.search("//td[contains(text(), 'Setlist')]/../../tr[2]/td")
    index = 0
    setlists = []
    notes = {}
    set_list_node = (setlist/"span").last
    set_list_node && set_list_node.children.each do |itm|
      current_song = setlists.last && setlists.last[:songs].last
      if itm.text?
        item_text = itm.to_s.gsub("\n", "").strip
        next if item_text.blank?
        current_song[:segue] = true if item_text.include?('&gt;')
        current_song[:segue] = false if item_text.include?(',')
      else
        if itm.name == "b"
          setlists << {:name => itm.inner_text, :songs => []}
        elsif itm.name == "a"
          setlists.last[:songs] << {:pt_song_id => itm.attribute("href").value.gsub("songs.cgi?songID=", "").to_i,
                                  :name => itm.inner_text, :segue => false, :notes => [], :note_numbers => []}
        elsif itm.name == "sup"
          unless (itm.next.text? && itm.next.next.respond_to?(:name) && itm.next.next.name == "br")
            current_song[:note_numbers] << itm.inner_text.strip.to_i
          else
            notes[itm.inner_text.strip.to_i] = itm.next.inner_text.strip
          end
        end
      end
    end
    setlists.each {|setlist| setlist[:songs].each { |song| song[:note_numbers].each {|value| song[:notes] << notes[value] } }}
    info[:show_setlist] = setlists
    info
  end

  def venue_info_from_id(id)
    url = base_url + "/venues.cgi?venueID=#{id}"
    venue_info_from_url(url)
  end

  def venue_info_from_url(url)
    info = {}
    page = agent.get(url)
    doc = page.parser
    item = doc.search("//td[contains(text(), 'Venue Details')]/../../tr[2]/td")
    info[:pt_id] = url.split("=").last.to_i
    info[:name] = (item/"b").inner_text
    #addy = (item/"td[2]").inner_text.gsub(",", "").split("\n").collect{|de| de unless de.blank?}.compact
    links = (item/"td[2]/a")
    links.each do |link|
      if link.attribute("href").to_s.include?("cities")
        info[:city] = link.inner_text
      elsif link.attribute("href").to_s.include?("states")
        info[:state] = link.inner_text
      elsif link.inner_text.include?("MAP")
        info[:map] = link.attribute("href").to_s
      else
        info[:website] = link.inner_text
      end
    end
    info
  end

  def tour_info_from_id(id)
    url = base_url + "/tours.cgi?tourID=#{id}"
    tour_info_from_url(url)
  end

  def tour_info_from_url(url)
    info = {}
    page = agent.get(url)
    doc = page.parser
    tour = doc.search("//p[@class='heading1']")
    info[:name] = tour.inner_text
    info[:pt_id] = url.split("=").last.to_i
    info

  end

  private

  def base_url
    "http://www.phantasytour.com/bisco"
  end

  def agent
    @agent ||= set_agent
  end

  def set_agent
    agentr = WWW::Mechanize.new
    agentr.user_agent_alias = "Windows IE 6"
    agentr
  end
end