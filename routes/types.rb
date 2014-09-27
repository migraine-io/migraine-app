class Types < Cuba
  define do
    on("new") do
      render("types/new", title: "New Type")
    end

    on(":id") do |id|
      type = Type[id]

      on post, param("type") do |params|
        type.update(category: params["category"], name: params["name"])
        res.redirect("/types")
      end

      on get do
        render("types/edit", title: "Types Edit", type: type)
      end

      on "delete", post do
        type.delete

        res.redirect("/types")
      end
    end

    on post, param("type") do |params|
      Type.create(category: params["category"], name: params["name"], user_id: current_user.id)
      res.redirect("/types")
    end

    on default do
      render("types/index", title: "Types", user: current_user)
    end
  end
end
