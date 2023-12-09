task(:deleteall => :environment) do
  if Rails.env.development?
    Vote.destroy_all
  end
end
