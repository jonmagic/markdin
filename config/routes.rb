Markdin::Application.routes.draw do
  get "/auth/twitter/callback" => "twitter#callback"
  get "/signout" => "twitter#signout", :as => :signout

  root "application#homepage"
end
