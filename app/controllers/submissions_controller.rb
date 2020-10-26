include Response

class SubmissionsController < ApplicationController
  def create
    @submission = Submission.new(submission_params)
    if @submission.save
      json_response({'message': 'Slogan saved successfully', 'data': @submission}, :created)
    else
      json_response({'errors': @submission.errors.full_messages}, 400)
    end
  end

  def submission_params
    params.permit(:first_name, :last_name, :email_address, :slogan)
  end
end
