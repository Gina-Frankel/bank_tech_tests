module Helpers
  def help
    
  end
end

def log_in_gina
  visit "/sessions/new"
  fill_in "session[name]", with: "Gina"
  fill_in "session[password]", with: "123456"
  click_on "Log in"
end