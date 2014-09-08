class Guests < Cuba
  define do
    on("sign_up") do
      on post, param("user") do |params|
        sign_up = SignUp.new(params)

        on sign_up.valid? do
          user = User.create(sign_up.slice(:name, :email, :password))

          DEFAULT_TYPES.each do |type_attributes|
            Type.create(category: type_attributes["category"], name: type_attributes["name"], user_id: user.id)
          end

          text = Mailer.render("welcome", user: user)

          Malone.deliver(from: "info@migraine.io", to: user.email, subject: "Welcome to Migraine App", text: text)

          authenticate(user)

          res.redirect("/dashboard")
        end

        on default do
          render("sign_up", title: "Sign Up", signup: sign_up)
        end
      end

      on default do
        render("sign_up", title: "Sign Up", signup: SignUp.new({}))
      end
    end

    on default do
      run(Sign_in)
    end
  end
end
