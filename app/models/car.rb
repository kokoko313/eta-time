class Car < ActiveRecord::Base
    geocoded_by :address
end
