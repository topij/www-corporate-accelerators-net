module Jekyll
  module NoInfoFilter
    def noinfo(input, text = "N/I")
		input == "" ? text : input
    end
  end
end

Liquid::Template.register_filter(Jekyll::NoInfoFilter)