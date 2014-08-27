class Users < Cuba
  define do
    on("dashboard") do
      render("dashboard", title: "Dashboard")
    end

    on("sign_out") do
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
        render("types/index", title: "Types", types: Type.all)
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
      render("outputs/new", title: "Outputs")
    end

    on("profile") do
      on post, param("user") do |params|

        update_profile = UpdateProfile.new(params)
        update_profile.current_email = current_user.email

        on update_profile.valid? do
          user       = current_user
          user.name  = update_profile.name
          user.email = update_profile.email
          user.save
          res.redirect("/profile")
        end

        on default do
          update_password = UpdatePassword.new({})

          render("profile/edit", title: "Edit Profile",
                        update_profile: update_profile,
                       update_password: update_password)
        end
      end

      on("edit") do
        update_profile = UpdateProfile.new(name: current_user.name, email: current_user.email)
        update_password = UpdatePassword.new({})
        render("profile/edit", title: "Edit Profile",
                      update_profile: update_profile,
                     update_password: update_password)
      end

      on get do
        render("profile/show", title: "Profile", current_user: current_user)
      end
    end
  end
end
