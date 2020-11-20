require 'rails_helper'

RSpec.describe Submission, type: :model do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:slogan) }
  it { should validate_presence_of(:email_address) }
  it { should validate_uniqueness_of(:email_address) }
  it { should validate_length_of(:slogan) }
end
