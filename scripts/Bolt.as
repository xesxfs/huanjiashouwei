package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class Bolt extends MovieClip
   {
       
      
      protected var level:int;
      
      protected var isActive:Boolean = true;
      
      protected var target:Enemy;
      
      protected var §_-J7§:int = 10;
      
      protected var §_-Rn§:int = 0;
      
      protected var §_-Jy§:Number;
      
      protected var §_-IR§:Number;
      
      protected var aceleration:Number = 1;
      
      protected var maxAceleration:Number;
      
      protected var §_-0m§:Number;
      
      protected var §_-KM§:Number;
      
      protected var minDamage:int;
      
      protected var maxDamage:int;
      
      protected var cRoot:Level;
      
      public function Bolt(param1:Point, param2:Enemy, param3:int)
      {
         super();
         this.level = param3;
         this.x = param1.x;
         this.y = param1.y;
         this.target = param2;
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      public function onFrameUpdate() : void
      {
         if(!this.isActive)
         {
            this.fadeThis();
            return;
         }
         this.moveMe(false);
      }
      
      public function pause() : void
      {
         this.stop();
      }
      
      public function unPause() : void
      {
         switch(this.currentFrame)
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
      
      protected function init(param1:Event) : void
      {
      }
      
      protected function moveMe(param1:Boolean) : void
      {
         var _loc2_:Number = 0;
         var _loc3_:Number = 0;
         var _loc4_:Number = 0;
         if(this.target != null)
         {
            if(this.target.parent == null || !this.target.isActive)
            {
               this.target = null;
            }
         }
         if(this.target != null)
         {
            _loc2_ = this.target.y + this.target.yAdjust - this.y;
            _loc3_ = this.target.x + this.target.xAdjust - this.x;
            this.§_-KM§ = this.target.y + this.target.yAdjust;
            this.§_-0m§ = this.target.x + this.target.xAdjust;
         }
         else
         {
            _loc2_ = this.§_-KM§ - this.y;
            _loc3_ = this.§_-0m§ - this.x;
         }
         _loc4_ = Math.atan2(_loc2_,_loc3_);
         if(this.aceleration < this.maxAceleration)
         {
            this.aceleration = this.aceleration + Math.ceil(this.aceleration * 0.05);
            if(this.aceleration >= this.maxAceleration)
            {
               this.aceleration = this.maxAceleration;
            }
         }
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
            if(this.target != null)
            {
               this.hitOnTarget();
            }
            else
            {
               this.hit();
            }
         }
      }
      
      protected function hitOnTarget() : void
      {
         var _loc1_:§_-27§ = null;
         if(this.cRoot.game.gameUpgrades.magesUpSlowCurse == true && (this.cRoot.maxUpgradeLevel == 0 || this.cRoot.maxUpgradeLevel == 5) && !this.target.hasDebuff("DebuffRage") && !this.target.hasDebuff("DebuffSlow"))
         {
            _loc1_ = new DebuffSlow(this.cRoot,1,this.target);
         }
         this.target.setDamage(this.getDamage(),this.cRoot.gameSettings.M_ARMOR,_loc1_);
         this.playPop();
         if(this.cRoot.game.gameUpgrades.magesUpArcaneShatter && (this.cRoot.maxUpgradeLevel == 0 || this.cRoot.maxUpgradeLevel >= 2) && this.target != null && this.target.isActive)
         {
            this.target.setDamageArmor(this.cRoot.game.gameUpgrades.magesUpArcaneShatterDamage);
         }
         this.hit();
      }
      
      protected function hit() : void
      {
         this.isActive = false;
         this.x = this.§_-0m§;
         this.y = this.§_-KM§;
         this.aceleration = 0;
         this.gotoAndPlay("hit");
      }
      
      protected function playPop() : void
      {
      }
      
      protected function setLevelSettings() : void
      {
         switch(this.level)
         {
            case 1:
               this.minDamage = this.cRoot.gameSettings.mages.level1.minDamage;
               this.maxDamage = this.cRoot.gameSettings.mages.level1.maxDamage;
               break;
            case 2:
               this.minDamage = this.cRoot.gameSettings.mages.level2.minDamage;
               this.maxDamage = this.cRoot.gameSettings.mages.level2.maxDamage;
               break;
            case 3:
               this.minDamage = this.cRoot.gameSettings.mages.level3.minDamage;
               this.maxDamage = this.cRoot.gameSettings.mages.level3.maxDamage;
         }
      }
      
      protected function getDamage() : int
      {
         return this.minDamage + Math.ceil(Math.random() * (this.maxDamage - this.minDamage));
      }
      
      protected function fadeThis() : void
      {
         if(this.§_-Rn§ == this.§_-J7§)
         {
            this.destroyThis();
         }
         this.§_-Rn§++;
      }
      
      protected function destroyThis() : void
      {
         this.target = null;
         this.cRoot = null;
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.parent.removeChild(this);
      }
   }
}
