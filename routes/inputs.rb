class Inputs < Cuba
  define do
    on("new") do
      render("inputs/new", title: "New Input", types: Type.all)
    end

    on post, param("input") do |params|
      date = Date.new(params["date_year"].to_i, params["date_month"].to_i, params["date_day"].to_i)
      type = ::Type[params["type_id"]]
      input = Input.create(date: date, type: type, user: current_user)

      res.redirect("/inputs")
    end

    on get do
      render("inputs/index", title: "Inputs", inputs: current_user.inputs)   #esto se pasa al index
    end


  end
end
