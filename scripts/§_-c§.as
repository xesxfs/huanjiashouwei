package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class §_-c§ extends MovieClip
   {
       
      
      protected var level:int;
      
      protected var isActive:Boolean = true;
      
      protected var target:Enemy;
      
      protected var §_-Jy§:Number;
      
      protected var §_-IR§:Number;
      
      protected var aceleration:Number = 10;
      
      protected var minAceleration:Number;
      
      protected var §_-0m§:Number;
      
      protected var §_-KM§:Number;
      
      protected var cRoot:Level;
      
      public function §_-c§(param1:int, param2:Point, param3:Enemy, param4:Point)
      {
         super();
         this.x = param2.x;
         this.y = param2.y;
         this.level = param1;
         this.target = param3;
         this.minAceleration = 10;
         if(param4 != null)
         {
            this.§_-0m§ = param4.x;
            this.§_-KM§ = param4.y;
         }
         else
         {
            this.§_-0m§ = param3.x;
            this.§_-KM§ = param3.y;
         }
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      public function onFrameUpdate() : void
      {
         this.moveMe(false);
      }
      
      public function pause() : void
      {
         this.stop();
      }
      
      public function unPause() : void
      {
         if(this.currentFrameLabel != "idle" && this.currentFrameLabel != "hitEnd")
         {
            this.play();
         }
      }
      
      protected function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.cRoot.game.gameSounds.§_-PK§();
      }
      
      protected function moveMe(param1:Boolean) : void
      {
         var _loc2_:Number = 0;
         var _loc3_:Number = 0;
         var _loc4_:Number = 0;
         if(this.target == null || !this.target.isActive)
         {
            _loc2_ = this.§_-KM§ - this.y;
            _loc3_ = this.§_-0m§ - this.x;
         }
         else
         {
            _loc2_ = this.target.y + this.target.yAdjust - this.y;
            _loc3_ = this.target.x + this.target.xAdjust - this.x;
            this.§_-KM§ = this.target.y + this.target.yAdjust;
            this.§_-0m§ = this.target.x + this.target.xAdjust;
         }
         _loc4_ = Math.atan2(_loc2_,_loc3_);
         this.§_-IR§ = Math.sin(_loc4_) * this.aceleration;
         this.§_-Jy§ = Math.cos(_loc4_) * this.aceleration;
         this.rotation = 360 - Math.atan2(-this.§_-IR§,this.§_-Jy§) * 180 / Math.PI;
         if(param1 && this.§_-KM§ <= this.y)
         {
            this.y = this.y - 11;
         }
         this.x = this.x + this.§_-Jy§;
         this.y = this.y + this.§_-IR§;
         if(Math.sqrt(Math.pow(this.§_-KM§ - this.y,2) + Math.pow(this.§_-0m§ - this.x,2)) < this.aceleration)
         {
            if(this.target != null && this.target.isActive)
            {
               this.hitOnTarget();
            }
            else
            {
               this.destroyThis();
            }
         }
      }
      
      protected function hitOnTarget() : void
      {
         if(!this.target.dodgeAttack())
         {
            this.target.addDebuff(new DebuffNet(this.cRoot,this.level,this.target));
         }
         this.destroyThis();
      }
      
      protected function destroyThis() : void
      {
         this.cRoot = null;
         this.target = null;
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.parent.removeChild(this);
      }
   }
}
