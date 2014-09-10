class Forgot_password < Cuba
  define do
    on("password/forgot") do
      on post, param("user") do |params|
        user = User.fetch(params["email"])

        if user
          text = Mailer.render("forgot_password", user: user)

          Malone.deliver(from: "info@migraine.io", to: user.email, subject: "Forgot Password", text: text)
        end

        res.redirect("/password/reset")
      end

      on default do
        render("password/forgot", title: "Forgot Password")
      end
    end

    on("password/reset") do
      render("password/reset", title: "Edit Type")
    end

    res.redirect("/sign_in")

  end
end
