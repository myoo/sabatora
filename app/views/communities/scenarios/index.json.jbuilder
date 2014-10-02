json.array!(@communities_scenarios) do |communities_scenario|
  json.extract! communities_scenario, :id
  json.url communities_scenario_url(communities_scenario, format: :json)
end
