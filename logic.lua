local status_url = "https://rabbit-nights-collect-automobiles.trycloudflare.com/status-json.xsl"

-- Fetch Icecast status
local res = fetch({
  url = status_url,
  method = "GET"
})

-- Try to get the "now-playing" element
local np = get("now-playing", false)

-- Make sure both res and the element exist
if np and type(res) == "table" and res.icestats and res.icestats.source and res.icestats.source.title then
  local title = res.icestats.source.title
  np.set_content("Now Playing: " .. title)
else
  print("Element not found or invalid response")
end
