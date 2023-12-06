task(:deleteall => :environment) do
  if Rails.env.development?
    Member.destroy_all
  end
end
