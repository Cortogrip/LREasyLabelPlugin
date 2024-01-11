-- ---------------------------------------------------------------------------------------------------------------------
-- LR Easy Label Print © 2024 by l Simonnet is licensed under Attribution-NonCommercial-NoDerivatives 4.0 International
-- See https://www.adobe.io/apis/creativecloud/lightroomclassic.html
--
-- LR Easy Label Print use a deployed service to print labels.
-- See http://localhost:8087/getting_started.html or http://auborddesmauves.fr/products/lrplugins for documentation.
-- ---------------------------------------------------------------------------------------------------------------------

-- Access the Lightroom SDK namespaces.
local LrHttp = import "LrHttp"

-- Use Common module
require("Common")

-- --------------------------------------------------------------------------------
-- Open the documentation page
-- --------------------------------------------------------------------------------
local function displayHelp()
	LrHttp.openUrlInBrowser( docPage )
end


-- --------------------------------------------------------------------------------
-- Main entry point of the script
-- --------------------------------------------------------------------------------

docPage = getValue("doc_page")
service_error_msg = getValue("service_error_msg")

outputToLog( "docPage " .. docPage)
outputToLog( "service_error_msg " .. service_error_msg)

outputToLog( "LR Easy Label Print - Version " .. getValue("pluginVersion"))

-- Now get the service version.
displayHelp()
