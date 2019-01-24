package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class Soul extends MovieClip
   {
       
      
      protected var isActive:Boolean;
      
      protected var hitTime:int = 6;
      
      protected var hitTimeCounter:int = 0;
      
      protected var §_-Te§:Boolean;
      
      protected var §_-CA§:int = 9;
      
      protected var §_-O3§:int = 0;
      
      protected var §_-6O§:Point;
      
      protected var §_-Jy§:Number;
      
      protected var §_-IR§:Number;
      
      protected var aceleration:Number = 5.5;
      
      protected var cRoot:Level;
      
      public function Soul(param1:Point, param2:Point)
      {
         super();
         addFrameScript(20,this.frame21,27,this.frame28);
         this.x = param1.x;
         this.y = param1.y;
         this.isActive = true;
         this.§_-Te§ = true;
         this.§_-6O§ = param2;
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
      }
      
      public function onFrameUpdate() : void
      {
         if(!this.isActive)
         {
            if(this.hitTimeCounter < this.hitTime)
            {
               this.hitTimeCounter++;
               return;
            }
            this.destroyThis();
            return;
         }
         if(this.§_-Te§)
         {
            if(this.§_-O3§ < this.§_-CA§)
            {
               this.§_-O3§++;
               return;
            }
            this.§_-Te§ = false;
         }
         this.moveMe();
      }
      
      public function pause() : void
      {
         this.stop();
      }
      
      public function unPause() : void
      {
         switch(this.currentFrameLabel)
         {
            case "travelEnd":
               this.gotoAndPlay("travel");
               break;
            case "hitEnd":
               break;
            default:
               this.play();
         }
      }
      
      protected function moveMe() : void
      {
         var _loc1_:Number = 0;
         var _loc2_:Number = 0;
         var _loc3_:Number = 0;
         _loc1_ = this.§_-6O§.y - this.y;
         _loc2_ = this.§_-6O§.x - this.x;
         _loc3_ = Math.atan2(_loc1_,_loc2_);
         this.§_-IR§ = Math.sin(_loc3_) * this.aceleration;
         this.§_-Jy§ = Math.cos(_loc3_) * this.aceleration;
         this.rotation = 360 - Math.atan2(-this.§_-IR§,this.§_-Jy§) * 180 / Math.PI;
         this.x = this.x + this.§_-Jy§;
         this.y = this.y + this.§_-IR§;
         this.freeParticles();
         if(Math.sqrt(Math.pow(this.§_-6O§.y - this.y,2) + Math.pow(this.§_-6O§.x - this.x,2)) < this.aceleration)
         {
            this.isActive = false;
            this.hitTimeCounter = 0;
            this.gotoAndPlay("hit");
         }
      }
      
      private function freeParticles() : void
      {
         this.§_-A8§(new Point(this.x,this.y));
         this.§_-A8§(new Point(this.x + this.§_-Jy§ / 2,this.y + this.§_-IR§ / 2));
      }
      
      protected function §_-A8§(param1:Point) : void
      {
         var _loc3_:VeznanSoulParticle = null;
         var _loc2_:VeznanSoulParticle = null;
         for each(_loc3_ in this.cRoot.game.main.veznanParticlesPool)
         {
            if(!_loc3_.isActive)
            {
               _loc3_.§_-Rt§(param1,this.cRoot.bulletsDecals);
               return;
            }
            if(_loc2_ == null || _loc2_.§_-My§ < _loc3_.§_-My§)
            {
               _loc2_ = _loc3_;
            }
         }
         _loc2_.§_-Rt§(param1,this.cRoot.bulletsDecals);
      }
      
      protected function destroyThis() : void
      {
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.cRoot = null;
         this.parent.removeChild(this);
      }
      
      function frame21() : *
      {
         gotoAndPlay("travel");
      }
      
      function frame28() : *
      {
         stop();
      }
   }
}
