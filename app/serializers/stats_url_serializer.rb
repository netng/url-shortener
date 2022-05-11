class StatsUrlSerializer < ActiveModel::Serializer
  attributes :startDate, :lastSeenDate, :redirectCount

  def include_lastSeenDate?
    object.redirectCount != 0 
  end

end
