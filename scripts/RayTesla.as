package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   
   public class RayTesla extends §_-LR§
   {
       
      
      private var jumpEnemies:Dictionary;
      
      private var jumpMax:int;
      
      private var jumpCurrent:int;
      
      private var jumpRange:int;
      
      public function RayTesla(param1:Point, param2:Enemy, param3:int, param4:int, param5:Dictionary)
      {
         addFrameScript(13,this.frame14);
         super(param1,param2);
         this.jumpMax = param4;
         this.jumpCurrent = param3;
         this.jumpEnemies = param5;
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      override protected function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.durationTime = 14;
         this.durationTimeCounter = 0;
         if(this.cRoot.game.gameUpgrades.engineersUpEfficiency && (this.cRoot.maxUpgradeLevel == 0 || this.cRoot.maxUpgradeLevel == 5) || this.jumpCurrent == 1)
         {
            this.minDamage = this.cRoot.gameSettings.engineers.tesla.minDamage;
            this.maxDamage = this.cRoot.gameSettings.engineers.tesla.maxDamage;
         }
         else if(this.jumpCurrent == 2)
         {
            this.minDamage = this.cRoot.gameSettings.engineers.tesla.minDamage * 0.75;
            this.maxDamage = this.cRoot.gameSettings.engineers.tesla.maxDamage * 0.75;
         }
         else
         {
            this.minDamage = this.cRoot.gameSettings.engineers.tesla.minDamage * 0.5;
            this.maxDamage = this.cRoot.gameSettings.engineers.tesla.maxDamage * 0.5;
         }
         this.jumpRange = this.cRoot.gameSettings.engineers.tesla.chargedBoltRange;
         this.getDamage();
         if(this.target == null)
         {
            this.destroyThis();
            return;
         }
         MovieClip(this.target).effect_TeslaHit.gotoAndPlay("on");
         this.§_-0W§();
      }
      
      override public function onFrameUpdate() : void
      {
         this.durationTimeCounter++;
         if(this.durationTimeCounter == this.durationTime)
         {
            this.destroyThis();
            return;
         }
         if(this.target == null || !this.target.isActive)
         {
            return;
         }
         this.hit();
         if(this.target == null || !this.target.isActive)
         {
            return;
         }
         if(this.durationTimeCounter == 2 && this.jumpCurrent < this.jumpMax)
         {
            this.jump();
         }
         this.follow();
      }
      
      override public function pause() : void
      {
         this.stop();
      }
      
      override public function unPause() : void
      {
         if(this.currentFrameLabel != "teslaEnd")
         {
            this.play();
         }
      }
      
      override protected function follow() : void
      {
         this.§_-CZ§();
         if(this.§_-Lo§ >= 10)
         {
            this.scaleX = this.scaleX * (1 + (Math.sqrt(this.§_-4W§ * this.§_-4W§ + this.§_-6k§ * this.§_-6k§) - this.§_-Lo§) / this.§_-Lo§);
            this.§_-Lo§ = Math.sqrt(this.§_-4W§ * this.§_-4W§ + this.§_-6k§ * this.§_-6k§);
         }
         this.rotation = 360 - Math.atan2(-this.§_-IR§,this.§_-Jy§) * 180 / Math.PI;
         if(this.§_-0Y§ != null)
         {
            this.§_-0Y§.x = this.target.x + this.target.xAdjust;
            this.§_-0Y§.y = this.target.y + this.target.yAdjust;
         }
      }
      
      override protected function setHeight() : void
      {
         if(this.jumpMax == 1)
         {
            return;
         }
         this.height = this.height * (1 - this.jumpCurrent * 0.12);
      }
      
      protected function jump() : void
      {
         var _loc4_:Enemy = null;
         this.jumpEnemies[this.target] = this.target;
         for each(_loc4_ in this.cRoot.enemies)
         {
            if(_loc4_.isActive && this.onDistance(_loc4_) && this.§_-KL§(_loc4_))
            {
               §§push(null == null);
            }
         }
      }
      
      protected function §_-KL§(param1:Enemy) : Boolean
      {
         var _loc2_:Enemy = null;
         for each(_loc2_ in this.jumpEnemies)
         {
            if(param1 == _loc2_)
            {
               return false;
            }
         }
         return true;
      }
      
      override protected function hit() : void
      {
         var _loc1_:int = this.damage / this.durationTime;
         if(this.durationTimeCounter + 1 == this.durationTime)
         {
            _loc1_ = _loc1_ + this.extraDamage;
         }
         this.target.setDamage(_loc1_,this.cRoot.gameSettings.E_ARMOR,null,0,this.shielded);
         if(this.target != null && this.target.isDead)
         {
            this.cRoot.bullets.addChild(new Pop(new Point(this.target.x + this.target.xAdjust,this.target.y + this.target.yAdjust),"bzzt"));
            this.cRoot.game.gameAchievement.teslaKill(this.cRoot);
         }
         if(!this.shielded)
         {
            this.shielded = true;
         }
      }
      
      private function onDistance(param1:Enemy) : Boolean
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:Number = NaN;
         _loc3_ = param1.x - this.target.x + this.target.xAdjust;
         _loc4_ = param1.y - this.target.y + this.target.yAdjust;
         _loc2_ = Math.sqrt(_loc3_ * _loc3_ + _loc4_ * _loc4_);
         if(_loc2_ <= this.jumpRange)
         {
            return true;
         }
         return false;
      }
      
      override protected function destroyThis() : void
      {
         if(this.target != null && this.target.isActive)
         {
            MovieClip(this.target).effect_TeslaHit.gotoAndStop("off");
         }
         this.target = null;
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.parent.removeChild(this);
      }
      
      function frame14() : *
      {
         stop();
      }
   }
}
