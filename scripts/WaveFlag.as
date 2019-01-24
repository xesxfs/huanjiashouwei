package
{
   import com.reintroducing.sound.SoundManager;
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.ColorTransform;
   import flash.geom.Point;
   import flash.geom.Transform;
   import ironhide.utils.tooltip.TooltipWave;
   
   public class WaveFlag extends MovieClip
   {
       
      
      public var Arrow:MovieClip;
      
      public var §_-1X§:MovieClip;
      
      private var time:int;
      
      private var §_-Q1§:Boolean;
      
      private var initPoint:Point;
      
      private var §_-EG§:Point;
      
      private var §_-Og§:Boolean;
      
      private var §_-Mn§:Number;
      
      private var §_-Rp§:int = 0;
      
      private var §_-8r§:int = 0;
      
      private var dynamic:Number = 0;
      
      private var §_-FO§:Number = 1;
      
      private var §_-1v§:Number = 16;
      
      private var §_-0y§:Number = 0;
      
      private var §_-FK§:Number = 0;
      
      private var §_-9Q§:Number;
      
      private var §_-IF§:Sprite;
      
      private var §_-F5§:Shape;
      
      private var redControl:int = 0;
      
      private var wave:Wave;
      
      private var level:Level;
      
      public function WaveFlag(param1:Level, param2:Point, param3:Point, param4:int, param5:Wave, param6:Boolean = false, param7:Boolean = false)
      {
         this.§_-9Q§ = this.§_-1v§ / 4;
         this.§_-IF§ = new Sprite();
         this.§_-F5§ = new Shape();
         super();
         this.level = param1;
         this.wave = param5;
         this.§_-EG§ = param3;
         this.initPoint = param2;
         this.x = param2.x;
         this.y = param2.y;
         this.§_-Og§ = param6;
         this.time = param4;
         this.§_-Mn§ = 360 / this.time;
         this.§_-Q1§ = false;
         if(param7)
         {
            this.§_-1X§.gotoAndStop("air");
         }
         else
         {
            this.§_-1X§.gotoAndStop("ground");
         }
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      private function init(param1:Event) : void
      {
         this.§_-IF§.x = this.§_-0y§;
         this.§_-IF§.y = this.§_-FK§;
         this.addChild(this.§_-IF§);
         this.§_-IF§.rotation = 90;
         this.§_-IF§.scaleX = -1;
         this.swapChildren(this.§_-IF§,this.§_-1X§);
         this.§_-F5§.graphics.lineStyle(0,0);
         this.§_-F5§.graphics.moveTo(0,0);
         this.§_-F5§.graphics.lineTo(this.§_-1v§,0);
         this.§_-F5§.x = 0;
         this.§_-F5§.y = 0;
         this.§_-IF§.addChild(this.§_-F5§);
         this.Arrow.rotation = Math.atan2(this.y - this.§_-EG§.y,this.x - this.§_-EG§.x) * (180 / Math.PI) + 180;
         this.alpha = 0.1;
         this.scaleY = 0.1;
         this.scaleX = 0.1;
         this.level.§_-Ga§(this);
         this.addEventListener(MouseEvent.CLICK,this.§_-P6§,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OVER,this.§_-Tn§,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,this.§_-7K§,false,0,true);
      }
      
      public function onFrameUpdate() : void
      {
         this.§_-8r§++;
         this.increaseAngle();
         if(this.§_-Og§)
         {
            if(this.§_-8r§ < 10 && this.alpha < 1)
            {
               this.alpha = this.scaleX = this.scaleY = this.scaleY + 0.1;
            }
            this.§_-7F§();
            return;
         }
         if(this.§_-8r§ < 10 && this.alpha < 1)
         {
            this.alpha = this.scaleX = this.scaleY = this.scaleY + 0.1;
         }
         else if(this.§_-8r§ < this.time)
         {
            this.§_-7F§();
         }
         else if(this.§_-8r§ > this.time && this.§_-8r§ < this.time + 6)
         {
            this.scaleY = this.scaleY * 1.05;
            this.scaleX = this.scaleX * 1.05;
         }
         else if(this.§_-8r§ > this.time + 6)
         {
            this.scaleY = this.scaleY * 0.7;
            this.scaleX = this.scaleX * 0.7;
            this.alpha = this.alpha * 0.7;
         }
         if(this.alpha <= 0)
         {
            this.destroyThis();
         }
      }
      
      public function pause() : void
      {
      }
      
      public function unPause() : void
      {
      }
      
      private function §_-P6§(param1:MouseEvent) : void
      {
         if(this.§_-8r§ < this.time || this.§_-Og§)
         {
            this.removeEventListener(MouseEvent.CLICK,this.§_-P6§);
            this.removeEventListener(MouseEvent.ROLL_OVER,this.§_-Tn§);
            this.removeEventListener(MouseEvent.ROLL_OUT,this.§_-7K§);
            this.level.removeToopTip();
            this.level.§_-P6§(new Point(this.x,this.y));
            this.level.freeMenues();
         }
      }
      
      private function §_-Tn§(param1:MouseEvent) : void
      {
         this.level.addToopTip(new TooltipWave(new Point(this.x + 20,this.y - 15),new Point(this.x - 20,this.y - 15),130,{"title":Locale.loadStringEx("C_WAVE",Locale.getDefaultLang()) + " " + (this.level.currentWave + 1)},this.wave.getToolTip(this.level),this.level.mode));
         this.level.game.gameSounds.playGUIMouseOverCommon();
         this.buttonMode = true;
         this.mouseChildren = false;
         this.useHandCursor = true;
      }
      
      private function §_-7K§(param1:MouseEvent) : void
      {
         this.level.removeToopTip();
         this.level.game.gameSounds.stopGUIMouseOverCommon();
         this.useHandCursor = false;
      }
      
      private function §_-7F§() : void
      {
         this.§_-Rp§++;
         if(this.§_-Rp§ <= 10)
         {
            this.scaleX = this.scaleX * 1.01;
            this.scaleY = this.scaleY * 1.01;
         }
         else if(this.§_-Rp§ > 10 && this.§_-Rp§ <= 20)
         {
            this.scaleX = this.scaleX * 0.99;
            this.scaleY = this.scaleY * 0.99;
         }
         else
         {
            this.§_-Rp§ = 0;
            this.redControl = 0;
            this.scaleX = this.scaleY = 1;
         }
      }
      
      private function §_-0x§() : void
      {
         var _loc1_:ColorTransform = new ColorTransform();
         _loc1_.redOffset = this.redControl;
         var _loc2_:Transform = new Transform(this);
         var _loc3_:Array = new Array();
         _loc3_.push(_loc2_);
         _loc2_.colorTransform = _loc1_;
      }
      
      private function updatePicture(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc2_:Number = param1 * Math.PI / 180;
         this.§_-F5§.graphics.clear();
         this.§_-F5§.graphics.lineStyle(1,16733440);
         this.§_-F5§.graphics.moveTo(0,0);
         this.§_-F5§.graphics.beginFill(16733440,1);
         _loc3_ = 0;
         while(_loc3_ <= param1)
         {
            this.§_-F5§.graphics.lineTo(this.§_-1v§ * Math.cos(_loc3_ * Math.PI / 180),-this.§_-1v§ * Math.sin(_loc3_ * Math.PI / 180));
            _loc3_++;
         }
         this.§_-F5§.graphics.lineTo(0,0);
         this.§_-F5§.graphics.endFill();
      }
      
      private function increaseAngle() : void
      {
         this.dynamic = this.dynamic + this.§_-Mn§;
         if(this.dynamic > 360)
         {
            this.dynamic = 360;
            this.§_-Mn§ = 0;
         }
         this.updatePicture(this.dynamic);
      }
      
      public function §_-L5§() : void
      {
         if(this.§_-8r§ < this.time)
         {
            this.§_-8r§ = this.time;
         }
         this.§_-Q1§ = true;
         this.§_-Og§ = false;
      }
      
      public function destroyThis(param1:Boolean = true) : void
      {
         if(param1)
         {
            SoundManager.getInstance().playSound("wave_incoming",this.level.game.gameSounds.§_-5A§,0,0);
         }
         if(!this.§_-Q1§)
         {
            this.level.fearless = false;
            this.level.§_-5t§(this);
         }
         this.wave = null;
         this.level = null;
         this.§_-IF§ = null;
         this.§_-F5§ = null;
         this.removeChild(this.Arrow);
         this.Arrow = null;
         this.removeChild(this.§_-1X§);
         this.§_-1X§ = null;
         this.removeEventListener(MouseEvent.CLICK,this.§_-P6§);
         this.removeEventListener(MouseEvent.ROLL_OVER,this.§_-Tn§);
         this.removeEventListener(MouseEvent.ROLL_OUT,this.§_-7K§);
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.parent.removeChild(this);
      }
   }
}
