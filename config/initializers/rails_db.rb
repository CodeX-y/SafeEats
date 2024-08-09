if Object.const_defined?("RailsDb")
  RailsDb.setup do |config|
    config.black_list_tables = ["ar_internal_metadata"]
  end
end
