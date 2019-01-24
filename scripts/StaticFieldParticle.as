package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class StaticFieldParticle extends MovieClip
   {
       
      
      private var isActive:Boolean;
      
      private var §_-K7§:Boolean;
      
      private var fadeOutTime:int;
      
      private var fadeOutTimeCounter:int;
      
      private var destinationPoint:Point;
      
      private var §_-Jy§:Number;
      
      private var §_-IR§:Number;
      
      private var speed:Number;
      
      private var currentDesviation:Number = 2;
      
      private var §_-Ry§:int;
      
      private var maxDesviation:Number = 5;
      
      private var §_-MS§:int;
      
      private var §_-HY§:int;
      
      public function StaticFieldParticle(param1:Point, param2:Point)
      {
         super();
         this.isActive = true;
         this.§_-K7§ = false;
         this.x = param1.x;
         this.y = param1.y;
         this.destinationPoint = param2;
         this.speed = 3;
         this.fadeOutTime = 7;
         this.fadeOutTimeCounter = 0;
         this.§_-MS§ = Math.round(Math.random() * 15);
         this.§_-Ry§ = this.§_-Lb§();
         this.currentDesviation = Math.round(Math.random() * 3) * this.§_-Ry§;
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      protected function init(param1:Event) : void
      {
         this.§_-FU§();
         this.alpha = 0;
      }
      
      public function onFrameUpdate() : void
      {
         if(!this.isActive)
         {
            this.fadeOut();
            return;
         }
         if(this.§_-HY§ < this.§_-MS§)
         {
            this.§_-HY§++;
            return;
         }
         if(!this.§_-K7§)
         {
            this.scaleX = this.scaleY = Math.random() + 0.5;
            this.alpha = 1;
            this.§_-K7§ = true;
         }
         var _loc1_:Number = 0;
         var _loc2_:Number = 0;
         var _loc3_:Number = 0;
         var _loc4_:Number = 0;
         _loc1_ = this.destinationPoint.x - this.x;
         _loc2_ = this.destinationPoint.y - this.y;
         _loc3_ = Math.atan2(_loc2_,_loc1_);
         _loc4_ = _loc3_ / Math.PI * 180;
         _loc4_ = _loc4_ + this.currentDesviation;
         _loc3_ = _loc4_ / 180 * Math.PI;
         this.§_-IR§ = Math.sin(_loc3_) * this.speed;
         this.§_-Jy§ = Math.cos(_loc3_) * this.speed;
         this.currentDesviation = this.currentDesviation + 4;
         if(this.currentDesviation >= 45)
         {
            this.currentDesviation = 2 * this.§_-Ry§;
         }
         this.x = this.x + this.§_-Jy§;
         this.y = this.y + this.§_-IR§;
         this.scaleX = this.scaleX * 0.97;
         this.scaleY = this.scaleY * 0.97;
         if(Math.sqrt(Math.pow(this.destinationPoint.y - this.y,2) + Math.pow(this.destinationPoint.x - this.x,2)) < this.speed * 2)
         {
            this.isActive = false;
         }
      }
      
      public function pause() : void
      {
         this.stop();
      }
      
      public function unPause() : void
      {
         this.play();
      }
      
      public function fadeOut() : void
      {
         var _loc1_:Number = 1 / this.fadeOutTime;
         if(this.fadeOutTimeCounter >= this.fadeOutTime)
         {
            this.destroyThis();
         }
         this.alpha = this.alpha - _loc1_;
         this.fadeOutTimeCounter++;
      }
      
      private function §_-Lb§() : int
      {
         if(Math.ceil(Math.random() * 2) - 1 == 0)
         {
            return 1;
         }
         return -1;
      }
      
      private function §_-FU§() : void
      {
         var _loc1_:Number = 0;
         var _loc2_:Number = 0;
         var _loc3_:Number = Math.random() * 2 + 1.5;
         _loc1_ = (this.destinationPoint.x - this.x) / _loc3_;
         _loc2_ = (this.destinationPoint.y - this.y) / _loc3_;
         this.x = this.x + Math.sqrt(_loc1_ * _loc1_ + _loc2_ * _loc2_) * Math.cos(Math.atan2(_loc2_,_loc1_));
         this.y = this.y + Math.sqrt(_loc1_ * _loc1_ + _loc2_ * _loc2_) * Math.sin(Math.atan2(_loc2_,_loc1_));
      }
      
      private function destroyThis() : void
      {
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.parent.removeChild(this);
      }
   }
}
