Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  get '/health', to: ->(env) { [204, {}, ['']] }

  root "root#index"
  get '/*path' => "root#index"
end
