class EtaController < ApplicationController
  def time
    my_loc=[37.6173, 55.755826]
    radius=1

    @cars = Car.where(available: true).near(my_loc,radius).first(3)

    # @tasks = Task.near("Moscow,Russia",10)
    # Geocoder::Calculations.distance_between(my_loc, [40.748433,-73.985655])
    @arr=[]
    @cars.each do |car|
      car_pos =[]
      car_pos << car.latitude 
      car_pos << car.longitude
      @arr << Geocoder::Calculations.distance_between(my_loc, car_pos)*1.5  
    end

    # @arr.sort.first(3).sum
    @res = @arr.sum/3

    @eta = Eta.new(time: @res)
    @eta.save
    render json: @eta

  end
end
