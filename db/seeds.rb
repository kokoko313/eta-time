Car.destroy_all
Eta.destroy_all
#
car_pos = Geocoder.coordinates("Moscow,Russia")
driver_name = ['nick','mike','coco','pepe']
car_model = ['audi','porshe','bmw','horse']
#add sm cars in mow to db
# 100.times do
# a=rand(-999..999).to_f/10000

# Car.create(driver: driver_name.sample, available: [true, false].sample, model: car_model.sample,  longitude: car_pos[0]+a , latitude: car_pos[1]+a)

# end

#Test
Car.create(available: true, longitude: 1 , latitude: 1)
Car.create(available: true, longitude: 1 , latitude: 1)
Car.create(available: true, longitude: 1 , latitude: 1)
Car.create(available: true, longitude: 1 , latitude: 4)