namespace :data do
  desc "Fetch data from CBS and persist it to the DB"
  task fetch_from_cbs: :environment do
    DataFetching.get_and_persist_api_data()
  end

end
