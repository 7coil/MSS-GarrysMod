util.AddNetworkString( "mss.url" )

hook.Add( "PlayerSay", "mss.url", function( ply, text, team )
	text = string.lower( text )
	if ( string.StartWith( text, "!settings" ) ) then
		sendurl(800,600,"MSS Settings","http://moustacheminer.com/gmtools/mss.settings", ply)
	elseif ( string.StartWith( text, "!taunts" ) ) then
		sendurl(800,600,"MSS Settings","http://moustacheminer.com/gmtools/taunts/", ply)
		return false
	elseif ( string.StartWith( text, "!lottery" ) ) then
		sendurl(300,200,"MSS Settings","http://moustacheminer.com/gmtools/lottery/?id=" .. ply:SteamID64(), ply)
	elseif ( string.StartWith( text, "!thebutton" ) ) then
		sendurl(300,200,"MSS Settings","http://moustacheminer.com/gmtools/thebutton/?id=" .. ply:SteamID64(), ply)
	elseif ( string.StartWith( text, "!report" ) ) then
		sendurl(800,600,"MSS Settings","http://moustacheminer.com/srcban/index.php?p=submit", ply)
	end
end
)

function sendurl(w, h, title, url, ply)
	net.Start("mss.url")
	net.WriteInt(w, 16)
	net.WriteInt(h, 16)
	net.WriteString(title)
	net.WriteString(url)
	net.Send(ply)
end