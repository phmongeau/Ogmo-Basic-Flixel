package
{
	import org.flixel.*;

	public class PlayState extends FlxState
	{
		[Embed(source = 'data/levels/Level1.oel', mimeType = 'application/octet-stream')] private var Level1:Class;
		[Embed(source="data/tiles.png")] private var ImgTiles:Class;
		
		override public function create():void
		{
            var level:OgmoLevel = new OgmoLevel(new Level1);
            var map:FlxTilemap = level.loadTilemap(level.xml.stage[0], ImgTiles);
            var map2:FlxTilemap = level.loadTilemap(level.xml.stage2[0], ImgTiles);

            add(map);
            add(map2);

		}
	}
}
