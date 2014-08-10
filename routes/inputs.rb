class Inputs < Cuba
  define do
    # on("inputs") do
    #   on("new") do
    #     render("inputs/new", title: "New Input", types: Type.all.to_a)
    #   end
    #
    #   on get do
    #     render("inputs/index", title: "Inputs", inputs: Input.all.to_a)
    #   end
    # end

    on("new") do
      render("inputs/new", title: "New Input", types: Type.all.to_a)
    end

    on get do
      render("inputs/index", title: "Inputs", inputs: Input.all.to_a)
    end
  end
end
