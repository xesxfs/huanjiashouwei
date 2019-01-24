package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class VeznanSoul extends MovieClip
   {
       
      
      protected var isActive:Boolean;
      
      protected var hitTime:int = 6;
      
      protected var hitTimeCounter:int = 0;
      
      protected var §_-FW§:Number;
      
      protected var §_-CF§:Number = 70;
      
      protected var angleVariationMin:Number = -70;
      
      protected var §_-D5§:Number = 0;
      
      protected var angleVariationDirection:int;
      
      protected var §_-Jy§:Number;
      
      protected var §_-IR§:Number;
      
      protected var aceleration:int;
      
      protected var cRoot:Level;
      
      public function VeznanSoul(param1:Point, param2:Number)
      {
         super();
         addFrameScript(10,this.frame11,17,this.frame18);
         this.aceleration = this.getRandom(5,15);
         if(Math.random() > 0.5)
         {
            this.angleVariationDirection = 1;
         }
         else
         {
            this.angleVariationDirection = -1;
         }
         this.x = param1.x;
         this.y = param1.y;
         this.isActive = true;
         this.§_-FW§ = param2;
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
            case "hitEnd":
               break;
            default:
               this.play();
         }
      }
      
      protected function moveMe() : void
      {
         if(this.x > 700 || this.x < 0 || (this.y < 0 || this.y > 600))
         {
            this.destroyThis();
            return;
         }
         var _loc1_:Number = 0;
         _loc1_ = _loc1_ = (this.§_-FW§ + this.§_-D5§) * Math.PI / 180;
         this.§_-IR§ = Math.sin(_loc1_) * this.aceleration;
         this.§_-Jy§ = Math.cos(_loc1_) * this.aceleration;
         this.rotation = 360 - Math.atan2(-this.§_-IR§,this.§_-Jy§) * 180 / Math.PI;
         this.x = this.x + this.§_-Jy§;
         this.y = this.y + this.§_-IR§;
         this.freeParticles();
         if(this.angleVariationDirection == 1)
         {
            if(this.§_-D5§ >= this.§_-CF§)
            {
               this.angleVariationDirection = -1;
               return;
            }
            this.§_-D5§ = this.§_-D5§ + 5;
         }
         else
         {
            if(this.§_-D5§ <= this.angleVariationMin)
            {
               this.angleVariationDirection = 1;
               return;
            }
            this.§_-D5§ = this.§_-D5§ - 5;
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
      
      public function getRandom(param1:*, param2:*) : Number
      {
         var _loc3_:Number = NaN;
         _loc3_ = Math.round(Math.random() * (param2 - param1)) + param1;
         return _loc3_;
      }
      
      protected function destroyThis() : void
      {
         this.cRoot = null;
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.parent.removeChild(this);
      }
      
      function frame11() : *
      {
         gotoAndPlay("travel");
      }
      
      function frame18() : *
      {
         stop();
      }
   }
}
