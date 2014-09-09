class Types < Cuba
  define do
    on("new") do
      render("types/new", title: "New Type")
    end

    on("edit") do
      render("types/edit", title: "Edit Type")
    end

    on post, param("type") do |params|
      create_type = CreateType.new(params)
      if create_type.valid?
        Type.create(create_type.slice(:category, :name))
        res.redirect("/types")
      end
    end

    on("types/new") do
      on post, params("type") do |params|
        create_type = CreateType.new(params)
        Type.create(category: type_attributes["category"], name: type_attributes["name"], user_id: user.id)
      end

    end

    on default do
      render("types", title: "Types", user: current_user)
    end
  end
end
