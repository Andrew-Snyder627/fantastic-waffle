class Park
    attr_reader :name, :admission_price, :vehicles

    def initialize(name, admission_price)
        @name = name
        @admission_price = admission_price
        @vehicles = []
    end

    def admit_vehicle(vehicle)
        @vehicles << vehicle
    end

    def all_passengers
        passengers = []

        @vehicles.each do |vehicle| # Could have used flatten/map but wanted to try the nested iteration
            vehicle.passengers.each do |passenger|
                passengers << passenger
            end
        end

        passengers
    end

    def revenue
        adults = all_passengers.select do |passenger| # Trying to use do/end notation for my enums from now on per Mike
            passenger.adult?
        end
        
        adults.count * @admission_price
    end

    def passenger_names
        sorted_passengers = all_passengers.map do |passenger|
            passenger.name
        end

        sorted_passengers.sort
    end

    def minors
        minors = all_passengers.select do |passenger|
            !passenger.adult?
        end

        minors_names = minors.map do |minor|
            minor.name
        end

        minors_names.sort
    end

    def adults
        adults = all_passengers.select do |passenger|
            passenger.adult?
        end

        adults_names = adults.map do |adult|
            adult.name
        end

        adults_names.sort
    end
end