class Eta < ActiveRecord::Base
    validates :time, numericality: {greater_than: 0}
end
