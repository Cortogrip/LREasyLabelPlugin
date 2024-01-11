-- ---------------------------------------------------------------------------------------------------------------------
-- LR Easy Label Print © 2024 by l Simonnet is licensed under Attribution-NonCommercial-NoDerivatives 4.0 International
-- See https://www.adobe.io/apis/creativecloud/lightroomclassic.html
--
-- LR Easy Label Print use a deployed service to print labels.
-- See http://localhost:8087/getting_started.html or http://auborddesmauves.fr/products/lrplugins for documentation.
-- ---------------------------------------------------------------------------------------------------------------------

-- Access the Lightroom SDK namespaces.
local LrFunctionContext = import 'LrFunctionContext'
local LrApplication = import 'LrApplication'
local LrBinding = import 'LrBinding'
local LrDialogs = import 'LrDialogs'
local LrTasks = import 'LrTasks'
local LrView = import 'LrView'
local LrHttp = import "LrHttp"

-- Use Common module
require("Common")



-- --------------------------------------------------------------------------------
-- Print label
-- --------------------------------------------------------------------------------
local function print(body)

	outputToLog( "print function entered." )

	local headers = {
		{ field = 'Content-Type', value = "application/json" },
	}

	LrTasks.startAsyncTask(function ()
		local result, hdrs = LrHttp.post("http://localhost:8087/api/v1/label/print", body, headers, 30 )

		if ( result ~= nil ) then
			outputToLog( "Print result " .. result )
		end

	end)

	outputToLog( "print function exiting." )
end

-- -------------------------------------------------
-- Get image info
-- -------------------------------------------------
function preProcessPrint(xPos, yPos, title, paper)

	outputToLog( "preProcessPrint function entered." )


	LrTasks.startAsyncTask(function ()
		local catalog = LrApplication.activeCatalog()

		local photo = catalog:getTargetPhoto()
		if photo == nil then
			LrDialogs.message("Hello World", "Please select a photo")
			return
		end

		local photoFileName = photo:getFormattedMetadata("fileName")
		local photoFileDate = photo:getFormattedMetadata("dateTimeOriginal")

		outputToLog( "-------- 2 --------" )
		outputToLog( "xPos        : " .. xPos )
		outputToLog( "yPos        : " .. yPos )
		outputToLog( "title       : " .. title )
		outputToLog( "paper       : " .. paper )

		outputToLog( "Photo File  : " .. photoFileName )
		outputToLog( "Photo Date  : " .. photoFileDate )

		body = "{ \"labels\" : [ { "
		body = body .. "\"xPos\" : " .. xPos .. ", "
		body = body .. "\"yPos\" : " .. yPos .. ", "
		body = body .. "\"lines\" : ["
		body = body .. "\"Titre : " .. title .. "\", "
		body = body .. "\"Date : " .. photoFileDate .. "\", "
		body = body .. "\"Fichier : " .. photoFileName .. "\", "
		body = body .. "\"Tirage : " .. paper .. "\", "
		body = body .. "\"\", "
		body = body .. "\"          Au bord des Mauves 2023\""
		body = body .. "]}]}"

		outputToLog(body)
		print(body)

	end)

	outputToLog( "preProcessPrint function exiting." )

end

-- -------------------------------------------------
-- Enter image info
-- -------------------------------------------------
local function getPrintInfoDialog()

	outputToLog( "getPrintInfoDialog function entered." )

	local result = LrFunctionContext.callWithContext( "getPrintInfoDialog", function( context )

		local props = LrBinding.makePropertyTable( context )
		props.paper = getValue("default_paper")

		local f = LrView.osFactory()


		local item1 = f:column {

			bind_to_object = props,
			alignment = 'center',

			f:group_box {
				title =  getValue("print_page_title"),
				f:edit_field {
					value = LrView.bind( "title" )
				}
			},
			f:group_box {
				title =  getValue("print_paper_title"),
				f:edit_field {
					value = LrView.bind( "paper" )
				},
			},

			f:spacer {
				height = 15
			},

			f:row {
				width = 130,
				f:group_box {
					title =  getValue("print_xpos_title"),
					width = 65,
					f:edit_field {
						title = "X",
						width_in_chars = 3,
						value = LrView.bind("xpos")
					}
				},
				f:spacer {
					width = 10
				},
				f:group_box {
					title =  getValue("print_ypos_title"),
					width = 65,
					alignment = 'center',
					f:edit_field {
						title = "Y",
						width_in_chars = 3,
						value = LrView.bind( "ypos" )
					}
				}
			}

		}

		local result = LrDialogs.presentModalDialog {
			title = getValue("print_info_title"),
			contents = item1, item2
		}

		title = props.title
		paper =  props.paper
		xPos = props.xpos
		yPos = props.ypos

		if (result=="ok") then

			-- Check data
			if (title == nil or xPos == nil or yPos == nil) then
				LrDialogs.showError( getValue("invalid_data_error_msg"))
			else

				outputToLog( "-------- 1 --------" )
				outputToLog( "xPos        : " .. xPos )
				outputToLog( "yPos        : " .. yPos )
				outputToLog( "title       : " .. title )
				outputToLog( "paper       : " .. paper )

				preProcessPrint(xPos, yPos, title, paper)

			end
		end
	end)

	outputToLog( "getPrintInfoDialog function exiting." )

end


-- -------------------------------------------------
-- Main
-- -------------------------------------------------
outputToLog( "LR Easy Label Print - Version " .. getValue("pluginVersion"))
getPrintInfoDialog()



