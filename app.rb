require "bundler/setup"
require "yaml"

Bundler.require

DEFAULT_TYPES = YAML.load_file("./config/default_types.yml")

Ohm.redis = Redic.new(ENV["REDIS_URL"])

Malone.connect(url: ENV["SMTP_URL"], tls: true, domain: "migraine.io")

Cuba.plugin(Mote::Render)
Cuba.plugin(Shield::Helpers)

Dir["./models/**/*.rb"].each { |f| require(f) }
Dir["./filters/**/*.rb"].each { |f| require(f) }
Dir["./services/**/*.rb"].each { |f| require(f) }
Dir["./routes/**/*.rb"].each { |f| require(f) }
Dir["./helpers/**/*.rb"].each { |f| require(f) }

Cuba.plugin(Helpers)

Cuba.use Rack::Session::Cookie,
  key: "migraine",
  secret: ENV["SECRET"]

Cuba.use Rack::Static,
  urls: %w[/js /css /img],
  root: File.expand_path("./public", __dir__)

Cuba.define do
  on(root) do
    render("index", title: "Migraine.io")
  end

  on current_user do
    run(Users)
  end

  on default do
    run(Guests)
  end
end
