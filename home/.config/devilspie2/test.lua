--
-- debug_print command does only print anything to stdout
-- if devilspie2 is run using the --debug option
debug_print("Window Name: " .. get_window_name())
debug_print("Application name: " .. get_application_name())

local workspace_terminal = 1
local workspace_devtools = 2
local workspace_browser = 3
local workspace_chat = 4
local workspace_free = 5
local workspace_next = 3

-- TERMINAL
if (get_application_name()=="tilix") then
  debug_print("moving 'tilix' to terminal workspace(" .. workspace_terminal .. ")")
  set_window_workspace(workspace_terminal)
  maximize()

-- DEV TOOLS
elseif (get_application_name():find("IntelliJ IDEA")) then
  debug_print("moving 'idea' to devtools workspace(" .. workspace_devtools .. ")")
  set_window_workspace(workspace_devtools)
	undecorate_window()
	maximize()

-- BROWSER
elseif (get_application_name():find("Google Chrome")) then
	debug_print("moving 'chrome' to browser workspace(" .. workspace_browser .. ")")
  set_window_workspace(workspace_browser)

-- CHAT
elseif (get_application_name():find("^Slack")) then
	debug_print("moving 'slack' to chat workspace(" .. workspace_chat .. ")")
  set_window_workspace(workspace_chat)
elseif (get_application_name():find("^HexChat")) then
	debug_print("moving 'hexchat' to chat workspace(" .. workspace_chat .. ")")
  set_window_workspace(workspace_chat)

else
	if (tonumber(get_window_property("_NET_WM_DESKTOP")) < workspace_next) then
		debug_print("Moving '".. get_application_name() .. "' to free workspace: " .. workspace_free)
		debug_print(get_window_property("_NET_WM_DESKTOP"))
	  set_window_workspace(workspace_free)
	end
end
