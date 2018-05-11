# frozen_string_literal: true

xml.instruct! :xml, version: '1.0'
xml.tag! 'urlset',
         'xmlns' => 'http://www.sitemaps.org/schemas/sitemap/0.9',
         'xmlns:image' => 'http://www.google.com/schemas/sitemap-image/1.1',
         'xmlns:video' => 'http://www.google.com/schemas/sitemap-video/1.1' do
  @allowed_routes[0..-2].each do |route|
    xml.url do
      xml.loc "#{@base_url}#{route}"
    end
  end
end
