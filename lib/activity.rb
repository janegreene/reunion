class Activity
  attr_reader :name, :participants
  def initialize(activity_name)
    @name = activity_name
    @participants = {}
  end

  def add_participant(name, cost)
    @participants[name] = cost
  end

  def total_cost
    @participants.values.sum
  end

  def split
    total_cost / @participants.count
  end

  def owed
    @participants.transform_values { |v| split - v }
  end

end
