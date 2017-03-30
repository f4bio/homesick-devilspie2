--
-- debug_print command does only print anything to stdout
-- if devilspie2 is run using the --debug option
debug_print("----------------------------------")
debug_print("Window Name: " .. get_window_name())
debug_print("Window Type: " .. get_window_type())
debug_print("Application name: " .. get_application_name())
debug_print("-v-v-v-v-v-v-v-v-v-v-v-v--v-v-v-v-")

local workspace_terminal = 1
local workspace_devtools = 2
local workspace_browser = 3
local workspace_chat = 4
local workspace_free = 5
local workspace_next = 3
local workspace_current = get_window_property("_NET_WM_DESKTOP")
local window_type_current = get_window_type()

-- CONKY
if (window_type_current=="WINDOW_TYPE_DESKTOP") then
	return
end

-- TERMINAL
if (get_application_name()=="tilix") then
  debug_print("moving 'tilix' to terminal workspace(" .. workspace_terminal .. ")")
  set_window_workspace(workspace_terminal)
  maximize()
end

-- DEV TOOLS
if (get_application_name():find("IntelliJ IDEA")) then
  debug_print("moving 'idea' to devtools workspace(" .. workspace_devtools .. ")")
  set_window_workspace(workspace_devtools)
	undecorate_window()
	maximize()
end
if (get_application_name()=="Settings") then -- stupid hack...
	debug_print("moving 'idea's settings to devtools workspace(" .. workspace_devtools .. ")")
	set_window_workspace(workspace_devtools)
end

-- BROWSER
if (get_application_name():find("Google Chrome")) then
	debug_print("moving 'chrome' to browser workspace(" .. workspace_browser .. ")")
  set_window_workspace(workspace_browser)
end

-- CHAT
if (get_application_name():find("^Slack")) then
	debug_print("moving 'slack' to chat workspace(" .. workspace_chat .. ")")
  set_window_workspace(workspace_chat)
end
if (get_application_name():find("^HexChat")) then
	debug_print("moving 'hexchat' to chat workspace(" .. workspace_chat .. ")")
  set_window_workspace(workspace_chat)
end
if (get_application_name():find("^Empathy")) then
	debug_print("moving 'empathy' to chat workspace(" .. workspace_chat .. ")")
  set_window_workspace(workspace_chat)
end

-- OTHER
if (tonumber(workspace_current) < (workspace_next-1)) then
	debug_print("Moving '".. get_application_name() .. "' to free workspace: " .. workspace_free)
  set_window_workspace(workspace_free)
end
