package
{
	import org.flixel.*;

	public class MenuState extends FlxState
	{
		override public function create():void
		{
			var t:FlxText;
			t = new FlxText(0,FlxG.height/2-10,FlxG.width,"OgmoBasic");
			t.size = 16;
			t.alignment = "center";
			add(t);
			t = new FlxText(FlxG.width/2-50,FlxG.height-20,100,"click to play");
			t.alignment = "center";
			add(t);
			
			FlxG.mouse.show();
			FlxG.debug = true;
		}

		override public function update():void
		{
			super.update();

			if(FlxG.mouse.justPressed())
			{
				FlxG.mouse.hide();
				FlxG.camera.fade(0xFFFF0000, 2, onFade)
				//FlxG.switchState(new PlayState());
			}
		}

		private function onFade():void
		{
			FlxG.switchState(new PlayState());
		}
	}
}
