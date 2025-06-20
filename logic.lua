-- Your Icecast status endpoint
local status_url = "https://rabbit-nights-collect-automobiles.trycloudflare.com/status-json.xsl"

-- Fetch JSON metadata from Icecast
local res = fetch({
  url = status_url,
  method = "GET",
  headers = { ["Content-Type"] = "application/json" }
})

print("HI")
