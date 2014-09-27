class Users < Cuba
  define do
    on("dashboard") do
      outputs = current_user.outputs.to_a
      inputs  = current_user.inputs.to_a

      output_dates = outputs.map { |o| o.date }
      input_dates  = inputs.map { |i| i.date }

      all_dates = output_dates + input_dates
      all_years = all_dates.map { |d| d.year }.sort

      start_year = all_years.first
      end_year   = all_years.last

      statistics = {}
      end_year.downto(start_year).each do |y|
        statistics[y] ||= {}
        1.upto(12).each do |m|
          statistics[y][m] ||= {}

          outputs.each do |output|
            statistics[y][m][:outputs] ||= []

            if output.date.year == y && output.date.month == m
              statistics[y][m][:outputs] << output
            end
          end

          inputs.each do |input|
            statistics[y][m][:inputs] ||= []

            if input.date.year == y && input.date.month == m
              statistics[y][m][:inputs] << input
            end
          end
        end
      end

      render("dashboard", title: "Dashboard", statistics: statistics)
    end

    on("sign_out") do
      logout(User)
      res.redirect("/")
    end

    on("inputs") do
      run(Inputs)
    end

    on("outputs") do
      run(Outputs)
    end

    on("profile") do
      run(Profile)
    end

    on("types") do
      run(Types)
    end

    on("types/edit") do
      run(Types)
    end

  end
end
