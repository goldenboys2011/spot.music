function update_status()
  local res = fetch({
    url = status_url,
    method = "GET"
  })

  local np = get("now-playing", false)
  local title = res.icestats.source.title
  np.set_content("Now Playing: " .. title)

  local ls = get("listeners", false)
  local listeners = res.icestats.source.listeners
  np.set_content(listeners .. " Listening Now!")
end

-- Schedule `update_status` to run every 10 seconds
update_status()

set_interval(update_status, 10)
