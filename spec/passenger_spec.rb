require './lib/passenger'

# This block helps format the test results
RSpec.configure do |config|
  config.formatter = :documentation
end

# Your tests should start here!
RSpec.describe Passenger do 

    it 'exists' do
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})

      expect(charlie).to be_a(Passenger)
      expect(taylor).to be_a(Passenger)
    end

    it 'can assign attributes' do
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})

      expect(charlie.name).to eq("Charlie")
      expect(charlie.age).to eq(18)

      expect(taylor.name).to eq("Taylor")
      expect(taylor.age).to eq(12)
    end

    it 'can determine if passenger is adult' do
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})

      expect(charlie.adult?).to be true
      expect(taylor.adult?).to be false
    end

    it 'can determine if passenget is a driver' do
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})

      expect(charlie.driver?).to be false

      charlie.drive
      
      expect(charlie.driver?).to be true
    end
end