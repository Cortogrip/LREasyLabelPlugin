-- ---------------------------------------------------------------------------------------------------------------------
-- LR Easy Label Print © 2024 by l Simonnet is licensed under Attribution-NonCommercial-NoDerivatives 4.0 International
-- See https://www.adobe.io/apis/creativecloud/lightroomclassic.html
--
-- LR Easy Label Print use a deployed service to print labels.
-- See http://localhost:8087/getting_started.html or http://auborddesmauves.fr/products/lrplugins for documentation.
-- ---------------------------------------------------------------------------------------------------------------------

-- Access the Lightroom SDK namespaces.
local LrTasks = import 'LrTasks'


-- Use Common module
require("Common")


-- --------------------------------------------------------------------------------
-- Get the app version
-- --------------------------------------------------------------------------------
local function stopService()

	outputToLog( "startService function entered." )

	local headers = {}
	LrTasks.startAsyncTask(function ()
		local result, hdrs = LrHttp.post( "http://localhost:8087/api/v1/label/stop", headers, 20 )
	end)

	outputToLog( "stopService function exiting." )

end

-- --------------------------------------------------------------------------------
-- Main entry point of the script
-- --------------------------------------------------------------------------------
outputToLog( "LR Easy Label Print - Version " .. getValue("pluginVersion"))
stopService()
