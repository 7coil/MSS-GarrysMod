function openURL(w, h, title, url)

    Frame = vgui.Create( "DFrame" );
    Frame:SetTitle( title );
    Frame:SetSize( w, h + 24 );
     
    Panel = vgui.Create( "DPanel", Frame );
    Panel:SetPos( 0, 24 );
    Panel:SetSize( w, h + 24 );
     
    HTML = vgui.Create( "HTML", Panel );
    HTML:SetPos( 0, 0 );
    HTML:SetSize( w, h );
    HTML:OpenURL( url );
 
    Frame:Center();
    Frame:MakePopup();
     
end

--Receive MSS.GUI and display the URL provided by the server
net.Receive( "mss.url", function()
	print("[MSS URL] Data recieved!")
	local w = net.ReadInt(16)
	local h = net.ReadInt(16)
	local title = net.ReadString()
	local url = net.ReadString()
	
    openURL(w, h, title, url)
end )
