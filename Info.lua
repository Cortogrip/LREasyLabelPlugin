-- ---------------------------------------------------------------------------------------------------------------------
-- LR Easy Label Print © 2024 by l Simonnet is licensed under Attribution-NonCommercial-NoDerivatives 4.0 International
-- See https://www.adobe.io/apis/creativecloud/lightroomclassic.html
--
-- LR Easy Label Print use a deployed service to print labels.
-- See http://localhost:8087/getting_started.html or http://auborddesmauves.fr/products/lrplugins for documentation.
-- ---------------------------------------------------------------------------------------------------------------------

return {
	
	LrSdkVersion = 3.0,
	LrSdkMinimumVersion = 1.3, -- minimum SDK version required by this plug-in

	LrToolkitIdentifier = 'com.abdm.lrplugin.imageshop.label',

	LrPluginName = LOC "$$$/ArtImageShop/PluginName=LR Easy Label Print",
	
	-- Add the menu item to the File menu.
	LrExportMenuItems = {

		{
			title = LOC "$$$/ArtImageShop/start=Start server",
			file = "scripts/StartLabelServer.lua"
		},
		{
			title = LOC "$$$/ArtImageShop/navigate=Stop server",
			file = "scripts/StopLabelServer.lua"
		},
		{
			title = LOC "$$$/ArtImageShop/version=Version",
		 	file = "scripts/GetVersion.lua"
		},
		{
			title = LOC "$$$/ArtImageShop/help=Help",
			file = "scripts/Help.lua"
		}
	},

	-- Add the menu item to the Library menu.
	LrLibraryMenuItems = {
		{
			title = LOC "$$$/ArtImageShop/print=Print label",
			file = "scripts/PrintLabel.lua"
		},
		{
			title = LOC "$$$/ArtImageShop/help=Help",
			file = "Help.lua"
		}
	},
	VERSION = { major=1, minor=0, revision=0, build="20240106-007", },

}

