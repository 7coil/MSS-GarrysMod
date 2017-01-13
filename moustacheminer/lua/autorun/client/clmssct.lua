--Recieve ChatTaunts
net.Receive( "mss.ct", function()
	print("[MSS CT] Data recieved!")
	local soundfile = net.ReadString()
	local disk = net.ReadBool()
	if ("0" == file.Read("mssct_enable.txt", "DATA")) then
		return print("[MSS CT] Taunt has been blocked due to Settings. To enable, use the command: mssct_enable")
	end
	
	--print(disk)
	if (disk) then
		sound.PlayURL("http://moustacheminer.com/fastdl/sound/" .. soundfile, "", function( station )
			if ( IsValid( station ) ) then
				station:SetPos( LocalPlayer():GetPos() )
				station:Play()
			else
				LocalPlayer():ChatPrint( "Invalid URL!" )
			end
		end )
		--print("Playing sound: http://moustacheminer.com/fastdl/sound/" .. soundfile)
	else
		sound.PlayFile("sound/" .. soundfile, "", function( station )
			if ( IsValid( station ) ) then
				station:Play()
			end
		end )
	end
end )

concommand.Add( "mssct_disable", function()
	file.Write("mssct_enable.txt", "0")
end )

concommand.Add( "mssct_enable", function()
	file.Write("mssct_enable.txt", "1")
end )