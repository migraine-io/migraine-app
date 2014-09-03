class Profile < Cuba
  define do
    on post, param("user") do |params|
      update_profile = UpdateProfile.new(params)
      update_profile.current_email = current_user.email

      on update_profile.valid? do
        attributes = update_profile.attributes
        attributes.delete(:current_email)

        current_user.update(attributes)

        session[:success] = "Your profile has been updated"

        res.redirect("/profile")
      end

      on default do
        render("profile", title: "Profile", user: current_user, update_profile: update_profile)
      end
    end

    on post, param("password") do |params|
      update_password = UpdatePassword.new(params)

      on update_password.valid? do
        current_user.update(password: update_password.password)

        session[:success] = "Your password has been updated"

        res.redirect("/profile")
      end

      on default do
        render("profile", title: "Profile", user: current_user, update_password: update_password)
      end
    end

    on get do
      render("profile", title: "Profile", user: current_user)
    end
  end
end
