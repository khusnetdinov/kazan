Rails.application.routes.draw do
  scope module: :web do
    get '/robots.txt', to: 'seo#robots', as: :robots
    get '/sitemap.xml', to: 'seo#sitemap', format: 'xml', as: :sitemap
  end
end
