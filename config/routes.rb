Markdin::Application.routes.draw do
  get "/auth/twitter/callback" => "twitter#callback"

  root "application#homepage"
end
