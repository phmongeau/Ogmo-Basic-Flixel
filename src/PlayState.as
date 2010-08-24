package
{
	import org.flixel.*;

	public class PlayState extends FlxState
	{
		[Embed(source = 'data/levels/Level1.oel', mimeType = 'application/octet-stream')] private var Map:Class;
		[Embed(source="data/tiles.png")] private var ImgTiles:Class;
		
		override public function create():void
		{
			var map:OgmoTilemap = new OgmoTilemap();
			map.loadOgmo(new Map, ImgTiles);
			
			add(map);
		}
	}
}
