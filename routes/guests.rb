class Guests < Cuba
  define do
    on("login") do
      on post, param("user") do |params|
        user = User.authenticate(params["email"],  params["password"])

        on user do
          authenticate(user)

          res.redirect("/dashboard")
        end
      end

      on default do
        render("login", title: "Login")
      end
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
