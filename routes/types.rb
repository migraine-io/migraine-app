class Types < Cuba
  define do
    on("new") do
      render("types/new", title: "New Type")
    end

    on post, param("type") do |params|
      create_type = CreateType.new(params)
      if create_type.valid?
        Type.create(create_type.slice(:category, :name))
        res.redirect("/types")
      end
    end

    on default do
      render("types/edit", title: "Edit Types", user: current_user)
    end
  end
end
