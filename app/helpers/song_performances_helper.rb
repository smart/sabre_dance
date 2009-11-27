module SongPerformancesHelper

  def song_performance_for_set_list(sp)
    (sp.tag_list.any?{|tag| tag =~ /nvert/} ? "<b>[X] </b>" : "") + "#{sp.song.name}#{sp.segue? ? " >" : ","}" + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"font-size: 75%;\">" + (sp.tag_list.reject{|de| de =~ /nvert/} + [sp.notes]).compact.join(", &nbsp;") +  "</span>"
  end
end
