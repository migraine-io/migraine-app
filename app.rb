require "cuba"
require "mote"
require "mote/render"
require "ohm"
require "scrivener"

Ohm.redis = Redic.new("redis://127.0.0.1:6379")

Cuba.plugin(Mote::Render)

Dir["./models/**/*.rb"].each { |f| require(f) }
Dir["./filters/**/*.rb"].each { |f| require(f) }

Cuba.use Rack::Static,
  urls: %w[/js /css /img],
  root: File.expand_path("./public", __dir__)

Cuba.define do
  on(root) do
    render("index", title: "Home")
  end

  on("dashboard") do
    render("dashboard", title: "Dashboard")
  end

  on("inputs") do
    on("new") do
      render("inputs/new", title: "New Input", types: Type.all.to_a)
    end

    on get do
      render("inputs/index", title: "Inputs", inputs: Input.all.to_a)
    end
  end

  on("types") do
    on("new") do
      render("types/new", title: "New Type")
    end

    on get do
      render("types/index", title: "Types", types: Type.all.to_a)
    end

    on post, param("type") do |params|
      create_type = CreateType.new(params)

      if create_type.valid?
        Type.create(create_type.slice(:category, :name))
        res.redirect("/types")
      end
    end
  end

#   on("login") do
#     render("login", title: "Login")
#   end
#
#   on("user") do #if ruta == user
#     on post, param("user") do |params| #if method == "POST"
#       sign_up = SignUp.new(params)
#
#       if sign_up.valid?
#         User.create(sign_up.slice(:name, :email, :password))
#         res.redirect("/user_submit")
#       end
#     end
#
#     on default do
#       render("user", title: "User")
#     end
#   end
#
#   on("inputs") do
#     render("inputs", title: "inputs")
#   end
#
# on("outputs") do
#   render("outputs", title: "outputs")
# end
#
#   on("dashboard") do
#     render("dashboard", title: "Dashboard")
#   end
#
#   on("user_submit") do
#     render("user_submit", title: "user_submit")
#   end

end
