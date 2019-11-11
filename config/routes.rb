Rails.application.routes.draw do
  get '/', to: 'home#index'

  resources :people

  # Evaluate component routes
  Dir['components/*'].each do |path|
    instance_eval(File.read("#{path}/config/routes.rb"))
  end
end
