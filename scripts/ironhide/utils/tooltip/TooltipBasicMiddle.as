package ironhide.utils.tooltip
{
   import fl.lang.Locale;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.text.AntiAliasType;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   public class TooltipBasicMiddle extends Tooltip
   {
       
      
      public var p:TextField;
      
      private var pFormat:TextFormat;
      
      private var hFormat:TextFormat;
      
      private var params:Object;
      
      private const colorGreen:String = "#b2ff57";
      
      private const colorRed:String = "#ff8657";
      
      private const colorBlue:String = "#7edcff";
      
      private const colorWhite:String = "#ffffff";
      
      private const colorNote:String = "#cccccc";
      
      public function TooltipBasicMiddle(param1:Point, param2:Point, param3:int, param4:Object)
      {
         this.pFormat = new TextFormat();
         this.hFormat = new TextFormat();
         super(param1,param2,false,true);
         if(param4.width)
         {
            param3 = param4.width;
         }
         this.params = param4;
         this.p.htmlText = param4.text;
         this.loadExtra();
         this.pFormat.leading = -1;
         this.pFormat.letterSpacing = 0;
         this.p.setTextFormat(this.pFormat);
         this.hFormat.leading = -2;
         this.hFormat.letterSpacing = 0;
         this.hFormat.bold = true;
         this.p.width = param3 - this.padding;
         this.p.autoSize = TextFieldAutoSize.LEFT;
         var _loc5_:* = this.p.height + this.padding * 2;
         var _loc6_:* = param3 + this.padding * 2;
         this.createFill(_loc6_,_loc5_);
      }
      
      override protected function init(param1:Event) : void
      {
         this.addChildAt(tFill,0);
         this.positionToolTip();
         this.p.x = this.tFill.x + this.padding * 1.5;
         this.p.y = this.tFill.y + this.padding - 2;
         this.p.antiAliasType = AntiAliasType.ADVANCED;
      }
      
      private function loadExtra() : void
      {
         var _loc1_:Array = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(this.params.atts != null)
         {
            _loc1_ = this.params.atts;
            this.p.htmlText = this.p.htmlText + "<br />";
            _loc2_ = 0;
            while(_loc2_ < _loc1_.length)
            {
               this.p.htmlText = this.p.htmlText + _loc1_[_loc2_][0] + ": " + "<font color=\"" + this.getColor(_loc1_[_loc2_][2]) + "\">" + _loc1_[_loc2_][1] + "</font>\n";
               _loc2_++;
            }
         }
         if(this.params.extras != null)
         {
            this.p.htmlText = this.p.htmlText + "\n" + Locale.loadStringEx("C_UNLOCKS",Locale.getDefaultLang()) + " :\n";
            _loc3_ = 0;
            while(_loc3_ < this.params.extras.length)
            {
               this.p.htmlText = this.p.htmlText + "<font color=\"" + this.colorBlue + "\">" + this.params.extras[_loc3_] + "</font>\n";
               _loc3_++;
            }
         }
         if(this.params.notes != null)
         {
            this.p.htmlText = this.p.htmlText + "\n<font color=\"" + this.colorNote + "\"><i>" + this.params.notes + "</i></font>";
         }
      }
      
      private function getColor(param1:String) : String
      {
         switch(param1)
         {
            case "green":
               return this.colorGreen;
            case "red":
               return this.colorRed;
            case "blue":
               return this.colorBlue;
            case "white":
               return this.colorWhite;
            default:
               return "";
         }
      }
      
      override public function positionToolTip() : *
      {
         this.x = this.position.x + this.margin;
         this.y = this.position.y - this.margin;
         this.tFill.y = 0 - this.tFill.height;
         if(this.side == -1)
         {
            this.x = this.x + this.width / 2;
            this.pointer.x = this.width / 2;
         }
         else
         {
            this.x = this.x - this.width / 2;
            this.pointer.x = this.width / 2;
         }
      }
      
      override public function destroyThis() : void
      {
         this.pFormat = null;
         this.hFormat = null;
         this.params = null;
         this.removeChild(this.p);
         this.p = null;
         this.removeChild(this.tFill);
         this.tFill = null;
         this.removeChild(this.pointer);
         this.pointer = null;
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.parent.removeChild(this);
      }
   }
}
