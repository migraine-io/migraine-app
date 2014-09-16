class Outputs < Cuba
  define do
    on("new") do
      render("outputs/new", title: "Output")
    end

    on(":id") do |id|
      output = Output[id]

      on post, param("output") do |params|
        date = Date.new(params["date_year"].to_i, params["date_month"].to_i, params["date_day"].to_i)
        output.update(date: date, scale: params["scale"], duration: params["duration"])

        res.redirect("/outputs")
      end

      on get do
        render("outputs/edit", title: "Edit Output", output: output)
      end
    end

    on post, param("output") do |params|
      date = Date.new(params["date_year"].to_i, params["date_month"].to_i, params["date_day"].to_i)
      output = Output.create(date: date, scale: params["scale"], duration: params["duration"], user: current_user)

      res.redirect("/outputs")
    end

    on get do
      render("outputs/index", title: "Outputs", outputs: current_user.outputs)
    end
  end
end
