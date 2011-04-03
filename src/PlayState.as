package
{
	import org.flixel.*;

	public class PlayState extends FlxState
	{
		[Embed(source = 'data/levels/Level1.oel', mimeType = 'application/octet-stream')] private var Level1:Class;
		[Embed(source="data/tiles.png")] private var ImgTiles:Class;
		
		override public function create():void
		{
			//Load an Ogmo level File
			var level:OgmoLevel = new OgmoLevel(new Level1);
			
			//Load each layers
			var map:FlxTilemap = level.loadTilemap("stage", ImgTiles);
			var map2:FlxTilemap = level.loadTilemap("stage2", ImgTiles);

			//add the layers to the state
			add(map);
			add(map2);
			FlxG.debug = true;

		}
	}
}
