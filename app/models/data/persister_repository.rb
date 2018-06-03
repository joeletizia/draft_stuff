module Data::PersisterRepository
  module_function

  def persister_for_sport(sport)
    sport_to_persister_mapping.fetch(sport)
  end

  def sport_to_persister_mapping
    {
      'baseball' => Data::BaseballPlayerPersister,
    }
  end
end
