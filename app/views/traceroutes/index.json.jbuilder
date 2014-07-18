json.array!(@traceroutes) do |traceroute|
  json.extract! traceroute, :id, :local_ip, :stdout, :stderr, :exit_status, :timestamp
  json.url traceroute_url(traceroute, format: :json)
end
