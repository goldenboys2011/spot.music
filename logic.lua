-- URL to Icecast JSON status
local status_url = "https://rabbit-nights-collect-automobiles.trycloudflare.com/status-json.xsl"
local np = get("now-playing", false)
-- Perform fetch (without triggering OPTIONS)
local res = fetch({
  url = status_url,
  method = "GET"
})

np.set_content(res)
