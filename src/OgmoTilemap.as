package
{
	import org.flixel.*;

	public class OgmoTilemap extends FlxTilemap
	{

		public var xml:XML;
		
		public function OgmoTilemap(File:String):void
		{
			super();
			xml = new XML(File);
			width = xml.width;
			height = xml.height;			
            FlxU.setWorldBounds(0,0,width,height);
		}
		
		public function loadTilemap(Layer:XML, TileGraphic:Class):FlxTilemap
		{
			//load graphics
			_pixels = FlxG.addBitmap(TileGraphic);
			
			var file:XML = Layer;
			
			//figure out the map dimmesions based on the xml and set variables			
			_tileWidth = file.@tileWidth;
			_tileHeight = file.@tileHeight;
			
			widthInTiles = width / _tileWidth;
			heightInTiles = height / _tileHeight;
			
			totalTiles = widthInTiles * heightInTiles;
			
			_block.width = _tileWidth;
			_block.height = _tileHeight;
			
			//Initialize the data
			_data = new Array();
			for(var di:int; di < totalTiles; di++)
			{
				_data.push(0);
			}
			
			// Not sure yet
			_rects = new Array(totalTiles);
			
			// Set tiles
			var i:XML
			for each (i in file.tile)
			{
				this.setTile((i.@x / _tileWidth), (i.@y / _tileHeight), i.@id);
			}
			
			//Update screen vars
			_screenRows = Math.ceil(FlxG.height / _tileHeight) + 1;
			if(_screenRows > heightInTiles) _screenCols = widthInTiles;
			
			//Add Objects
			//insert code later...
			
			//Refresh collison data
			refreshHulls();
			
			return this;
		}
		
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
	}
}
