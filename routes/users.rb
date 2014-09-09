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

    on("profile") do
      run(Profile)
    end

    on("types") do
      run(Types)
    end

    on("outputs") do
      render("outputs/new", title: "Outputs")
    end
  end
end
