module Api::V1
  class EtaController < ApiController

    def index
    #fix my position 
    my_loc=[1,2]

    #searching radius
    radius=5
    #searching for 3 nearest car 
    @cars=[]
    while @cars[2].nil?
      radius +=5
      @cars = Car.where(available: true).near(my_loc,radius,:units => :km).first(3)
      break if radius == 1000
    end
    #creating arr with 3 harv_distance values 
    arr=[]
    @cars.each do |car|
      arr << Geocoder::Calculations.distance_between(my_loc, [car.latitude,car.longitude],:units => :km)*1.5  
    end
    #calc avrg time
    if arr.size < 3
      render json: {time:'couldnt count ETA correctly (less than 3 car near u)'}
      else
      res = arr.sum/arr.size
      #save in db
      @eta = Eta.new(time: res.round(2))
        if @eta.save
          render json: @eta
        else
          render json: @eta.errors
        end
        end
    end
  end
end