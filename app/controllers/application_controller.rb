class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes
  private

  def authenticate_admin!
    authenticate_or_request_with_http_basic("Golden Pot Store Admin") do |username, password|
      expected_username = ENV["ADMIN_USERNAME"].presence
      expected_password = ENV["ADMIN_PASSWORD"].presence

      expected_username.present? && expected_password.present? &&
        ActiveSupport::SecurityUtils.secure_compare(Digest::SHA256.hexdigest(username), Digest::SHA256.hexdigest(expected_username)) &&
        ActiveSupport::SecurityUtils.secure_compare(Digest::SHA256.hexdigest(password), Digest::SHA256.hexdigest(expected_password))
    end
  end
end
