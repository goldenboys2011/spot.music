function update_status()
  local res = fetch({
    url = "https://rabbit-nights-collect-automobiles.trycloudflare.com/status-json.xsl",
    method = "GET"
  })

  local np = get("now-playing", false)
  local title = res.icestats.source.title
  np.set_content("Now Playing: " .. title)

  local ls = get("listeners", false)
  local listeners = res.icestats.source.listeners
  ls.set_content(listeners .. " Listening Now!")
end

-- Schedule `update_status` to run every 10 seconds
update_status()

set_interval(update_status, 10)
