class Sign_in < Cuba
  define do
    on("sign_in") do
      on post, param("user") do |params|
        user = User.authenticate(params["email"],  params["password"])

        on user do
          authenticate(user)

          res.redirect("/dashboard")
        end

        on default do
          session[:error] = "Invalid Username and Password"

          render("sign_in", title: "Sign In")
        end
      end

      on default do
        render("sign_in", title: "Sign In")
      end
    end
    on default do
      run(Forgot_password)
    end
  end
end
