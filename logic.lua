local http = require "http"
local json = require "json"
local page = require "page"

-- Your Icecast status endpoint
local status_url = "https://rabbit-nights-collect-automobiles.trycloudflare.com/status-json.xsl"

-- Fetch JSON metadata from Icecast
local function fetch_metadata()
    local res, err = http.request("GET", status_url)
    if not res or res.status ~= 200 then
        return nil, "Failed to fetch metadata"
    end
    return res.body, nil
end

-- Extract the current song title
local function get_current_title()
    local body, err = fetch_metadata()
    if not body then return "Error: " .. err end

    local ok, data = pcall(json.decode, body)
    if not ok or not data.icestats then
        return "Invalid metadata format"
    end

    local source = data.icestats.source
    if type(source) == "table" then
        for _, src in ipairs(source) do
            if src.listenurl and src.listenurl:find("/stream") then
                return src.title or "Unknown Title"
            end
        end
    elseif type(source) == "table" then
        return source.title or "Unknown Title"
    end

    return "No song playing"
end

-- Update the DOM element
local function update_now_playing()
    local title = get_current_title()
    page.select("#now-playing").text = "Now Playing: " .. title
end

-- Run on page load and periodically every 10 seconds
page.on_ready(function()
    update_now_playing()
    page.set_interval(update_now_playing, 10000)
end)
