Factory.define(:song) do |s|
  s.name "House Dog Party Favor"
  s.pt_nickname "House Dog"
  s.author "The Disco Biscuits"
  s.pt_id 37
  s.estimated_duration 11
  s.band_rank 2
  s.fan_rank 2
end


Factory.define(:show) do |s|
  s.pt_id 1167
  s.association :venue
  s.date Date.parse("Saturday, October, 10, 2009")
end

Factory.define(:set_list) do |sl|
end

Factory.define(:song_performance) do |sp|
  sp.association :song
  sp.association :set_list
end

Factory.define(:venue) do |v|
  v.name "Calvin Theatre"

end

Factory.define(:tour) do |t|
  t.name "Fall Tour 2009"
  t.pt_id 39
end