class Users < Cuba
  define do
    on("dashboard") do
      render("dashboard", title: "Dashboard")
    end

    on("logout") do
      logout(User)
      res.redirect("/")
    end
  end
end
