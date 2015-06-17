module Jekyll

  class AcceleratorPage < Page
    def initialize(site, base, dir, category)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_noita'), 'accelerator.html')
      self.data['accelerator'] = accelerator

      #category_title_prefix = site.config['category_title_prefix'] || 'Category: '
      #self.data['title'] = "#{category_title_prefix}#{category}"
    end
  end

  class CategoryPageGenerator < Generator
    safe true

    def generate(site)
      #if site.layouts.key? 'category_index'
      dir = site.config['accelerators_dir'] || 'database/accelerator'
      site.data['Accelerators'].each do |accelerator|
        site.pages << AcceleratorPage.new(site, site.source, 
          File.join(dir, sanitize_filename(accelerator['Company']), sanitize_filename(accelerator['Name'])), accelerator)
      end
      #end
    end

    def sanitize_filename(filename)
      filename = filename.strip
      filename = filename.gsub(/^.*(\\|\/)/, '')
      filename = filename.gsub(/[^0-9A-Za-z.\-]/, '_')
      return filename
    end
  end

end