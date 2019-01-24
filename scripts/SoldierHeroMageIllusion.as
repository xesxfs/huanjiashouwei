package
{
   import fl.lang.Locale;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.casalib.math.geom.Ellipse;
   
   public class SoldierHeroMageIllusion extends §_-Ol§
   {
       
      
      protected var level:int;
      
      protected var direction:int;
      
      protected var §_-GV§:Point;
      
      protected var isRespawningEnd:Boolean;
      
      protected var respawningEndTime:int;
      
      protected var respawningEndTimeCounter:int;
      
      private var rangeShootTarget:Enemy;
      
      private var rangeShootPoint:Point;
      
      private var §_-J6§:Boolean;
      
      private var rangeShootReloadTime:Number;
      
      private var rangeShootReloadTimeCounter:int;
      
      private var rangeShootChargeTime:int;
      
      private var rangeShootChargeTimeCounter:int;
      
      private var rangeShootWidth:int;
      
      private var rangeShootHeight:int;
      
      private var rangeShootMinDamage:int;
      
      private var rangeShootMaxDamage:int;
      
      private var rangeShootMinDistance:int;
      
      public function SoldierHeroMageIllusion(param1:Point, param2:Point, param3:Tower, param4:Point, param5:int, param6:int)
      {
         addFrameScript(0,this.frame1,39,this.frame40,40,this.frame41,49,this.frame50,74,this.frame75,89,this.frame90);
         super(param1,param2,param3,param4);
         this.level = param5;
         this.direction = param6;
         if(this.direction == 0)
         {
            this.§_-GV§ = new Point(this.x,this.y + 22);
         }
         else if(this.direction == 1)
         {
            this.§_-GV§ = new Point(this.x,this.y - 22);
         }
         else
         {
            this.§_-GV§ = new Point(this.x + 22,this.y);
         }
         this.rangePoint = param4;
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      override protected function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.lifes = 1;
         this.speed = 0.8;
         this.xAdjust = 5;
         this.attackChargeTime = 22;
         this.attackChargeDamageTime = 12;
         this.respawnTime = 6;
         this.deadTime = 14;
         this.idleTime = 30;
         this.maxSize = this.cRoot.gameSettings.heroes.heroMage.maxSize;
         this.maxLevel = this.cRoot.gameSettings.heroes.heroMage.maxLevel;
         this.rangeWidth = this.cRoot.gameSettings.heroes.heroMage.mirageRange;
         this.rangeHeight = this.cRoot.gameSettings.heroes.heroMage.mirageRange * this.cRoot.gameSettings.rangeRatio;
         this.regenerateTime = this.cRoot.gameSettings.heroes.heroMage.mirageRegenReload;
         this.attackReloadTime = this.cRoot.gameSettings.heroes.heroMage.mirageReload - this.attackChargeTime;
         this.health = this.initHealth = this.cRoot.gameSettings.heroes.heroMage.health[this.level - 1] * 0.3;
         this.§_-Rd§ = this.cRoot.gameSettings.heroes.heroMage.mirageRegen;
         this.armor = this.cRoot.gameSettings.heroes.heroMage.mirageArmor;
         this.minDamage = this.cRoot.gameSettings.heroes.heroMage.minDamage[this.level - 1] * 0.2;
         this.maxDamage = this.cRoot.gameSettings.heroes.heroMage.maxDamage[this.level - 1] * 0.2;
         this.rangeShootMinDamage = this.cRoot.gameSettings.heroes.heroMage.minRangeDamage[this.level - 1] * 0.2;
         this.rangeShootMaxDamage = this.cRoot.gameSettings.heroes.heroMage.maxRangeDamage[this.level - 1] * 0.2;
         this.rangeShootChargeTime = 33;
         this.rangeShootReloadTime = this.cRoot.gameSettings.heroes.heroMage.rangeShootReloadTime * this.cRoot.gameSettings.framesRate;
         this.rangeShootWidth = this.cRoot.gameSettings.heroes.heroMage.rangeShootRangeWidth;
         this.rangeShootHeight = this.rangeShootWidth * this.cRoot.gameSettings.rangeRatio;
         this.rangeShootMinDistance = this.cRoot.gameSettings.heroes.heroMage.rangeShootMinDistance;
         this.§_-Jc§ = new §_-Ov§(new Point(0,-27),this.health,this.initHealth);
         this.§_-Jc§.updateMaxHealth(this.initHealth,this.health);
         this.§_-Jc§.updateProgress(this.health);
         this.addChild(§_-Jc§);
         this.isActive = false;
         this.isDead = true;
         this.§_-E9§ = true;
         this.lifeTime = this.cRoot.gameSettings.heroes.heroMage.lifeTime;
         this.§_-PB§ = 0;
         this.deadTimeCounter = this.deadTime - 1;
         this.isRespawningEnd = false;
         this.respawningEndTime = 9;
         this.respawningEndTimeCounter = 0;
         this.cRoot.addSoldier(this);
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.sIconName = "magnus";
         param1.sName = Locale.loadStringEx("HERO_MAGE_SHADOW_NAME",Locale.getDefaultLang());
         param1.sRespawn = "-";
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
            case "rangeEnd":
               break;
            case "respawning":
               break;
            case "respawningEndEnd":
               break;
            case "lvlUp":
               break;
            case "deadEnd":
               break;
            case "idle":
               break;
            default:
               this.play();
         }
         this.§_-MJ§();
      }
      
      override protected function respawn() : *
      {
         this.isActive = true;
         this.isDead = false;
         this.isRespawning = false;
         this.isWalking = true;
         this.isCharging = false;
         this.isBlocking = false;
         this.isFighting = false;
         this.isIdle = false;
         this.destinationPoint.x = this.rallyPoint.x;
         this.destinationPoint.y = this.rallyPoint.y;
         this.health = this.initHealth;
         this.§_-Jc§.show();
         this.§_-Jc§.updateProgress(this.health);
         this.deadTimeCounter = 0;
         this.respawnTimeCounter = 0;
         this.alpha = 0.7;
         this.respawnCustom();
         this.animationRun();
      }
      
      override protected function readyToRespawn() : Boolean
      {
         this.deadTimeCounter++;
         if(this.deadTimeCounter >= this.deadTime)
         {
            if(this.lifes != 1)
            {
               this.destroyThis();
               this.cRoot.removeSoldier(this);
               return false;
            }
            this.isDead = false;
            this.doorQueed = false;
            this.isRespawning = true;
            this.gotoAndStop("respawning");
            this.lifes++;
            return true;
         }
         return false;
      }
      
      override protected function readyToLive() : Boolean
      {
         if(!this.isRespawningEnd && this.moveToRespawning())
         {
            this.gotoAndPlay("respawningEnd");
            this.isRespawningEnd = true;
         }
         if(this.isRespawningEnd)
         {
            this.respawningEndTimeCounter++;
            if(this.respawningEndTimeCounter == this.respawningEndTime)
            {
               this.isRespawningEnd = false;
               this.respawn();
               return true;
            }
         }
         return false;
      }
      
      protected function moveToRespawning() : Boolean
      {
         if(Math.sqrt(Math.pow(this.§_-GV§.y - this.y,2) + Math.pow(this.§_-GV§.x - this.x,2)) <= 1.7)
         {
            return true;
         }
         var _loc1_:Number = Math.atan2(this.§_-GV§.y - this.y,this.§_-GV§.x - this.x);
         this.x = this.x + Math.cos(_loc1_) * 1.7;
         this.y = this.y + Math.sin(_loc1_) * 1.7;
         return false;
      }
      
      override protected function runSpecial() : Boolean
      {
         this.rangeShootReloadTimeCounter++;
         if(this.§_-Fv§())
         {
            return true;
         }
         return false;
      }
      
      override protected function stopSpecial() : void
      {
         super.stopSpecial();
         this.§_-J6§ = false;
      }
      
      protected function §_-Fv§() : Boolean
      {
         var _loc1_:int = 0;
         if(this.isFighting || this.isWalking)
         {
            return false;
         }
         if(!this.§_-J6§)
         {
            if(this.rangeShootReloadTimeCounter < this.rangeShootReloadTime)
            {
               return false;
            }
            if(!this.findRangeShootTarget())
            {
               return false;
            }
            if(this.rangeShootTarget.x >= this.x)
            {
               this.scaleX = 1;
               this.§_-Jc§.flip(1);
            }
            else
            {
               this.scaleX = -1;
               this.§_-Jc§.flip(-1);
            }
            this.§_-J6§ = true;
            this.rangeShootChargeTimeCounter = 0;
            this.gotoAndPlay("range");
            return true;
         }
         if(this.rangeShootChargeTimeCounter < this.rangeShootChargeTime)
         {
            this.rangeShootChargeTimeCounter++;
            if(this.rangeShootChargeTimeCounter == 11)
            {
               if(this.rangeShootTarget != null)
               {
                  _loc1_ = this.getDamageRangeShoot();
                  this.cRoot.bullets.addChild(new §_-88§(new Point(this.x,this.y - 19),this.rangeShootTarget,1,_loc1_));
               }
            }
            return true;
         }
         this.§_-J6§ = false;
         this.§_-J9§();
         return false;
      }
      
      protected function findRangeShootTarget() : Boolean
      {
         var _loc2_:Enemy = null;
         var _loc1_:Enemy = null;
         this.rangeShootTarget = null;
         for each(_loc2_ in this.cRoot.enemies)
         {
            if(_loc2_.isActive && this.onRangeShoot(_loc2_) && this.§_-2v§(_loc2_))
            {
               _loc1_ = _loc2_;
               break;
            }
         }
         if(_loc1_ != null)
         {
            this.rangeShootTarget = _loc1_;
            this.rangeShootPoint = new Point(_loc1_.x + _loc1_.xAdjust,_loc1_.y + _loc1_.yAdjust);
            return true;
         }
         return false;
      }
      
      protected function §_-2v§(param1:Enemy) : Boolean
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:Number = NaN;
         _loc3_ = param1.x - this.x;
         _loc4_ = param1.y - this.y;
         _loc2_ = Math.sqrt(_loc3_ * _loc3_ + _loc4_ * _loc4_);
         if(_loc2_ > this.rangeShootMinDistance)
         {
            return true;
         }
         return false;
      }
      
      protected function getDamageRangeShoot() : int
      {
         return this.rangeShootMinDamage + Math.ceil(Math.random() * (this.rangeShootMaxDamage - this.rangeShootMinDamage));
      }
      
      protected function onRangeShoot(param1:Enemy) : Boolean
      {
         var _loc2_:* = new Ellipse(this.x - this.rangeShootWidth / 2,this.y - this.rangeShootHeight / 2,this.rangeShootWidth,this.rangeShootHeight);
         return _loc2_.containsPoint(new Point(param1.x,param1.y));
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame40() : *
      {
         stop();
      }
      
      function frame41() : *
      {
         stop();
      }
      
      function frame50() : *
      {
         stop();
      }
      
      function frame75() : *
      {
         stop();
      }
      
      function frame90() : *
      {
         stop();
      }
   }
}
