class Submission < ApplicationRecord
  # validations
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email_address
  validates_presence_of :slogan
  validates_uniqueness_of :email_address
  validates_length_of :slogan, minimum: 2
  validates_length_of :slogan, maximum: 50
end
