require "jekyll-paginate"

module Jekyll

  class TagIndex < Page
    def initialize(site, base, dir, tag)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'
      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'tag_index.html')
      self.data['tag'] = tag
      tag_title_prefix = site.config['tag_title_prefix'] || 'Posts Tagged &ldquo;'
      tag_title_suffix = site.config['tag_title_suffix'] || '&rdquo;'
      self.data['title'] = "#{tag_title_prefix}#{tag}#{tag_title_suffix}"
    end
  end

  class TagPager < Jekyll::Paginate::Pager 
    attr_reader :tag

    def initialize(site, page, all_posts, tag, num_pages = nil)
      @tag = tag
      super site, page, all_posts, num_pages
    end

    alias_method :original_to_liquid, :to_liquid

    def to_liquid
      liquid = original_to_liquid
      liquid['tag'] = @tag
      liquid
    end
  end

  class TagGenerator < Generator
    safe true
    def generate(site)
      if site.layouts.key? 'tag_index'
        dir = site.config['tag_dir'] || 'tag'
        site.tags.keys.each do |tag|
          write_tag_index(site, File.join(dir, tag), tag)
        end
      end
    end

    def write_tag_index(site, dir, tag)
	  paginate(site, tag)
      index = TagIndex.new(site, site.source, dir, tag)
      index.render(site.layouts, site.site_payload)
      index.write(site.dest)
      site.pages << index
    end

    def paginate(site, tag)
      tag_posts = site.posts.find_all {|post| post.tags.include?(tag)}.sort_by {|post| -post.date.to_f}
      num_pages = TagPager.calculate_pages(tag_posts, site.config['paginate'].to_i)

      (1..num_pages).each do |page|
        pager = TagPager.new(site, page, tag_posts, tag, num_pages)
        dir = File.join('tags', tag, page > 1 ? "page#{page}" : '')
        page = TagIndex.new(site, site.source, dir, tag)
        page.pager = pager
        site.pages << page
      end
    end
  end

end
