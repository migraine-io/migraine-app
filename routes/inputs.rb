class Inputs < Cuba
  define do
    on(":id") do |id|
      input = Input[id]

      on post, param("input") do |params|
        date = Date.new(params["date_year"].to_i, params["date_month"].to_i, params["date_day"].to_i)
        type = ::Type[params["type_id"]]
        input = input.update(date: date, type: type)

        res.redirect("/inputs")
      end

      on get do
        render("inputs/edit", title: "Edit Input", input: input, user: current_user, types: current_user.types)
      end

      on "delete", post do
        input.delete

        res.redirect("/inputs")
      end
    end

    on post, param("input") do |params|
      date = Date.new(params["date_year"].to_i, params["date_month"].to_i, params["date_day"].to_i)
      type = ::Type[params["type_id"]]
      input = Input.create(date: date, type: type, user: current_user)

      res.redirect("/inputs")
    end

    on get do
      render("inputs/index", title: "Inputs", inputs: current_user.inputs, types: current_user.types)   #esto se pasa al index
    end
  end
end
