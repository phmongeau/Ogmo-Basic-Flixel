package
{
	import org.flixel.*;

	public class OgmoTilemap extends FlxTilemap
	{
		public function OgmoTilemap():void
		{
			super();
		}
		
		public function loadOgmo(File:String, TileGraphic:Class):FlxTilemap
		{
			//load graphics
			_pixels = FlxG.addBitmap(TileGraphic);
			
			//figure out the map dimmesions based on the xml and set variables
			var xml:XML = new XML(File);
			
			_tileWidth = xml.stage[0].@tileWidth;
			_tileHeight = xml.stage[0].@tileHeight;
			
			widthInTiles = xml.width / _tileWidth;
			heightInTiles = xml.height / _tileHeight;
			
			totalTiles = widthInTiles * heightInTiles;
			
			width = xml.width;
			height = xml.height;
			
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
			for each (i in xml.stage[0].tile)
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
	}
}