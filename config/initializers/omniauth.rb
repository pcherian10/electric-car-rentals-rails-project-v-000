OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '123557327753-tatmq47mn8s092b4sllsjg55l01j1cvr.apps.googleusercontent.com', 'F6IjLWBRSMMsHEQ7zOYKbK6j', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
