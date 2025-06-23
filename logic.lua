function update_status()
  local res = fetch({
    url = "https://dave-worldwide-particular-foreign.trycloudflare.com/status-json.xsl",
    method = "GET"
  })

  local np = get("now-playing", false)
  np.set_content("Now Playing: Unknown")

  local ls = get("listeners", false)
  local listeners = res.icestats.source.listeners
  ls.set_content(listeners .. " Listening Now!")

  local cs = get("current-server", false)
  local server = res.icestats.source.server_name
  cs.set_content("Server: " .. server)

  local ps = get("playing-since", false)
  local since = res.icestats.source.stream_start
  ps.set_content("Playing since: " .. since)

  title = res.icestats.source.title
  np.set_content("Now Playing: " .. title)

end

-- Schedule `update_status` to run every 10 seconds
update_status()

setInterval(update_status, 10)
