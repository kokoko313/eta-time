module Api::V1
  class EtaController < ApiController

    def index
    #fix my position
    my_loc=[37.6173, 55.755826]
    #
    radius=10

    @cars = Car.where(available: true).near(my_loc,radius,:units => :km).first(3)
    # @tasks = Task.near("Moscow,Russia",10)
    # Geocoder::Calculations.distance_between(my_loc, [40.748433,-73.985655])
   
    @arr=[]
    @cars.each do |car|
      car_pos =[]
      car_pos << car.latitude 
      car_pos << car.longitude
      @arr << Geocoder::Calculations.distance_between(my_loc, car_pos,:units => :km)*1.5  
    end
    
    # @arr.sort.first(3).sum

    if @arr[0].nil?
     @eta = Eta.new(time: 9999)
     else
      @res = @arr.sum/@arr.size
      @eta = Eta.new(time: @res)
      @eta.save
    #   else

     end
    render json: @eta

  end
  
end
end
  
  
