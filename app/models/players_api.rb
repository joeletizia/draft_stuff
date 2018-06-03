module PlayersAPI
  API_ENDPOINT_TEMPLATE = "http://api.cbssports.com/fantasy/players/list?version=3.0&SPORT=<<sport>>&response_format=JSON"
  module_function

  def get_players_data(sport)
    uri = translate_uri_for_sport(sport)
    raw_result_data = fetch_data_from_api(uri)
    parsed_objects = parse_raw_json(raw_result_data)
    returned_objects = parsed_objects.dig("body", "players")

    filter_out_non_players(returned_objects)
  end

  def filter_out_non_players(objects)
    objects.reject do |object|
      object["firstname"].nil? || object["lastname"].nil?
    end
  end

  def translate_uri_for_sport(sport, uri_template = API_ENDPOINT_TEMPLATE)
    uri_template.gsub("<<sport>>", sport)
  end

  def parse_raw_json(raw_json)
    JSON.parse(raw_json)
  end

  def fetch_data_from_api(uri)
    HTTParty.get(uri)
  end
end
