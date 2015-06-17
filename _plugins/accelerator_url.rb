module Jekyll
  module AcceleratorURLFilter
    def acceleratorurl(input, name)
		cleanCompany = input.gsub(/^.*(\\|\/)/, '').gsub(/[^0-9A-Za-z.\-]/, '_')
		cleanName = name.gsub(/^.*(\\|\/)/, '').gsub(/[^0-9A-Za-z.\-]/, '_')
		url = File.join("/database/accelerator", cleanCompany, cleanName, "index.html")
    end
  end
end

Liquid::Template.register_filter(Jekyll::AcceleratorURLFilter)