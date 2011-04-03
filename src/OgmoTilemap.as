package
{
	import org.flixel.*;
	import flash.display.*;

	public class OgmoTilemap extends FlxTilemap
	{		
		public function OgmoTilemap(Width:int, Height:int):void
		{
			super();
			width = Width;
			height = Height;			
		}
		
		/*
		   Load a Tilemap type of layer
		*/ 
		public function loadTilemap(Layer:XML, TileGraphic:Class):OgmoTilemap
		{
			//refresh = true;

			//load graphics
			_tiles = FlxG.addBitmap(TileGraphic);
			
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
			
			// Set rectTiles
			for each (i in file.rect)
			{
				var startX:uint = i.@x;
				var startY:uint = i.@y;
				var tw:uint = i.@w / _tileWidth;
				var th:uint = i.@h / _tileHeight;

				for (var w:uint = 0; w < tw; ++w)
				{
					for (var h:uint = 0; h < th; ++h)
					{
						this.setTile((startX + (w*_tileWidth))/_tileWidth, (startY + (h*_tileHeight))/_tileHeight, i.@id, true);
					}
				}

			}

			// Set tiles
			var i:XML
			for each (i in file.tile)
			{
				this.setTile((i.@x / _tileWidth), (i.@y / _tileHeight), i.@id, true);
			}
						
			// Alocate the buffer to hold the rendered tiles
			var bw:uint = (FlxU.ceil(FlxG.width/ _tileWidth) + 1)*_tileWidth;
			var bh:uint = (FlxU.ceil(FlxG.height / _tileHeight) + 1)*_tileHeight;
			//_buffer = new BitmapData(bw,bh,true,0);
			
			
			//Update screen vars
			/*_screenRows = Math.ceil(FlxG.height/_tileHeight)+1;
			if(_screenRows > heightInTiles)
				_screenRows = heightInTiles;
			_screenCols = Math.ceil(FlxG.width/_tileWidth)+1;
			if(_screenCols > widthInTiles)
				_screenCols = widthInTiles;*/
			
			//_bbKey = String(TileGraphic);
			//generateBoundingTiles();
			refreshHulls();

			//_flashRect.x = 0;
			//_flashRect.y = 0;
			//_flashRect.width = _buffer.width;
			//_flashRect.height = _buffer.height;

			
			return this;
		}
		
		/*
		   Load a grid type of layer.
		   
		   If you want to use the grid as an invisible tilemap to use it for
		   collision, provide a transparent png as TileGraphic.
		*/
		public function loadGrid(Layer:XML, TileGraphic:Class):FlxTilemap
		{

			var data:String = Layer.toString();
			var array:Array = new Array();
			
			var l:Array = data.split("\n");
			
			widthInTiles = l[0].length();
			
			var tmpString:String = ""
			for each(var i:String in l)
			{
				tmpString += i;
			}
			
			array = tmpString.split("");
			data = arrayToCSV(array, widthInTiles);
			return new FlxTilemap().loadMap(data, TileGraphic);
		}		
	}
}
