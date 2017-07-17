class ApplicationController < ActionController::API
  include Response


rescue_from ActiveRecord::RecordNotFound do |exception|
  json_response({ message: exception.message }, :not_found, :unprocessable_entity)
end

end
