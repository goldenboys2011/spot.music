local status_url = "https://rabbit-nights-collect-automobiles.trycloudflare.com/status-json.xsl"

local res = fetch({
  url = status_url,
  method = "GET"
})

print(res)
