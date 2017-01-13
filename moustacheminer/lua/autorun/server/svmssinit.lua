--[[
======================================
moustacheminer.com server services 4.0
======================================

THIS PIECE OF SOFTWARE IS (PROBABLY) PROTECTED BY INTERNATIONAL LAW

Changes since 4.0
-----------------
+ Changed installation folder of lua files - Moved to addons folder
+ Changed name from "ChatTaunts" to "moustacheminer.com server services"
+ Using net.send and net.recieve instead of sendlua
+ Added opt-out from "ChatTaunts"
+ Combined with indev URL sending

Changes since 3.1
-----------------
- Removed console filling "Added taunt to fastdl" message

Changes since 3.0
-----------------
+ Added Administrator only chat taunts

Changes since 2.1
-----------------
+ Using SQL instead of reading from .json file

Changes since 1.0
-----------------
+ Using .json instead of a baked in table inside the program itself

]]--

print("[MSS BASE] Loading clientside")
AddCSLuaFile("autorun/client/clbhop.lua")
AddCSLuaFile("autorun/client/clmssct.lua")
AddCSLuaFile("autorun/client/clmssurl.lua")
include("mss/svmssct.lua")
include("mss/svmssurl.lua")