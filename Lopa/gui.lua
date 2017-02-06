--[[
Lopa GUI
By: houseofkraft

Thanks to matimati433 for helping

]]--

local w, h = term.getSize()
local window = txUI.Window:new( { w = w; h = h; } )

txUI.Controller:addWindow( window )

-- Error if the system isn't running on Lopa
if Lopa == nil then
  printError( "This program is designed to operate on Lopa." )
  return
end

-- Components
local closeBtn = txUI.Button:new( {x = 1; y = 1; w = 1; h = 1; action = (function(self)
  self.parent:close()
end); textColor = colors.red; bgColor = window.tlColor; text = "X"; } )
local lgnLbl = txUI.Label:new( { x = 1; y = 5; w = w; text = "Login to Lopa"; bgColor = colors.lightGray; } )
local usrLbl = txUI.Label:new( { x = 4; y = 8; text = "Username"; textAlign = "left"; bgColor = colors.lightGray; } )
local usrInp = txUI.TextField:new( { x = 33; y = 8; placeholder = "Username"; } )
local pssInp = txUI.Label:new( { x = 4; y = 10; text = "Password"; textAlign = "left"; bgColor = colors.lightGray; } )
local remChk = txUI.Checkbox:new( { x = 4; y = 12; text = "Remember me"; } )
local lgnBtn = txUI.Button:new( { x = 33; y = 14; text = "Login"; } )

-- Apply all the Components
local cmp = {
  "lgnLbl",
  "usrLbl",
  "usrInp",
  "pssInp",
  "remChk",
  "lgnBtn"
}

for index, component in pairs( cmp ) do
  window:addComponent( component )
end

-- Set the window title
window.setTitleLabel( txUI.Label:new( { text = "Lopa Login"; textColor = colors.white; textAlign = "center"; draggable = true; } ) )

-- Render the window
txUI.Controller:startUpdateCycle()
