class Eta < ActiveRecord::Base
    validates :time, numericality: {greater_than: 0, message: "ups car in front of u" }
    validates :time, numericality: {less_than: 1000, message: "no cars near u" }
end
