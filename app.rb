require "cuba"
require "mote"
require "mote/render"
require "ohm"
require "scrivener"
require "shield"

Ohm.redis = Redic.new("redis://127.0.0.1:6379")

Cuba.plugin(Mote::Render)
Cuba.plugin(Shield::Helpers)

Dir["./models/**/*.rb"].each { |f| require(f) }
Dir["./filters/**/*.rb"].each { |f| require(f) }
Dir["./routes/**/*.rb"].each { |f| require(f) }

Cuba.use Rack::Session::Cookie,
  key: "migraine",
  secret: "e357845bb2856de2f7e7ba5aff8dd5cd02167ab9c26df4a90cabe6f84f8e9190"

Cuba.use Rack::Static,
  urls: %w[/js /css /img],
  root: File.expand_path("./public", __dir__)

Cuba.define do
  on authenticated(User) do
    run(Users)
  end

  on default do
    run(Guests)
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

  on("outputs") do
    render("outputs/new", title: "outputs")
  end
end
