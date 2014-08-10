class Guests < Cuba
  define do
    on("login") do
      render("login", title: "Login")
    end

    on("signup") do
      on post, param("user") do |params|
        sign_up = SignUp.new(params)

        on sign_up.valid? do
          user = User.create(sign_up.slice(:name, :email, :password))

          authenticate(user)

          res.redirect("/dashboard")
        end
      end

      on default do
        render("signup", title: "Sign Up")
      end
    end
  end
end
