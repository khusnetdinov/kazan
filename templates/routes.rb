Rails.application.routes.draw do

  scope module: :web do
    root 'welcome#index'
  end
end
