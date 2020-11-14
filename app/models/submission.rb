class Submission < ApplicationRecord
  # validations
  validates_presence_of :first_name, :last_name, :email_address, :slogan, message: 'is required'
  validates_uniqueness_of :email_address, message: 'already submitted a slogan'
  validates_length_of :slogan, minimum: 2, message: 'can not be less than 2 characters'
  validates_length_of :slogan, maximum: 50, message: "can not be more than 50 characters"
end
