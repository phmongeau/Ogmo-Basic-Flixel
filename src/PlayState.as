package
{
	import org.flixel.*;

	public class PlayState extends FlxState
	{
		[Embed(source = 'data/levels/Level1.oel', mimeType = 'application/octet-stream')]
			private var Level1:Class;
		[Embed(source="data/tiles.png")]
			private var ImgTiles:Class;
		
		private var map:FlxTilemap;
		private var map2:FlxTilemap;

		private var box:FlxSprite;

		override public function create():void
		{
			//Load an Ogmo level File
			var level:OgmoLevel = new OgmoLevel(new Level1);
			
			//Load each layers
			map = level.loadTilemap("stage", ImgTiles);
			map2 = level.loadTilemap("stage2", ImgTiles);

			//add the layers to the state
			add(map);
			add(map2);

			//Add a sprite just to test collisions
			box = new FlxSprite(300, 200);
			box.makeGraphic(8,8,0xffffffff);
			box.acceleration.y = 200;
			add(box);

			//Add a little patrolling box to demo FlxPath
			for each(var p:XML in level.xml.actors[0].patrol)
			{
				//Create a simple FlxSprite
				var patrol:FlxSprite = new FlxSprite(p.@x, p.@y);
				patrol.makeGraphic(8,8,0xffffffff);
				add(patrol);

				//add each node to the FlxPath
				for each(var n:XML in p.node)
				{
					patrol.path.add(n.@x, n.@y);
				}
				// And, finaly, follow the path
				patrol.followPath(patrol.path, 100, FlxObject.PATH_LOOP_FORWARD);
			}

			FlxG.debug = true;

		}

		override public function update():void
		{
			FlxG.collide();
			super.update();
		}
	}
}
