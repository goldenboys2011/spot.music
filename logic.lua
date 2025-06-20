-- URL to Icecast JSON status
local status_url = "https://rabbit-nights-collect-automobiles.trycloudflare.com/status-json.xsl"

-- Perform fetch (without triggering OPTIONS)
local res = fetch({
  url = status_url,
  method = "GET"
})

-- Parse the result if it's a JSON table
if type(res) == "table" and res.icestats and res.icestats.source and res.icestats.source.title then
  local title = res.icestats.source.title

  -- Get the element by ID
  local np = get("now-playing", false)
  if np then
    np.set_content("Now Playing: " .. title)
  else
    print("Element #now-playing not found.")
  end
else
  print("Failed to fetch title or parse JSON correctly.")
end
