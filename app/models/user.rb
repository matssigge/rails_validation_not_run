class User < ActiveRecord::Base
  has_many :predictions

  accepts_nested_attributes_for :predictions
end
