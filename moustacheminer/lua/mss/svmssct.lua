require("mysqloo")
util.AddNetworkString( "mss.ct" )
include("password.lua")

--Connect to the Database
function connectToDatabase()
	databaseObject = mysqloo.connect(DATABASE_HOST, DATABASE_USERNAME, DATABASE_PASSWORD, DATABASE_NAME, DATABASE_PORT)
	databaseObject.onConnected = function() print("[MSS CT] The server successfully connected to the database.") end
	databaseObject.onConnectionFailed = function() print("[MSS CT] The server failed to connect to the database.") end
	databaseObject:connect()
end

--Load taunts into FastDL
function loadtaunt()
	local query = databaseObject:query("SELECT location FROM `GM_taunts` WHERE download='1'")
	function query:onSuccess( data )
		if data[1] != nil then
			for i=1, #data do
				local location = data[i]["location"]
				resource.AddFile("sound/" .. location)
			end
			print("[MSS CT] Added files to FastDL")
		end
	end
	
	function query:onError()
		print("[MSS CT] There was a failure in retrieving the taunt info. Is the SQL server running?") 
	end
	
	query:start()
end

function sendct(location, disk)
	net.Start("mss.ct")
	net.WriteString(location)
	net.WriteBit(disk)
	net.Broadcast()
end

connectToDatabase()
--loadtaunt()

hook.Add( "PlayerSay", "mss.ct", function( ply, text, team )
	if !ply.cooldown or ply:IsAdmin() then
		local text = string.lower(text)
		local text = string.gsub(text, '%W','')
		local query = databaseObject:query("SELECT * FROM `GM_taunts` WHERE execute_word='" .. text .. "'")
		function query:onSuccess( data )
			if data[1] != nil then
				for i=1, #data do
					download = data[i]["download"]
					location = data[i]["location"]
					timeout = data[i]["timeout"]
					admin = data[i]["admin"]
				end

				--if admin is not required, send taunt
				if admin == 0 then
					sendct(location, download)
					--cooldown script
					ply.cooldown = true
					--remove cooldown after timeout
					timer.Simple(timeout, function()
						ply.cooldown = false
					end )
				--if admin is required, check if admin and send taunt
				elseif admin == 1 and ply:IsAdmin() then
					sendct(location, download)
				end
			end
		end
		
		function query:onError()
			print("[MSS CT] There was a failure in retrieving the taunt info. Is the SQL server running?") 
		end
		
		query:start()
	end
end
)