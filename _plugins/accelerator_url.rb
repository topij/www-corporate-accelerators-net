module Jekyll
  module AcceleratorURLFilter
    def acceleratorurl(input, name)
		cleanCompany = input.strip.gsub(/^.*(\\|\/)/, '').gsub(/[^0-9A-Za-z.\-]/, '_')
		cleanName = name.strip.gsub(/^.*(\\|\/)/, '').gsub(/[^0-9A-Za-z.\-]/, '_')
		url = File.join("/database/accelerator", cleanCompany, cleanName, "index.html")
    end
  end
end

Liquid::Template.register_filter(Jekyll::AcceleratorURLFilter)