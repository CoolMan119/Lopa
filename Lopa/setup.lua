--[[
Lopa Setup
By: houseofkraft
]]--

local w, h = term.getSize()

-- Functions
function setBG( color )
  term.setBackgroundColor( color )
  term.clear()
  term.setCursorPos( 1, 1 )
end

function loadFile( file )
  f = fs.open( file, "r" )
  local contents = f.readAll()
  f.close()
  return contents
end

function center( text )
   local x, y = term.getSize()
   local x2, y2 = term.getCursorPos()
   term.setCursorPos( math.ceil( (x / 2) - (text:len() / 2) ), y2 )
   write(text)
end

function getCenterPos( text )
  local x,y = term.getSize()
  local x2,y2 = term.getCursorPos()
  return math.ceil( (x / 2) - (text:len() / 2) ), y2
end

function isBlank( text )
  if text == "" then
    return true
  else
    return false
  end
end

function saveFile( name, contents )
  file = fs.open( name, "w" )
  file.write( contents )
  file.close()
  return true
end

function drawSetup( title )
  setBG( colors.red )
  paintutils.drawFilledBox( 1, 1, w, 3, colors.white)
  term.setCursorPos( 1,2 )
  term.setTextColor( colors.gray )
  center( title )
  term.setCursorPos( 1, 5 )
  term.setBackgroundColor( colors.red )
  term.setTextColor( colors.white )
end

function saveTable( arr, file )
  f = fs.open( file, "w" )
  f.write( textutils.serialize( arr ) )
  f.close()
  return true, "Sucessfully saved the table"
end

drawSetup( "Setup" )
center( "Welcome to Setup!" )
print()
center( "We will guide you throughout the setup process." )
print()
print()
center( "Press any key to continue." )
os.pullEvent( "key" ) -- May want to change to a button
drawSetup( "User Account" )
center( "We will now setup your user account." )
print()
local x, y = getCenterPos( "Username:" )
term.setCursorPos( (x - 3), y )
write( "Username: " )
local username = read()
local x, y = getCenterPos( "Password:" )
if isBlank()
term.setCursorPos( (x - 3), y )
write( "Password: " )
local password = read( "*" )
-- Save the data
saveTable( {
  username = username,
  password = password
}, "/System/main.config" )

-- Prevent first-time setup from running again
fs.delete( "/System/.firstuse ")
saveFile( "/System/.firstuse", "false" )

-- Reboot the system
for i = 3, 1 do
  drawSetup( "Finished" )
  if i == 1 then
    center( "Rebooting in 1 second..." )
  else
    center( "Rebooting in " .. i .. " seconds..." )
  end
end
os.reboot()
