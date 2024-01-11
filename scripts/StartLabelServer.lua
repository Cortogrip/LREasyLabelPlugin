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
local function startService()

    outputToLog( "startService function entered." )

    LrTasks.startAsyncTask(function ()

        -- cmd = "java -jar -Dspring.profiles.active=local " .. serviceJarFile
        -- cmd = "java -jar -Dspring.profiles.active=local C:\Users\lsimonnet\Travail\Dev\lr\plugins\labelprinter.lrdevplugin\bin\LREasyLabelPrint.jar"
        cmd = "C:\Users\lsimonnet\Travail\Dev\lr\plugins\labelprinter.lrdevplugin\bin\start.bat"
        response = LrTasks.execute(cmd)
        outputToLog( "Start service command response : " .. response )
    end)


    outputToLog( "startService function exiting." )

end

-- --------------------------------------------------------------------------------
-- Main entry point of the script
-- --------------------------------------------------------------------------------
outputToLog( "LR Easy Label Print - Version " .. getValue("pluginVersion"))
serviceJarFile = getValue("serviceJarFile")

outputToLog( serviceJarFile )
startService()
