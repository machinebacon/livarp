-- this autorun may be useful for non livarp user ;)
------------------------------------------------------------------------

function run_once(cmd)
  findme = cmd
  firstspace = cmd:find(" ")
  if firstspace then
     findme = cmd:sub(0, firstspace-1)
  end
  awful.util.spawn_with_shell("pgrep -u $USER -x " .. findme .. " > /dev/null || (" .. cmd .. ")")
 end 

--run_once("nm-applet")
--run_once("udisks-glue --session")
--run_once("fbpanel")
--run_once("conky -q -c ~/.conky/conkyrc_awesome")
--run_once("xcompmgr_livarp -f")

-- Aphelion@2013 -------------------------------------------------------
