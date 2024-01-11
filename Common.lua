-- ---------------------------------------------------------------------------------------------------------------------
-- LR Easy Label Print © 2024 by l Simonnet is licensed under Attribution-NonCommercial-NoDerivatives 4.0 International
-- See https://www.adobe.io/apis/creativecloud/lightroomclassic.html
-- ---------------------------------------------------------------------------------------------------------------------
local LrLogger = import 'LrLogger'

-- Static values
local data = {
    pluginVersion = "1.0.3",
    serviceJarFile = "./bin/LREasyLabelPrint.jar",
    cannot_connect_service_msg = LOC "$$$/ArtImageShop/service_error=Cannot get response from server",
    cannot_print_msg = LOC "$$$/ArtImageShop/print_error=Cannot print label.",
    service_error_msg = LOC "$$$/ArtImageShop/server_error=Server error",
    invalid_data_error_msg = LOC "$$$/ArtImageShop/invalid_data_error_msg=Invalid input field",
    doc_page = LOC "$$$/ArtImageShop/doc_page=http://localhost:8087/lr-easy-label-print_en.html",
    default_paper = "01 - Canson Baryta",
    print_info_title = LOC "$$$/ArtImageShop/print_info_title=Print info",
    print_page_title = LOC "$$$/ArtImageShop/print_page_title=Page",
    print_paper_title = LOC "$$$/ArtImageShop/print_paper_title=Paper",
    print_xpos_title = LOC "$$$/ArtImageShop/print_xpos_title=X Pos",
    print_ypos_title = LOC "$$$/ArtImageShop/print_ypos_title=Y Pos",
    see_service_console_msg = LOC "$$$/ArtImageShop/see_console_service_msg=See service console",
  }

-- Create the logger and enable the print function.
local myLogger = LrLogger( 'exportLogger' )
myLogger:enable( "print" ) -- Pass either a string or a table of actions.

-- --------------------------------------------------------------------------------
-- Conat strings
-- --------------------------------------------------------------------------------
function tableToString(myTable)

    message = ""
    for index,item in pairs(myTable) do
        message = message .. item
    end
    return message
end

-- --------------------------------------------------------------------------------
-- Write a log in Windows console (Use WinDbg to see traces.
-- See https://docs.microsoft.com/en-us/windows-hardware/drivers/debugger/debugger-download-tools
-- --------------------------------------------------------------------------------
function outputToLog( message )
    if ( message ~= nil ) then
        myLogger:trace( message )
    end
end

-- --------------------------------------------------------------------------------
-- Get the plugin constant value
-- --------------------------------------------------------------------------------
function getValue(field )
    return data[field]
end