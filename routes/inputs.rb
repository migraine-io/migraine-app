class Inputs < Cuba
  define do
    on("new") do
      render("inputs/new", title: "New Input", types: Type.all)
    end

    on get do
      render("inputs/index", title: "Inputs", inputs: Input.all)
    end
  end
end
