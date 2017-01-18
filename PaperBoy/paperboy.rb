# Every day, each paperboy is given a house number to start at and a house number to finish at. They get paid $0.25 for every paper they deliver and $0.50 for every paper over their quota. If at the end of the day they haven't met their quota, they lose $2.
# The minimum number of papers to deliver is 50.

class Paperboy

  # Each paperboy should have several attributes:
  # Name
  # Experience (the number of papers they've delivered)
  # Earnings (amount of money they've earned) This needs to be read-only!

  attr_accessor :name, :experience
  attr_reader :earnings

  def initialize(name)
    @name = name
    @experience = 0
    @earnings = 0
  end

  # quota
  # This method should calculate and return the paperboy's quota for his next delivery.
  # The quota is calculated as half of your experience added to the minimum.
  # So the first time a paperboy makes a delivery, the quota is 50.
  # The next time, the quote is 50 plus half the number of papers that the paperboy has delivered in the past. In this way the quota should increase after every delivery the paperboy makes.
  def quota
    minimum = 50
    @experience / 2 + minimum
  end
  # deliver(start_address, end_address)
  # This method will take two house numbers and return the amount of money earned on this delivery as a floating point number. It should also update the paperboy's experience!
  # Let's assume that the start_address is always a smaller number than the end_address
  # As a stretch exercise you can figure out how to ensure it still works if the above assumption isn't met!
  def deliver(start_address, end_address)
    q = quota

    paper_deliver = end_address - start_address + 1
    # puts "experience: #{@experience}"
    # puts "paper deliver: " + paper_deliver.to_s
    @experience += paper_deliver

    if paper_deliver >= q
      @earnings = q * 0.25 + ( paper_deliver - q ) * 0.5 + @earnings
      return q * 0.25 + ( paper_deliver - q ) * 0.5
    else
      @earnings = paper_deliver * 0.25 - 2 + @earnings
      return paper_deliver * 0.25 - 2
    end
  end

  # report
  # This method should return a string about the paperboy's performance
  # e.g. "I'm Tommy, I've delivered 90 papers and I've earned $38.25 so far!"
  def report
    "I'm #{@name}, I've delivered #{@experience} papers and I've earned $#{@earnings} so far!"
  end
end

tommy = Paperboy.new("Tommy")

p tommy.quota # => 50
p tommy.deliver(101, 160) # => 17.5
p tommy.earnings #=> 17.5
p tommy.report # => "I'm Tommy, I've delivered 60 papers and I've earned $17.5 so far!"

p tommy.quota # => 80
p tommy.deliver(1, 75) # => 16.75
p tommy.earnings #=> 34.25
p tommy.report # => "I'm Tommy, I've been delivered 135 papers and I've earned $34.25 so far!"
