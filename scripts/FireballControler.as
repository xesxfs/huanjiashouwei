package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class FireballControler extends MovieClip
   {
       
      
      private var cRoot:Level;
      
      private var durationTime:int = 31;
      
      private var durationTimeCounter:int = 0;
      
      private var initPoint:Point;
      
      private var §_-Cv§:Point;
      
      private var §_-2r§:int = 580;
      
      private var §_-37§:int = 600;
      
      private var minDesviation:int = 0;
      
      private var maxDesviation:int = 15;
      
      private var §_-4u§:Boolean;
      
      private var durationCataclysmTime:int = 51;
      
      private var durationCataclysmTimeCounter:int = 0;
      
      public function FireballControler(param1:Level, param2:Point)
      {
         super();
         this.cRoot = param1;
         this.§_-Cv§ = param2;
         this.initPoint = new Point(param2.x,this.§_-Cv§.y);
         if(this.cRoot.game.gameUpgrades.rainUpBlazingSkies == true)
         {
            this.durationTime = this.durationTime + 20;
         }
         if(this.cRoot.game.gameUpgrades.rainsUpBiggerAndMeaner == true && (this.cRoot.maxUpgradeLevel == 0 || this.cRoot.maxUpgradeLevel >= 3))
         {
            this.maxDesviation = this.maxDesviation + 10;
         }
         if(this.cRoot.game.gameUpgrades.rainUpCataclysm && (this.cRoot.maxUpgradeLevel == 0 || this.cRoot.maxUpgradeLevel == 5))
         {
            this.§_-4u§ = true;
         }
         else
         {
            this.§_-4u§ = false;
         }
         this.cRoot.§for §();
      }
      
      public function onFrameUpdate() : void
      {
         if(this.durationTime == this.durationTimeCounter && !this.§_-4u§)
         {
            this.destroyThis();
            return;
         }
         if(this.§_-4u§ && this.durationCataclysmTime == this.durationCataclysmTimeCounter)
         {
            this.destroyThis();
            return;
         }
         this.durationTimeCounter++;
         this.durationCataclysmTimeCounter++;
         if(this.durationTimeCounter < this.durationTime)
         {
            if(this.durationTimeCounter % 10 == 0)
            {
               this.freeFireball();
            }
         }
         if(this.§_-4u§ && this.durationCataclysmTimeCounter < this.durationCataclysmTime)
         {
            if(this.durationCataclysmTimeCounter % 10 == 0)
            {
               this.freeFireballCataclysm();
            }
         }
      }
      
      public function pause() : void
      {
      }
      
      public function unPause() : void
      {
      }
      
      private function freeFireball() : void
      {
         var _loc1_:Number = this.getSign();
         var _loc2_:Number = this.getSign();
         var _loc3_:Number = this.initPoint.x + _loc1_ * this.getRandom(this.minDesviation,this.maxDesviation);
         var _loc5_:Number = this.§_-Cv§.x + _loc1_ * this.getRandom(this.minDesviation,this.maxDesviation);
         var _loc6_:Number = this.§_-Cv§.y + _loc2_ * this.getRandom(this.minDesviation,this.maxDesviation);
         this.cRoot.bullets.addChild(new Fireball(new Point(_loc3_,0),new Point(_loc5_,_loc6_)));
      }
      
      private function freeFireballCataclysm() : void
      {
         var _loc1_:Number = this.getSign();
         var _loc2_:Number = this.getSign();
         var _loc3_:Point = this.getCataclysmDestination();
         var _loc4_:Number = _loc3_.x;
         this.cRoot.bullets.addChild(new Fireball(new Point(_loc4_,0),_loc3_));
      }
      
      private function getCataclysmDestination() : Point
      {
         var _loc1_:int = 0;
         var _loc2_:int = Math.floor(this.getRandom(0,this.cRoot.paths.length - 1));
         if(this.cRoot.hasTunnels && this.cRoot.tunnels[_loc2_][0])
         {
            if(Math.random() > 0.5)
            {
               _loc1_ = Math.floor(this.getRandom(0,this.cRoot.tunnels[_loc2_][1] - 1));
            }
            else
            {
               _loc1_ = Math.floor(this.getRandom(this.cRoot.tunnels[_loc2_][4],this.cRoot.paths[_loc2_][0].length - 1));
            }
         }
         else
         {
            _loc1_ = Math.floor(this.getRandom(0,this.cRoot.paths[_loc2_][0].length - 1));
         }
         return this.cRoot.paths[_loc2_][0][_loc1_];
      }
      
      private function getRandomHeight() : Number
      {
         return this.getRandom(this.§_-2r§,this.§_-37§);
      }
      
      private function getSign() : Number
      {
         if(Math.random() >= 0.5)
         {
            return 1;
         }
         return -1;
      }
      
      private function getRandom(param1:*, param2:*) : Number
      {
         var _loc3_:Number = NaN;
         _loc3_ = Math.round(Math.random() * (param2 - param1)) + param1;
         return _loc3_;
      }
      
      public function destroyThis() : void
      {
         this.cRoot = null;
         this.parent.removeChild(this);
      }
   }
}
