module Players
  module_function

  def for_sport(sport)
    Player.where(sport: sport)
  end
end
