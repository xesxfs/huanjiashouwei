package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class §_-LR§ extends MovieClip
   {
       
      
      protected var target:Enemy;
      
      protected var durationTime:int;
      
      protected var durationTimeCounter:int;
      
      protected var §_-Lo§:Number;
      
      protected var §_-6k§:Number = 0;
      
      protected var §_-4W§:Number = 0;
      
      protected var §_-IR§:Number = 0;
      
      protected var §_-Jy§:Number = 0;
      
      protected var §_-0c§:Number = 0;
      
      protected var damage:int;
      
      protected var extraDamage:int;
      
      protected var minDamage:int;
      
      protected var maxDamage:int;
      
      protected var shielded:Boolean;
      
      protected var cRoot:Level;
      
      protected var §_-0Y§:MovieClip = null;
      
      public function §_-LR§(param1:Point, param2:Enemy)
      {
         super();
         this.x = param1.x;
         this.y = param1.y;
         this.target = param2;
         this.shielded = false;
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      protected function init(param1:Event) : void
      {
      }
      
      protected function hit() : void
      {
      }
      
      protected function setHeight() : void
      {
      }
      
      public function onFrameUpdate() : void
      {
         if(this.durationTimeCounter == this.durationTime)
         {
            this.destroyThis();
            return;
         }
         if(this.target == null || !this.target.isActive)
         {
            this.destroyThis();
            return;
         }
         this.hit();
         this.durationTimeCounter++;
         this.follow();
      }
      
      public function pause() : void
      {
         if(this.§_-0Y§ != null)
         {
            this.§_-0Y§.stop();
         }
         this.stop();
      }
      
      public function unPause() : void
      {
         this.play();
      }
      
      protected function §_-0W§() : void
      {
         this.§_-CZ§();
         this.§_-Lo§ = this.width = Math.sqrt(this.§_-4W§ * this.§_-4W§ + this.§_-6k§ * this.§_-6k§);
         this.setHeight();
         this.rotation = 360 - Math.atan2(-this.§_-IR§,this.§_-Jy§) * 180 / Math.PI;
      }
      
      protected function follow() : void
      {
         this.§_-CZ§();
         this.scaleX = this.scaleX * (1 + (Math.sqrt(this.§_-4W§ * this.§_-4W§ + this.§_-6k§ * this.§_-6k§) - this.§_-Lo§) / this.§_-Lo§);
         this.§_-Lo§ = Math.sqrt(this.§_-4W§ * this.§_-4W§ + this.§_-6k§ * this.§_-6k§);
         this.rotation = 360 - Math.atan2(-this.§_-IR§,this.§_-Jy§) * 180 / Math.PI;
         if(this.§_-0Y§ != null)
         {
            this.§_-0Y§.x = this.target.x + this.target.xAdjust;
            this.§_-0Y§.y = this.target.y + this.target.yAdjust;
         }
      }
      
      protected function getDamage() : void
      {
         var _loc1_:int = this.minDamage + Math.ceil(Math.random() * (this.maxDamage - this.minDamage));
         var _loc2_:int = 0;
         if(this.target != null && this.target.isActive)
         {
            if(_loc1_ > this.target.health)
            {
               _loc2_ = _loc1_ - this.target.health;
               _loc1_ = this.target.health;
            }
         }
         this.damage = _loc1_;
         this.extraDamage = _loc2_;
      }
      
      protected function §_-CZ§() : void
      {
         this.§_-4W§ = this.target.x + this.target.xAdjust - this.x;
         this.§_-6k§ = this.target.y + this.target.yAdjust - this.y;
         this.§_-0c§ = Math.atan2(this.§_-6k§,this.§_-4W§);
         this.§_-IR§ = Math.sin(this.§_-0c§);
         this.§_-Jy§ = Math.cos(this.§_-0c§);
      }
      
      protected function destroyThis() : void
      {
         this.target = null;
         if(this.§_-0Y§ != null)
         {
            this.cRoot.bullets.removeChild(this.§_-0Y§);
            this.§_-0Y§ = null;
         }
         this.cRoot = null;
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.parent.removeChild(this);
      }
   }
}
