namespace :data do
  desc "Fetch data from CBS and persist it to the DB"
  task fetch_from_cbs: :environment do
    Data::DataFetching.get_and_persist_api_data()
    Analytics::Age.calculate_and_persist_average_position_ages()
  end
end
