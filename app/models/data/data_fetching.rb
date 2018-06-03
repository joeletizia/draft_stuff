module Data::DataFetching
  API_ENDPOINT_TEMPLATE = "http://api.cbssports.com/fantasy/players/list?version=3.0&SPORT=<<sport>>&response_format=JSON"
  SPORTS_TO_FETCH = ['baseball']

  module_function

  def get_and_persist_api_data
    SPORTS_TO_FETCH.map do |sport|
      uri = translate_uri_for_sport(sport)
      raw_result_data = fetch_data_from_api(uri)
      parsed_objects = parse_raw_json(raw_result_data)
      player_structs = parsed_objects.dig("body", "players")
      persist_player_structs_for_sport(player_structs, sport)

      true
    end
  end

  def translate_uri_for_sport(sport, uri_template = API_ENDPOINT_TEMPLATE)
    uri_template.gsub("<<sport>>", sport)
  end

  def fetch_data_from_api(uri)
    HTTParty.get(uri)
  end

  def parse_raw_json(raw_json)
    JSON.parse(raw_json)
  end

  def persist_player_structs_for_sport(player_structs, sport)
    persister = PersisterRepository.persister_for_sport(sport)
    persister.persist_player_structs(player_structs)
  end
end
