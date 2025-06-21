local status_url = "https://rabbit-nights-collect-automobiles.trycloudflare.com/status-json.xsl"

-- Fetch Icecast status
local res = fetch({
  url = status_url,
  method = "GET"
})

-- Try to get the "now-playing" element
local np = get("now-playing", false)

local title = res.icestats.source.title
np.set_content("Now Playing: " .. title)
