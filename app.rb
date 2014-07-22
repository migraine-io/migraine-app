require "cuba"
require "mote"
require "mote/render"

Cuba.plugin(Mote::Render)

Cuba.use Rack::Static,
  urls: %w[/js /css /img],
  root: File.expand_path("./public", __dir__)

Cuba.define do
  on(root) do
    render("index", title: "Hola")
  end

  on("login") do
    render("login", title: "Login")
  end

  on("user") do
    render("user", title: "User")
  end

  on("inputs") do
    render("inputs", title: "Inputs")
  end

  on("outputs") do
    render("outputs", title: "Outputs")
  end

  on("dashboard") do
    render("dashboard", title: "Dashboard")
  end

end
