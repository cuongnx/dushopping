module ApplicationHelper
  def full_title(tt)
    base = "Dushopping"
    return base if tt.empty?
    return "#{base} | #{tt}"
  end
end
