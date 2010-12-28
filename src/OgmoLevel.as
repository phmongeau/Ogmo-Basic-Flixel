package
{
	import org.flixel.*;

	public class OgmoLevel
	{

		public var xml:XML;
		public var width:uint;
		public var height:uint;
		
		public function OgmoLevel(File:String):void
		{
			super();
			xml = new XML(File);
			width = xml.width;
			height = xml.height;			
            FlxU.setWorldBounds(0,0,width,height);
		}
		
		public function loadTilemap(Layer:XML, TileGraphic:Class):FlxTilemap
		{
			//var tilemap:OgmoTilemap = new OgmoTilemap(width, height, Layer, TileGraphic);
			return new OgmoTilemap(width, height, Layer, TileGraphic);
		}
		/*
		public function loadGrid(Layer:XML, TileGraphic:Class):FlxTilemap
		{

			var data:String = Layer.toString();
			var array:Array = new Array();
			
			//find the width in tiles:
			var l:Array = data.split("\n");
			var tmpString:String = ""
			for each(var i:String in l)
			{
				tmpString += i;
			}
			
			array = tmpString.split("");
			data = arrayToCSV(array, widthInTiles);
			FlxG.log(data);
			return new FlxTilemap().loadMap(data, TileGraphic);
		}
		*/
	}
}
