function update_status()
  local res = fetch({
    url = status_url,
    method = "GET"
  })

  local np = get("now-playing", false)

  if res and res.icestats and res.icestats.source and res.icestats.source.title then
    local title = res.icestats.source.title
    np.set_content("Now Playing: " .. title)
  else
    np.set_content("Now Playing: Unknown")
  end
end

-- Schedule `update_status` to run every 10 seconds
set_interval(update_status, 10)
