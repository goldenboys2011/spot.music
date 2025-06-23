local np, ls, cs, ps

local update_status = async(function()
  local res = fetch({
    url = "https://dave-worldwide-particular-foreign.trycloudflare.com/status-json.xsl",
    method = "GET"
  })

  local listeners = res.icestats.source.listeners
  local server = res.icestats.source.server_name
  local since = res.icestats.source.stream_start
  local title = res.icestats.source.title

  np:set_content("Now Playing: Unknown")
  ls:set_content(listeners .. " Listening Now!")
  cs:set_content("Server: " .. server)
  ps:set_content("Playing since: " .. since)
  np:set_content("Now Playing: " .. title)
end)

np = get("now-playing", false)
ls = get("listeners", false)
cs = get("current-server", false)
ps = get("playing-since", false)

update_status()
setInterval(update_status, 10 * 1000)
