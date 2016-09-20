module Api::V1
  class EtaController < ApiController

    def index
    #fix my position 
    my_loc=[37.6173, 55.755826]
    #searching radius
    radius=5
    #searching for 3 nearest car
    @cars=[]
    while @cars[2].nil?
      radius +=5
      @cars = Car.where(available: true).near(my_loc,radius,:units => :km).first(3)
    end
    #creating arr with 3 harv_distance values 
    @arr=[]
    @cars.each do |car|
      car_pos =[]
      car_pos << car.latitude 
      car_pos << car.longitude
      @arr << Geocoder::Calculations.distance_between(my_loc, car_pos,:units => :km)*1.5  
    end
    #calc avrg time
    res = @arr.sum/@arr.size
    #save in db
    @eta = Eta.new(time: res)
    if @eta.save
      render json: @eta
      else
      render json: @eta.errors
      end
  
  end
  
end
end
  
  
