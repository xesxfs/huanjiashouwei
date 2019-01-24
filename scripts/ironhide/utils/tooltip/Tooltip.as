package ironhide.utils.tooltip
{
   import flash.display.GradientType;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class Tooltip extends MovieClip
   {
       
      
      public var padding:int = 6;
      
      public var margin:int = 5;
      
      public var position:Point;
      
      public var positionAux:Point;
      
      public var tFill:Sprite;
      
      public var pointer:MovieClip;
      
      public var side:int = 1;
      
      public function Tooltip(param1:Point, param2:Point, param3:Boolean = false, param4:Boolean = false)
      {
         this.tFill = new Sprite();
         super();
         this.position = param1;
         this.positionAux = param2;
         if(!param4)
         {
            if(!param3)
            {
               this.pointer = new §_-8d§();
            }
            else
            {
               this.pointer = new TooltipPointerUpgrade();
            }
         }
         else
         {
            this.pointer = new §_-T4§();
         }
         this.addChild(this.pointer);
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      protected function init(param1:Event) : void
      {
      }
      
      public function createFill(param1:Number, param2:Number) : *
      {
         var _loc3_:Matrix = new Matrix();
         _loc3_.createGradientBox(param1,param2,Math.PI / 2,0,0);
         this.tFill.graphics.lineStyle(1);
         this.tFill.graphics.lineGradientStyle(GradientType.LINEAR,[13027014,0],[1,1],[0,255],_loc3_);
         this.tFill.graphics.beginFill(2236178);
         this.tFill.graphics.drawRoundRect(0,0,param1,param2,5);
         this.tFill.graphics.endFill();
         this.tFill.alpha = 0.85;
         this.pointer.alpha = 0.85;
      }
      
      public function positionToolTip() : *
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
            this.y = this.positionAux.y + this.margin;
            this.pointer.y = -5;
            this.pointer.scaleY = 1;
            this.tFill.y = 0;
         }
      }
      
      public function destroyThis() : void
      {
         this.removeChild(this.pointer);
         this.pointer = null;
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.parent.removeChild(this);
      }
   }
}
