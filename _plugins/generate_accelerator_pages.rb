
module Jekyll
  class AcceleratorsGenerator < Generator
    def generate(site)
      site.data['Accelerators'].each do |accelerator|
        site.pages <<  AcceleratorPagePage.new(site, site.source, "_layouts", "accelerator.html", accelerator)
      end
    end
  end

  class AcceleratorPagePage < Page
    def initialize(site, base, dir, name, accelerator)
      company = (accelerator['Company'] || 'Company').strip
      nameOfAccelerator = (accelerator['Name'] || 'Accelerator').strip
      cleanCompany = company.gsub(/^.*(\\|\/)/, '').gsub(/[^0-9A-Za-z.\-]/, '_')
      cleanNameOfAccelerator = nameOfAccelerator.gsub(/^.*(\\|\/)/, '').gsub(/[^0-9A-Za-z.\-]/, '_')

      @site = site
      @base = base
      @dir = File.join("database/accelerator", cleanCompany, cleanNameOfAccelerator)
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, dir), name)

      self.data['title'] = "#{company} - #{nameOfAccelerator}"
      self.data['accelerator'] = accelerator
    end
  end
end