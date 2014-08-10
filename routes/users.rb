class Users < Cuba
  define do
    on("dashboard") do
      render("dashboard", title: "Dashboard")
    end

    on("logout") do
      logout(User)
      res.redirect("/")
    end

    on("inputs") do
      run(Inputs)
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
end
