class Prediction < ActiveRecord::Base
  belongs_to :user

  validates_numericality_of :predicted_value
end
