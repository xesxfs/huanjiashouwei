package
{
   import fl.lang.Locale;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.casalib.math.geom.Ellipse;
   
   public class §_-3l§ extends §_-2A§
   {
       
      
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
      
      private var mirageLevel:int;
      
      private var isMirage:Boolean;
      
      private var mirageReloadTime:int;
      
      private var mirageReloadTimeCounter:int;
      
      private var mirageChargeTime:int;
      
      private var mirageChargeTimeCounter:int;
      
      private var mirageIllusionsMax:int;
      
      private var thunderLevel:int;
      
      private var §_-Cr§:Boolean;
      
      private var thunderReloadTime:int;
      
      private var thunderReloadTimeCounter:int;
      
      private var thunderChargeTime:int;
      
      private var thunderChargeTimeCounter:int;
      
      private var thunderRangeWidth:int;
      
      private var thunderRangeHeight:int;
      
      private var thunderMinDistance:int;
      
      private var thunderPoint:Point;
      
      private var §_-6c§:Boolean;
      
      private var §_-5j§:Boolean;
      
      private var teleporthOutChargeTime:int;
      
      private var teleporthOutChargeTimeCounter:int;
      
      private var teleporthInChargeTime:int;
      
      private var teleporthInChargeTimeCounter:int;
      
      private var teleporthPosition:Point;
      
      public function §_-3l§(param1:Point, param2:Point, param3:Tower, param4:Point)
      {
         addFrameScript(0,this.frame1,39,this.frame40,69,this.frame70,92,this.frame93,117,this.frame118,157,this.frame158,175,this.frame176,183,this.frame184,198,this.frame199,209,this.frame210);
         super(param1,param2,param3,param4,0);
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
         this.respawnTime = 18;
         this.deadTime = this.cRoot.gameSettings.heroes.heroMage.respawn;
         this.idleTime = 30;
         this.§_-EZ§ = 29;
         this.§_-Hk§ = 0;
         this.§_-L3§ = 5;
         this.maxSize = this.cRoot.gameSettings.heroes.heroMage.maxSize;
         this.maxLevel = this.cRoot.gameSettings.heroes.heroMage.maxLevel;
         this.rangeWidth = this.cRoot.gameSettings.heroes.heroMage.range;
         this.rangeHeight = this.cRoot.gameSettings.heroes.heroMage.range * this.cRoot.gameSettings.rangeRatio;
         this.regenerateTime = this.cRoot.gameSettings.heroes.heroMage.regenReload;
         this.attackReloadTime = this.cRoot.gameSettings.heroes.heroMage.reload - this.attackChargeTime;
         this.xpMultiplier = this.cRoot.gameSettings.heroes.heroMage.xpMultiplier;
         this.§_-9h§ = this.cRoot.gameSettings.heroes.heroMage.mirageModifier;
         this.§_-LI§ = this.cRoot.gameSettings.heroes.heroMage.thunderModifier;
         this.rangeShootChargeTime = 33;
         this.rangeShootReloadTime = this.cRoot.gameSettings.heroes.heroMage.rangeShootReloadTime * this.cRoot.gameSettings.framesRate;
         this.rangeShootWidth = this.cRoot.gameSettings.heroes.heroMage.rangeShootRangeWidth;
         this.rangeShootHeight = this.rangeShootWidth * this.cRoot.gameSettings.rangeRatio;
         this.rangeShootMinDistance = this.cRoot.gameSettings.heroes.heroMage.rangeShootMinDistance;
         this.§_-Jc§ = new §_-Ov§(new Point(0,-27),this.health,this.initHealth);
         this.§_-Jc§.updateMaxHealth(this.initHealth,this.health);
         this.§_-Jc§.updateProgress(this.health);
         this.addChild(§_-Jc§);
         this.§_-Gv§ = this.cRoot.gameSettings.heroes.heroMage.portrait;
         this.§_-DH§();
         this.level = 1;
         this.levelUpWithAnimation(false);
         this.mirageChargeTime = 31;
         this.thunderChargeTime = 40;
         this.isActive = false;
         this.isDead = true;
         this.deadTimeCounter = this.deadTime - 1;
         this.teleporthOutChargeTime = 14;
         this.teleporthInChargeTime = 11;
         this.cRoot.addSoldier(this);
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.sIconName = "magnus";
         param1.sName = Locale.loadStringEx("HERO_MAGE_NAME",Locale.getDefaultLang());
         param1.sRespawn = this.cRoot.gameSettings.heroes.heroMage.respawn / this.cRoot.gameSettings.framesRate + "s";
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
            case "respawningEnd":
               break;
            case "lvlUp":
               break;
            case "thunderEnd":
               break;
            case "mirageEnd":
               break;
            case "teleporthOutEnd":
               break;
            case "teleporthInEnd":
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
      
      override protected function levelUpWithAnimation(param1:Boolean) : void
      {
         if(param1)
         {
            super.levelUpWithAnimation(param1);
         }
         this.health = this.initHealth = this.cRoot.gameSettings.heroes.heroMage.health[this.level - 1];
         this.§_-Rd§ = this.cRoot.gameSettings.heroes.heroMage.regen[this.level - 1];
         this.armor = this.cRoot.gameSettings.heroes.heroMage.armor[this.level - 1];
         this.minDamage = this.cRoot.gameSettings.heroes.heroMage.minDamage[this.level - 1];
         this.maxDamage = this.cRoot.gameSettings.heroes.heroMage.maxDamage[this.level - 1];
         this.rangeShootMinDamage = this.cRoot.gameSettings.heroes.heroMage.minRangeDamage[this.level - 1];
         this.rangeShootMaxDamage = this.cRoot.gameSettings.heroes.heroMage.maxRangeDamage[this.level - 1];
         this.§_-Jc§.updateMaxHealth(this.initHealth,this.health);
         this.§_-Jc§.updateProgress(this.health);
         this.portrait.updateHealth();
         this.portrait.updateXp();
         this.upgradeMirage();
         this.upgradeThunder();
      }
      
      override protected function runSpecial() : Boolean
      {
         this.rangeShootReloadTimeCounter++;
         this.mirageReloadTimeCounter++;
         this.thunderReloadTimeCounter++;
         if(this.§_-6c§ && this.§_-L§())
         {
            return true;
         }
         if(super.runSpecial())
         {
            return true;
         }
         if(this.§_-Fv§())
         {
            return true;
         }
         if(this.mirageLevel != 0 && this.evalMirage())
         {
            return true;
         }
         if(this.thunderLevel != 0 && this.§_-Em§())
         {
            return true;
         }
         return false;
      }
      
      override protected function stopSpecial() : void
      {
         super.stopSpecial();
         this.isMirage = false;
         this.§_-Cr§ = false;
         this.§_-J6§ = false;
         this.isCharging = false;
         this.§_-La§ = false;
         this.§_-5j§ = false;
         this.§_-6c§ = false;
      }
      
      override public function changeRallyPoint(param1:Point) : void
      {
         var _loc3_:* = undefined;
         var _loc4_:Number = NaN;
         if(this.§_-6c§)
         {
            return;
         }
         this.rallyPoint = param1;
         this.rangePoint = param1;
         if(this.isDead || this.isRespawning)
         {
            return;
         }
         this.isActive = false;
         this.§_-Mw§();
         this.setGoToIdleStatus();
         this.stopSpecial();
         _loc3_ = this.x - this.rangePoint.x;
         _loc4_ = this.y - this.rangePoint.y;
         if(Math.sqrt(_loc3_ * _loc3_ + _loc4_ * _loc4_) > 80)
         {
            this.§_-6c§ = true;
            this.teleporthPosition = param1;
            this.§_-M1§();
         }
         this.playTaunt();
      }
      
      protected function §_-M1§() : void
      {
         this.stopSpecial();
         this.§_-6c§ = true;
         this.§_-5j§ = false;
         this.teleporthInChargeTimeCounter = 0;
         this.teleporthOutChargeTimeCounter = 0;
         this.cRoot.game.gameSounds.playArcaneTeleportAttack("teleporth");
         this.§_-Jc§.hide();
         this.gotoAndPlay("teleporthOut");
      }
      
      protected function §_-L§() : Boolean
      {
         if(!this.§_-5j§)
         {
            this.teleporthOutChargeTimeCounter++;
            if(this.teleporthOutChargeTimeCounter < this.teleporthOutChargeTime)
            {
               return true;
            }
            this.teleporthEnd();
         }
         this.teleporthInChargeTimeCounter++;
         if(this.teleporthInChargeTimeCounter < this.teleporthInChargeTime)
         {
            return true;
         }
         this.§_-Jc§.show();
         this.§_-6c§ = false;
         this.§_-J9§();
         return false;
      }
      
      protected function teleporthEnd() : void
      {
         this.§_-5j§ = true;
         this.gotoAndPlay("teleporthIn");
         this.teleporthInChargeTimeCounter = 0;
         this.x = this.teleporthPosition.x;
         this.y = this.teleporthPosition.y;
      }
      
      protected function §_-Fv§() : Boolean
      {
         var _loc1_:int = 0;
         if(this.isMirage || this.isFighting || this.§_-Cr§ || this.isWalking)
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
                  this.gainXpByDamage(_loc1_);
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
      
      protected function upgradeMirage() : void
      {
         if(this.level != 2 && this.level != 5 && this.level != 8)
         {
            return;
         }
         if(this.level == 2)
         {
            this.mirageLevel = 1;
         }
         if(this.level == 5)
         {
            this.mirageLevel = 2;
         }
         if(this.level == 8)
         {
            this.mirageLevel = 3;
         }
         this.mirageReloadTime = this.cRoot.gameSettings.heroes.heroMage.mirageReloadTime * this.cRoot.gameSettings.framesRate;
      }
      
      protected function evalMirage() : Boolean
      {
         if(this.§_-Cr§ || this.isFighting || this.§_-J6§ || this.isWalking)
         {
            return false;
         }
         if(!this.isMirage)
         {
            if(this.mirageReloadTimeCounter < this.mirageReloadTime)
            {
               return false;
            }
            if(!this.canMirage())
            {
               return false;
            }
            this.isMirage = true;
            this.mirageChargeTimeCounter = 0;
            this.mirageReloadTimeCounter = 0;
            this.gotoAndPlay("mirage");
            this.cRoot.game.gameSounds.playHeroMageShadow();
            this.§_-7U§(1,this.mirageLevel);
            return true;
         }
         if(this.mirageChargeTimeCounter < this.mirageChargeTime)
         {
            this.mirageChargeTimeCounter++;
            if(this.mirageChargeTimeCounter == 12)
            {
               this.doMirage();
            }
            return true;
         }
         this.isMirage = false;
         this.mirageReloadTimeCounter = 0;
         this.§_-J9§();
         return false;
      }
      
      protected function canMirage() : Boolean
      {
         return true;
      }
      
      protected function doMirage() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.mirageLevel)
         {
            if(_loc1_ == 0)
            {
               this.cRoot.entities.addChild(new SoldierHeroMageIllusion(new Point(this.x,this.y),new Point(this.x,this.y + 22),null,new Point(this.x,this.y + 22),this.mirageLevel,_loc1_));
            }
            else if(_loc1_ == 1)
            {
               this.cRoot.entities.addChild(new SoldierHeroMageIllusion(new Point(this.x,this.y),new Point(this.x,this.y - 22),null,new Point(this.x,this.y - 22),this.mirageLevel,_loc1_));
            }
            else
            {
               this.cRoot.entities.addChild(new SoldierHeroMageIllusion(new Point(this.x,this.y),new Point(this.x + 22,this.y),null,new Point(this.x + 22,this.y),this.mirageLevel,_loc1_));
            }
            _loc1_++;
         }
      }
      
      protected function upgradeThunder() : void
      {
         if(this.level != 4 && this.level != 7 && this.level != 10)
         {
            return;
         }
         if(this.level == 4)
         {
            this.thunderLevel = 1;
         }
         if(this.level == 7)
         {
            this.thunderLevel = 2;
         }
         if(this.level == 10)
         {
            this.thunderLevel = 3;
         }
         this.thunderReloadTime = this.cRoot.gameSettings.heroes.heroMage.thunderReloadTime * this.cRoot.gameSettings.framesRate;
         this.thunderMinDistance = this.cRoot.gameSettings.heroes.heroMage.thunderMinDistance;
         this.thunderRangeWidth = this.cRoot.gameSettings.heroes.heroMage.thunderShootRangeWidth;
         this.thunderRangeHeight = this.thunderRangeWidth * this.cRoot.gameSettings.rangeRatio;
      }
      
      protected function §_-Em§() : Boolean
      {
         if(this.isMirage || this.isFighting || this.§_-J6§ || this.isWalking)
         {
            return false;
         }
         if(!this.§_-Cr§)
         {
            if(this.thunderReloadTimeCounter < this.thunderReloadTime)
            {
               return false;
            }
            if(!this.§_-Mc§())
            {
               return false;
            }
            if(this.thunderPoint.x >= this.x)
            {
               this.scaleX = 1;
               this.§_-Jc§.flip(1);
            }
            else
            {
               this.scaleX = -1;
               this.§_-Jc§.flip(-1);
            }
            this.§_-Cr§ = true;
            this.thunderChargeTimeCounter = 0;
            this.thunderReloadTimeCounter = 0;
            this.gotoAndPlay("thunder");
            this.cRoot.game.gameSounds.playHeroMageRainCharge();
            this.§_-7U§(2,this.thunderLevel);
            return true;
         }
         if(this.thunderChargeTimeCounter < this.thunderChargeTime)
         {
            this.thunderChargeTimeCounter++;
            if(this.thunderChargeTimeCounter == 15)
            {
               this.§if§();
            }
            return true;
         }
         this.§_-Cr§ = false;
         this.thunderReloadTimeCounter = 0;
         this.§_-J9§();
         return false;
      }
      
      protected function §_-Mc§() : Boolean
      {
         var _loc2_:Enemy = null;
         var _loc3_:int = 0;
         var _loc1_:Enemy = null;
         for each(_loc2_ in this.cRoot.enemies)
         {
            if(_loc2_.isActive && !_loc2_.isFlying && this.onRangeThunder(_loc2_) && this.§_-JP§(_loc2_))
            {
               _loc1_ = _loc2_;
               break;
            }
         }
         if(_loc1_ != null)
         {
            _loc3_ = 0;
            if(_loc1_.§_-4Y§ || _loc1_.isBlocked)
            {
               _loc3_ = _loc1_.currentNode;
            }
            else if(_loc1_.currentNode + 6 > _loc1_.road.length)
            {
               _loc3_ = _loc1_.currentNode;
            }
            else
            {
               _loc3_ = _loc1_.currentNode + 6;
            }
            this.thunderPoint = new Point(_loc1_.road[_loc3_].x,_loc1_.road[_loc3_].y);
            return true;
         }
         return false;
      }
      
      protected function onRangeThunder(param1:Enemy) : Boolean
      {
         var _loc2_:* = new Ellipse(this.x - this.thunderRangeWidth / 2,this.y - this.thunderRangeHeight / 2,this.thunderRangeWidth,this.thunderRangeHeight);
         return _loc2_.containsPoint(new Point(param1.x,param1.y));
      }
      
      protected function §_-JP§(param1:Enemy) : Boolean
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:Number = NaN;
         _loc3_ = param1.x - this.x;
         _loc4_ = param1.y - this.y;
         _loc2_ = Math.sqrt(_loc3_ * _loc3_ + _loc4_ * _loc4_);
         if(_loc2_ > this.thunderMinDistance)
         {
            return true;
         }
         return false;
      }
      
      protected function §if§() : void
      {
         this.cRoot.addToDecal(new §_-DP§(this.thunderPoint,this.thunderLevel,this.cRoot));
      }
      
      override protected function playTaunt() : void
      {
         this.cRoot.game.gameSounds.playHeroMageTaunt();
      }
      
      override public function playDeadSound() : void
      {
         this.cRoot.game.gameSounds.playHeroMageDeath();
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame40() : *
      {
         stop();
      }
      
      function frame70() : *
      {
         stop();
      }
      
      function frame93() : *
      {
         stop();
      }
      
      function frame118() : *
      {
         stop();
      }
      
      function frame158() : *
      {
         stop();
      }
      
      function frame176() : *
      {
         stop();
      }
      
      function frame184() : *
      {
         stop();
      }
      
      function frame199() : *
      {
         stop();
      }
      
      function frame210() : *
      {
         stop();
      }
   }
}
