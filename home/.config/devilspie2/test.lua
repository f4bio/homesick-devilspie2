--
-- debug_print command does only print anything to stdout
-- if devilspie2 is run using the --debug option
debug_print("Window Name: " .. get_window_name())
debug_print("Application name: " .. get_application_name())

-- I want my Xfce4-terminal to the right on the second screen of my two-monitor
-- setup. (Strings are case sensitive, please note this when creating rule
-- scripts.)
if (get_application_name()=="tilix") then
  -- x,y, xsize, ysize
  -- set_window_geometry(1600,300,900,700);
  set_window_workspace(1)
  set_on_top()
  maximize()

elseif (get_application_name():find("Google Chrome") ~= nil) then
  set_window_workspace(2)
    change_workspace(2)

elseif (get_application_name():find("IntelliJ IDEA") ~= nil) then
  set_window_workspace(3)
  change_workspace(3)

elseif (get_application_name():find("^Slack") ~= nil) then
  set_window_workspace(4)
    change_workspace(4)

else
  set_window_workspace(5)
    change_workspace(5)
end
