class Reunion
  attr_reader :name, :activities
  def initialize(name)
    @name = name
    @activities = []
  end

  def add_activity(activity_object)
    @activities << activity_object
  end

  def total_cost
    @activities.sum {|activity| activity.total_cost }
  end

  def breakout
    breakdown = Hash.new(0)
    @activities.each do |activity|
      activity.owed.each do |name, amount|
        breakdown[name] += amount
      end
    end
    breakdown
  end

  def summary
    summarized = ""
    breakout.each do |k , v|
      summarized.concat("#{k}: #{v}")
      summarized.concat("\n") if v != breakout.values.last
    end
    summarized
  end

end
