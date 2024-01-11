-- ---------------------------------------------------------------------------------------------------------------------
-- LR Easy Label Print © 2024 by l Simonnet is licensed under Attribution-NonCommercial-NoDerivatives 4.0 International
-- See https://www.adobe.io/apis/creativecloud/lightroomclassic.html
--
-- LR Easy Label Print use a deployed service to print labels.
-- See http://localhost:8087/getting_started.html or http://auborddesmauves.fr/products/lrplugins for documentation.
-- ---------------------------------------------------------------------------------------------------------------------

-- Access the Lightroom SDK namespaces.
local LrDialogs = import 'LrDialogs'
local LrHttp = import "LrHttp"
local LrBinding = import 'LrBinding'

-- Use Common module
require("Common")

-- --------------------------------------------------------------------------------
-- Get the app version
-- --------------------------------------------------------------------------------
local function getVersion()

	outputToLog( "getVersion function entered." )

	local headers = {}

	import "LrTasks".startAsyncTask( function()
		local result, hdrs = LrHttp.get( "http://localhost:8087/api/v1/label/version", headers, 20 )

		if ( hdrs["status"] == nil ) then
			outputToLog( "Cannot get response from server" )
			LrDialogs.showError( cannot_connect_service_msg )

		elseif  ( hdrs["status"] ~= 200) then
			outputToLog( "Server error [" ..  hdrs["status"] .. "]")
			LrDialogs.showError( service_error_msg .. " (" ..  hdrs["status"] .. ")")

		else
			outputToLog( "Server is up" )
			LrDialogs.message( LOC "$$$/ArtImageShop/get_version=Server version", result, "info" )
		end

		--for index,hdr in pairs(hdrs) do
		--	outputToLog( "Index : " .. index )
		--	outputToLog( "Found : " .. hdr["field"] .. " : " .. hdr["value"])
		--end
	end )

	outputToLog( "getVersion function exiting." )

end

-- --------------------------------------------------------------------------------
-- Main entry point of the script
-- --------------------------------------------------------------------------------

cannot_connect_service_msg = getValue("cannot_connect_service_msg")
service_error_msg = getValue("service_error_msg")

outputToLog( "LR Easy Label Print - Version " .. getValue("pluginVersion"))

-- Now get the service version.
getVersion()
