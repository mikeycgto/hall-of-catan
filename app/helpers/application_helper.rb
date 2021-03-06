module ApplicationHelper
  def date_ago_in_words(date)
    diff = Date.current <=> date

    if diff.abs > 0
      "#{distance_of_time_in_words(Date.current, date)} ago"
    else
      'today'
    end
  end
  
  def options_from_hash(hash)
    hash.collect { |k, v| [v, k] }
  end
end
