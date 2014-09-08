class Forgot_password < Cuba
  define do
    on("forgot_password") do
      on post, param("user") do |params|
        user = User.fetch(params["email"])

        if user
          text = Mailer.render("forgot_password", user: user)

          Malone.deliver(from: "info@migraine.io", to: user.email, subject: "Forgot Password", text: text)
        end

        res.redirect("/sign_in")
      end
      on default do
        render("forgot_password", title: "Forgot Password")
      end
    end
  end
end
