package ironhide.utils.tooltip
{
   import fl.lang.Locale;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.text.AntiAliasType;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   public class TooltipWave extends Tooltip
   {
       
      
      public var p:TextField;
      
      public var h1:TextField;
      
      private var pFormat:TextFormat;
      
      private var hFormat:TextFormat;
      
      private var params:Object;
      
      private var mode:int;
      
      private const colorGreen:String = "#b2ff57";
      
      private const colorGrey:String = "#cccccc";
      
      private const colorRed:String = "#ff8657";
      
      private const colorBlue:String = "#7edcff";
      
      private const colorWhite:String = "#ffffff";
      
      public function TooltipWave(param1:Point, param2:Point, param3:int, param4:Object, param5:Array, param6:int)
      {
         this.pFormat = new TextFormat();
         this.hFormat = new TextFormat();
         super(param1,param2);
         if(param4.width)
         {
            param3 = param4.width;
         }
         this.params = param4;
         this.mode = param6;
         if(this.mode == GameSettings.§_-AQ§)
         {
            this.h1.htmlText = "<b>" + Locale.loadStringEx("C_IRON_WAVE",Locale.getDefaultLang()) + "</b>";
         }
         else
         {
            this.h1.htmlText = "<b>" + param4.title + "</b>";
         }
         this.loadWave(param5);
         this.pFormat.leading = -1;
         this.pFormat.letterSpacing = 0;
         this.p.setTextFormat(this.pFormat);
         this.hFormat.leading = -2;
         this.hFormat.letterSpacing = 0;
         this.hFormat.bold = true;
         this.h1.setTextFormat(this.hFormat);
         this.h1.width = param3 - this.padding;
         this.p.width = param3 - this.padding;
         this.h1.autoSize = TextFieldAutoSize.LEFT;
         this.p.autoSize = TextFieldAutoSize.LEFT;
         var _loc7_:* = this.h1.height + this.p.height + this.padding * 2;
         var _loc8_:* = param3 + this.padding * 2;
         this.createFill(_loc8_,_loc7_);
         this.__setStr_h1_TooltipWave_h1_0();
      }
      
      override protected function init(param1:Event) : void
      {
         this.addChildAt(tFill,0);
         this.positionToolTip();
         this.h1.x = this.tFill.x + this.padding * 1.5;
         this.p.x = this.tFill.x + this.padding * 1.5;
         this.h1.y = this.tFill.y + this.padding;
         this.p.y = this.h1.y + this.h1.height - 2;
         this.p.antiAliasType = AntiAliasType.ADVANCED;
         this.h1.antiAliasType = AntiAliasType.ADVANCED;
      }
      
      override public function positionToolTip() : *
      {
         this.x = this.position.x + this.margin;
         this.y = this.position.y - this.margin;
         this.pointer.x = -5;
         this.pointer.y = 5;
         this.pointer.scaleY = -1;
         this.tFill.y = 0 - this.tFill.height;
         if(this.x + this.margin + this.tFill.width > stage.stageWidth)
         {
            this.x = this.positionAux.x - this.margin;
            this.pointer.x = 5;
            this.pointer.scaleX = -1;
            this.side = -1;
            this.tFill.x = 0 - this.tFill.width;
         }
         if(this.y - this.margin - this.tFill.height < stage.y)
         {
            this.y = this.positionAux.y + 30 + this.margin;
            this.pointer.y = -5;
            this.pointer.scaleY = 1;
            this.tFill.y = 0;
         }
      }
      
      private function loadWave(param1:*) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         this.p.htmlText = "";
         if(param1 != null)
         {
            _loc2_ = param1;
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length)
            {
               this.p.htmlText = this.p.htmlText + "<font color=\"" + this.colorGreen + "\">" + _loc2_[_loc3_][0] + "</font>" + "<font color=\"" + this.colorGrey + "\">" + (this.mode == GameSettings.§_-AQ§?"??":"x" + _loc2_[_loc3_][1]) + "</font>\n";
               _loc3_++;
            }
         }
      }
      
      override public function destroyThis() : void
      {
         this.pFormat = null;
         this.hFormat = null;
         this.params = null;
         this.removeChild(this.p);
         this.p = null;
         this.removeChild(this.h1);
         this.h1 = null;
         this.removeChild(this.tFill);
         this.tFill = null;
         this.removeChild(this.pointer);
         this.pointer = null;
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.parent.removeChild(this);
      }
      
      function __setStr_h1_TooltipWave_h1_0() : *
      {
         if(this.h1 == null)
         {
            Locale.addDelayedInstance({
               "parent":this,
               "instanceName":"h1"
            },"IDS_TOWER_BARRACKS_NAME");
         }
         else if(Locale.checkXMLStatus())
         {
            this.h1.text = Locale.loadString("IDS_TOWER_BARRACKS_NAME");
         }
         else
         {
            Locale.addDelayedInstance(this.h1,"IDS_TOWER_BARRACKS_NAME");
         }
      }
   }
}
