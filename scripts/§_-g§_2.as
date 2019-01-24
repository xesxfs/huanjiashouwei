package
{
   import flash.geom.Point;
   import org.casalib.math.geom.Ellipse;
   
   public class §_-g§ extends §_-Ol§
   {
       
      
      private var §_-S0§:Point;
      
      private var spearTarget:Enemy;
      
      private var §_-Fd§:Boolean = false;
      
      private var §_-DN§:Boolean;
      
      private var spearRangeWidth:int;
      
      private var spearRangeHeight:int;
      
      private var spearMinRange:int;
      
      private var spearChargeTime:int = 10;
      
      private var spearChargeTimeCounter:int;
      
      private var spearReloadTime:int;
      
      private var spearReloadTimeCounter:int;
      
      protected var §_-Pc§:int;
      
      public function §_-g§(param1:Point, param2:Point, param3:Tower, param4:Point)
      {
         this.§_-S0§ = new Point();
         super(param1,param2,param3,param4);
         this.§_-Pc§ = this.getRandom(1,3);
         this.rangePoint = param4;
      }
      
      public function §_-9k§() : void
      {
         this.lifes = 1;
         this.speed = 2;
         this.xAdjust = 5;
         this.attackChargeTime = 11;
         this.attackChargeDamageTime = 5;
         this.respawnTime = 6;
         this.deadTime = 10;
         this.idleTime = 30;
         var _loc1_:int = this.cRoot.game.gameUpgrades.reinforcementLevel;
         if(this.cRoot.maxUpgradeLevel != 0 && this.cRoot.maxUpgradeLevel < _loc1_)
         {
            _loc1_ = this.cRoot.maxUpgradeLevel;
         }
         if(_loc1_ == 0 || _loc1_ == 1)
         {
            this.maxSize = this.cRoot.gameSettings.powers.farmers.maxSize;
            this.maxLevel = this.cRoot.gameSettings.powers.farmers.maxLevel;
            this.rangeWidth = this.cRoot.gameSettings.powers.farmers.range;
            this.rangeHeight = this.cRoot.gameSettings.powers.farmers.range * this.cRoot.gameSettings.rangeRatio;
            this.health = this.initHealth = this.cRoot.gameSettings.powers.farmers.health;
            this.§_-Rd§ = this.cRoot.gameSettings.powers.farmers.regen;
            this.regenerateTime = this.cRoot.gameSettings.powers.farmers.regenReload;
            this.armor = this.cRoot.gameSettings.powers.farmers.armor;
            this.minDamage = this.cRoot.gameSettings.powers.farmers.minDamage;
            this.maxDamage = this.cRoot.gameSettings.powers.farmers.maxDamage;
            this.attackReloadTime = this.cRoot.gameSettings.powers.farmers.reload - this.attackChargeTime;
            this.lifeTime = this.cRoot.gameSettings.powers.farmers.lifeTime;
         }
         else if(_loc1_ == 2)
         {
            this.maxSize = this.cRoot.gameSettings.powers.reinforcementLevel2.maxSize;
            this.maxLevel = this.cRoot.gameSettings.powers.reinforcementLevel2.maxLevel;
            this.rangeWidth = this.cRoot.gameSettings.powers.reinforcementLevel2.range;
            this.rangeHeight = this.cRoot.gameSettings.powers.reinforcementLevel2.range * this.cRoot.gameSettings.rangeRatio;
            this.health = this.initHealth = this.cRoot.gameSettings.powers.reinforcementLevel2.health;
            this.§_-Rd§ = this.cRoot.gameSettings.powers.reinforcementLevel2.regen;
            this.regenerateTime = this.cRoot.gameSettings.powers.reinforcementLevel2.regenReload;
            this.armor = this.cRoot.gameSettings.powers.reinforcementLevel2.armor;
            this.minDamage = this.cRoot.gameSettings.powers.reinforcementLevel2.minDamage;
            this.maxDamage = this.cRoot.gameSettings.powers.reinforcementLevel2.maxDamage;
            this.attackReloadTime = this.cRoot.gameSettings.powers.reinforcementLevel2.reload - this.attackChargeTime;
            this.lifeTime = this.cRoot.gameSettings.powers.reinforcementLevel2.lifeTime;
         }
         else if(_loc1_ == 3)
         {
            this.maxSize = this.cRoot.gameSettings.powers.reinforcementLevel3.maxSize;
            this.maxLevel = this.cRoot.gameSettings.powers.reinforcementLevel3.maxLevel;
            this.rangeWidth = this.cRoot.gameSettings.powers.reinforcementLevel3.range;
            this.rangeHeight = this.cRoot.gameSettings.powers.reinforcementLevel3.range * this.cRoot.gameSettings.rangeRatio;
            this.health = this.initHealth = this.cRoot.gameSettings.powers.reinforcementLevel3.health;
            this.§_-Rd§ = this.cRoot.gameSettings.powers.reinforcementLevel3.regen;
            this.regenerateTime = this.cRoot.gameSettings.powers.reinforcementLevel3.regenReload;
            this.armor = this.cRoot.gameSettings.powers.reinforcementLevel3.armor;
            this.minDamage = this.cRoot.gameSettings.powers.reinforcementLevel3.minDamage;
            this.maxDamage = this.cRoot.gameSettings.powers.reinforcementLevel3.maxDamage;
            this.attackReloadTime = this.cRoot.gameSettings.powers.reinforcementLevel3.reload - this.attackChargeTime;
            this.lifeTime = this.cRoot.gameSettings.powers.reinforcementLevel3.lifeTime;
         }
         else if(_loc1_ >= 4)
         {
            this.maxSize = this.cRoot.gameSettings.powers.reinforcementLevel4.maxSize;
            this.maxLevel = this.cRoot.gameSettings.powers.reinforcementLevel4.maxLevel;
            this.rangeWidth = this.cRoot.gameSettings.powers.reinforcementLevel4.range;
            this.rangeHeight = this.cRoot.gameSettings.powers.reinforcementLevel4.range * this.cRoot.gameSettings.rangeRatio;
            this.health = this.initHealth = this.cRoot.gameSettings.powers.reinforcementLevel4.health;
            this.§_-Rd§ = this.cRoot.gameSettings.powers.reinforcementLevel4.regen;
            this.regenerateTime = this.cRoot.gameSettings.powers.reinforcementLevel4.regenReload;
            this.armor = this.cRoot.gameSettings.powers.reinforcementLevel4.armor;
            this.minDamage = this.cRoot.gameSettings.powers.reinforcementLevel4.minDamage;
            this.maxDamage = this.cRoot.gameSettings.powers.reinforcementLevel4.maxDamage;
            this.attackReloadTime = this.cRoot.gameSettings.powers.reinforcementLevel4.reload - this.attackChargeTime;
            this.lifeTime = this.cRoot.gameSettings.powers.reinforcementLevel4.lifeTime;
         }
         if(_loc1_ == 5)
         {
            this.§_-Fd§ = true;
            this.spearReloadTime = this.cRoot.gameSettings.powers.reinforcementLevel4.spearCoolDown;
            this.spearRangeWidth = this.cRoot.gameSettings.powers.reinforcementLevel4.spearRange;
            this.spearRangeHeight = this.spearRangeWidth * this.cRoot.gameSettings.rangeRatio;
            this.spearMinRange = this.cRoot.gameSettings.powers.reinforcementLevel4.spearMinRange;
         }
         this.§_-Jc§ = new §_-H8§(new Point(0,-23),this.health,this.initHealth);
         this.§_-Jc§.updateMaxHealth(this.initHealth,this.health);
         this.§_-Jc§.updateProgress(this.health);
         this.addChild(§_-Jc§);
         this.isActive = false;
         this.isDead = true;
         this.§_-E9§ = true;
         this.§_-PB§ = 0;
         this.deadTimeCounter = this.deadTime - 1;
         this.cRoot.addSoldier(this);
      }
      
      override public function unPause() : void
      {
         switch(this.currentFrameLabel)
         {
            case "runningEnd":
               this.gotoAndPlay("running");
               break;
            case "fightingEnd":
               break;
            case "deadEnd":
               break;
            case "respawningEnd":
               break;
            case "spearEnd":
               break;
            case "idle":
               break;
            default:
               this.play();
         }
      }
      
      override protected function runSpecial() : Boolean
      {
         if(!this.isActive)
         {
            return false;
         }
         if(this.set())
         {
            return true;
         }
         return false;
      }
      
      override protected function stopSpecial() : void
      {
         if(this.§_-DN§)
         {
            this.§_-DN§ = false;
         }
      }
      
      private function set() : Boolean
      {
         var _loc1_:Point = null;
         var _loc2_:Spear = null;
         if(!this.§_-DN§)
         {
            if(this.spearReloadTimeCounter < this.spearReloadTime)
            {
               this.spearReloadTimeCounter++;
               return false;
            }
            if(!this.isIdle)
            {
               return false;
            }
            if(!this.getSpearTarget())
            {
               return false;
            }
            if(this.spearTarget.x >= this.x)
            {
               this.scaleX = 1;
               this.§_-Jc§.flip(1);
            }
            else
            {
               this.scaleX = -1;
               this.§_-Jc§.flip(-1);
            }
            this.§_-S0§ = new Point(this.spearTarget.x + this.spearTarget.xAdjust,this.spearTarget.y + this.spearTarget.yAdjust);
            this.§_-DN§ = true;
            this.spearChargeTimeCounter = 0;
            this.gotoAndPlay("spear");
            return true;
         }
         if(this.spearChargeTimeCounter < this.spearChargeTime)
         {
            this.spearChargeTimeCounter++;
            if(this.spearChargeTimeCounter == 5)
            {
               _loc1_ = null;
               if(this.spearTarget == null || !this.spearTarget.isActive)
               {
                  if(!this.getSpearTarget())
                  {
                     _loc1_ = this.§_-S0§;
                  }
               }
               _loc2_ = new Spear(5,this.spearTarget,_loc1_,null,12);
               _loc2_.x = this.x + 6;
               _loc2_.y = this.y - 10;
               this.cRoot.bullets.addChild(_loc2_);
            }
            return true;
         }
         this.§_-DN§ = false;
         this.spearReloadTimeCounter = 0;
         this.§_-J9§();
         return false;
      }
      
      private function getSpearTarget() : Boolean
      {
         var _loc1_:Enemy = null;
         this.spearTarget = null;
         for each(_loc1_ in this.cRoot.enemies)
         {
            if(_loc1_.isActive && this.spearOnRange(_loc1_) && this.§_-x§(_loc1_))
            {
               this.spearTarget = _loc1_;
               break;
            }
         }
         if(this.spearTarget != null)
         {
            return true;
         }
         return false;
      }
      
      private function spearOnRange(param1:Enemy) : Boolean
      {
         var _loc2_:* = new Ellipse(this.x - this.spearRangeWidth / 2,this.y - this.spearRangeHeight / 2,this.spearRangeWidth,this.spearRangeHeight);
         return _loc2_.containsPoint(new Point(param1.x,param1.y));
      }
      
      private function §_-x§(param1:Enemy) : Boolean
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:Number = NaN;
         _loc3_ = param1.x - this.x;
         _loc4_ = param1.y - this.y;
         _loc2_ = Math.sqrt(_loc3_ * _loc3_ + _loc4_ * _loc4_);
         if(_loc2_ > this.spearMinRange)
         {
            return true;
         }
         return false;
      }
   }
}
