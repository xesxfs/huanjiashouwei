package
{
   import fl.lang.Locale;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.casalib.math.geom.Ellipse;
   
   public class §_-Ep§ extends §_-2A§
   {
       
      
      protected var rangeShootTarget:Enemy;
      
      protected var rangeShootPoint:Point;
      
      protected var §_-J6§:Boolean;
      
      protected var rangeShootReloadTime:Number;
      
      protected var rangeShootReloadTimeCounter:int;
      
      protected var rangeShootChargeTime:int;
      
      protected var rangeShootChargeTimeCounter:int;
      
      protected var rangeShootWidth:int;
      
      protected var rangeShootHeight:int;
      
      protected var rangeShootMinDamage:int;
      
      protected var rangeShootMaxDamage:int;
      
      protected var rangeShootMinDistance:int;
      
      protected var multiShootLevel:int;
      
      protected var §_-MB§:Boolean;
      
      protected var multiShootReloadTime:int;
      
      protected var §_-1H§:int;
      
      protected var §_-SU§:int;
      
      protected var §_-De§:int;
      
      protected var multiShootRangeWidthNear:int;
      
      protected var §if §:int;
      
      protected var §_-1Z§:int;
      
      protected var multiShootMinDamage:int;
      
      protected var multiShootMaxDamage:int;
      
      protected var §_-6a§:§_-Mz§;
      
      protected var callOfWildLevel:int;
      
      protected var §_-GL§:Boolean;
      
      protected var callOfWildReloadTime:int;
      
      protected var §_-0s§:int;
      
      protected var §_-7Q§:int;
      
      protected var §_-Mp§:int;
      
      protected var §_-OB§:int;
      
      protected var §throw§:int;
      
      protected var §_-RK§:Point;
      
      public function §_-Ep§(param1:Point, param2:Point, param3:Tower, param4:Point)
      {
         addFrameScript(0,this.frame1,18,this.frame19,33,this.frame34,52,this.frame53,67,this.frame68,93,this.frame94,132,this.frame133,140,this.frame141);
         super(param1,param2,param3,param4,0);
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      override protected function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.lifes = 1;
         this.speed = 2.2;
         this.xAdjust = 5;
         this.attackChargeTime = 15;
         this.attackChargeDamageTime = 6;
         this.respawnTime = 15;
         this.deadTime = this.cRoot.gameSettings.heroes.heroArcher.respawn;
         this.idleTime = 30;
         this.§_-EZ§ = 19;
         this.§_-Hk§ = 0;
         this.§_-L3§ = 5;
         this.maxSize = this.cRoot.gameSettings.heroes.heroArcher.maxSize;
         this.maxLevel = this.cRoot.gameSettings.heroes.heroArcher.maxLevel;
         this.rangeWidth = this.cRoot.gameSettings.heroes.heroArcher.range;
         this.rangeHeight = this.cRoot.gameSettings.heroes.heroArcher.range * this.cRoot.gameSettings.rangeRatio;
         this.regenerateTime = this.cRoot.gameSettings.heroes.heroArcher.regenReload;
         this.attackReloadTime = this.cRoot.gameSettings.heroes.heroArcher.reload - this.attackChargeTime;
         this.xpMultiplier = this.cRoot.gameSettings.heroes.heroArcher.xpMultiplier;
         this.§_-9h§ = this.cRoot.gameSettings.heroes.heroArcher.multiShootModifier;
         this.§_-LI§ = this.cRoot.gameSettings.heroes.heroArcher.callOfWildModifier;
         this.rangeShootChargeTime = 14;
         this.rangeShootReloadTime = this.cRoot.gameSettings.heroes.heroArcher.rangeShootReloadTime * this.cRoot.gameSettings.framesRate - this.rangeShootChargeTime;
         this.rangeShootWidth = this.cRoot.gameSettings.heroes.heroArcher.rangeShootRangeWidth;
         this.rangeShootHeight = this.rangeShootWidth * this.cRoot.gameSettings.rangeRatio;
         this.rangeShootMinDistance = this.cRoot.gameSettings.heroes.heroArcher.rangeShootMinDistance;
         this.multiShootRangeWidthNear = this.cRoot.gameSettings.heroes.heroArcher.multiShootRangeWidthNear;
         this.§if § = this.multiShootRangeWidthNear * this.cRoot.gameSettings.rangeRatio;
         this.§_-Jc§ = new §_-Ov§(new Point(0,-29),this.health,this.initHealth);
         this.§_-Jc§.updateMaxHealth(this.initHealth,this.health);
         this.§_-Jc§.updateProgress(this.health);
         this.addChild(§_-Jc§);
         this.§_-Gv§ = this.cRoot.gameSettings.heroes.heroArcher.portrait;
         this.§_-DH§();
         this.level = 1;
         this.levelUpWithAnimation(false);
         this.§_-SU§ = 29;
         this.§_-7Q§ = 40;
         this.isActive = false;
         this.isDead = true;
         this.deadTimeCounter = this.deadTime - 1;
         this.cRoot.addSoldier(this);
         this.§_-E3§();
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.sIconName = "alleria";
         param1.sName = Locale.loadStringEx("HERO_ARCHER_NAME",Locale.getDefaultLang());
         param1.sRespawn = this.cRoot.gameSettings.heroes.heroArcher.respawn / this.cRoot.gameSettings.framesRate + "s";
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
            case "multishootEnd":
               break;
            case "callofwildEnd":
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
         this.health = this.initHealth = this.cRoot.gameSettings.heroes.heroArcher.health[this.level - 1];
         this.§_-Rd§ = this.cRoot.gameSettings.heroes.heroArcher.regen[this.level - 1];
         this.armor = this.cRoot.gameSettings.heroes.heroArcher.armor[this.level - 1];
         this.minDamage = this.cRoot.gameSettings.heroes.heroArcher.minDamage[this.level - 1];
         this.maxDamage = this.cRoot.gameSettings.heroes.heroArcher.maxDamage[this.level - 1];
         this.rangeShootMinDamage = this.cRoot.gameSettings.heroes.heroArcher.minRangeDamage[this.level - 1];
         this.rangeShootMaxDamage = this.cRoot.gameSettings.heroes.heroArcher.maxRangeDamage[this.level - 1];
         this.§_-Jc§.updateMaxHealth(this.initHealth,this.health);
         this.§_-Jc§.updateProgress(this.health);
         this.portrait.updateHealth();
         this.portrait.updateXp();
         this.upgradeMultiShoot();
         this.upgradeCallOfWild();
      }
      
      override protected function runSpecial() : Boolean
      {
         this.rangeShootReloadTimeCounter++;
         this.§_-1H§++;
         this.§_-0s§++;
         if(super.runSpecial())
         {
            return true;
         }
         if(this.§_-Fv§())
         {
            return true;
         }
         if(this.multiShootLevel != 0 && this.§_-Mb§())
         {
            return true;
         }
         if(this.callOfWildLevel != 0 && this.§_-O-§())
         {
            return true;
         }
         return false;
      }
      
      override protected function stopSpecial() : void
      {
         super.stopSpecial();
         this.§_-MB§ = false;
         this.§_-GL§ = false;
         this.§_-J6§ = false;
         this.isCharging = false;
         this.§_-La§ = false;
      }
      
      protected function §_-Fv§() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:§_-JZ§ = null;
         if(this.§_-MB§ || this.isFighting || this.§_-GL§ || this.isWalking)
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
            if(this.rangeShootChargeTimeCounter == 7)
            {
               _loc1_ = this.getDamageRangeShoot();
               _loc2_ = new §_-JZ§(1,this.rangeShootTarget,this.rangeShootPoint,null,0,false,0,_loc1_);
               _loc2_.x = this.x;
               _loc2_.y = this.y - 12;
               this.cRoot.bullets.addChild(_loc2_);
               this.gainXpByDamage(_loc1_);
            }
            return true;
         }
         this.§_-J6§ = false;
         this.rangeShootReloadTimeCounter = 0;
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
      
      private function §_-2v§(param1:Enemy) : Boolean
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
      
      private function onRangeShoot(param1:Enemy) : Boolean
      {
         var _loc2_:* = new Ellipse(this.x - this.rangeShootWidth / 2,this.y - this.rangeShootHeight / 2,this.rangeShootWidth,this.rangeShootHeight);
         return _loc2_.containsPoint(new Point(param1.x,param1.y));
      }
      
      protected function upgradeMultiShoot() : void
      {
         if(this.level != 2 && this.level != 5 && this.level != 8)
         {
            return;
         }
         if(this.level == 2)
         {
            this.multiShootLevel = 1;
         }
         if(this.level == 5)
         {
            this.multiShootLevel = 2;
         }
         if(this.level == 8)
         {
            this.multiShootLevel = 3;
         }
         this.multiShootReloadTime = this.cRoot.gameSettings.heroes.heroArcher.multiShootReloadTime * this.cRoot.gameSettings.framesRate;
         this.§_-1Z§ = this.cRoot.gameSettings.heroes.heroArcher.multiShootArrows + this.cRoot.gameSettings.heroes.heroArcher.multiShootArrowsIncrement * this.multiShootLevel;
         this.multiShootMinDamage = this.rangeShootMinDamage;
         this.multiShootMaxDamage = this.rangeShootMaxDamage;
      }
      
      protected function §_-Mb§() : Boolean
      {
         if(this.§_-GL§ || this.isFighting || this.§_-J6§ || this.isWalking)
         {
            return false;
         }
         if(!this.§_-MB§)
         {
            if(this.§_-1H§ < this.multiShootReloadTime)
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
            this.§_-MB§ = true;
            this.§_-De§ = 0;
            this.§_-1H§ = 0;
            this.gotoAndPlay("multishoot");
            this.cRoot.game.gameSounds.playHeroAlleriaMultishoot();
            this.§_-7U§(1,this.multiShootLevel);
            return true;
         }
         if(this.§_-De§ < this.§_-SU§)
         {
            this.§_-De§++;
            if(this.§_-De§ == 16)
            {
               this.§_-4-§();
            }
            return true;
         }
         this.§_-MB§ = false;
         this.§_-1H§ = 0;
         this.§_-J9§();
         return false;
      }
      
      protected function getDamageMultiShoot() : int
      {
         return this.multiShootMinDamage + Math.ceil(Math.random() * (this.multiShootMaxDamage - this.multiShootMinDamage));
      }
      
      private function onRangeShootMultiShootNear(param1:Enemy) : Boolean
      {
         var _loc2_:* = new Ellipse(this.rangeShootTarget.x - this.multiShootRangeWidthNear / 2,this.rangeShootTarget.y - this.§if § / 2,this.multiShootRangeWidthNear,this.§if §);
         return _loc2_.containsPoint(new Point(param1.x,param1.y));
      }
      
      protected function §_-4-§() : void
      {
         var _loc2_:Enemy = null;
         var _loc3_:int = 0;
         var _loc1_:int = 0;
         this.§_-QB§(this.getDamageMultiShoot(),this.rangeShootPoint,this.rangeShootTarget,this.getRandomHeight());
         _loc1_++;
         for each(_loc2_ in this.cRoot.enemies)
         {
            if(_loc2_.isActive && _loc2_ != this.rangeShootTarget && this.onRangeShootMultiShootNear(_loc2_))
            {
               this.§_-QB§(this.getDamageMultiShoot(),this.rangeShootPoint,_loc2_,this.getRandomHeight());
               _loc1_++;
               if(_loc1_ != this.§_-1Z§)
               {
                  continue;
               }
               break;
            }
         }
         if(_loc1_ < this.§_-1Z§)
         {
            if(this.rangeShootTarget != null && this.rangeShootTarget.isActive)
            {
               _loc3_ = 0;
               while(_loc3_ < this.§_-1Z§ - _loc1_)
               {
                  this.§_-QB§(this.getDamageMultiShoot(),this.rangeShootPoint,this.rangeShootTarget,this.getRandomHeight());
                  _loc3_++;
               }
            }
         }
      }
      
      protected function §_-QB§(param1:int, param2:Point, param3:Enemy, param4:int) : void
      {
         var _loc5_:ArrowAlleriaMultishoot = new ArrowAlleriaMultishoot(1,param3,param2,null,param4,false,100,param1);
         _loc5_.x = this.x;
         _loc5_.y = this.y - 12;
         this.cRoot.bullets.addChild(_loc5_);
      }
      
      protected function getRandomHeight() : int
      {
         return this.getRandom(12,20);
      }
      
      protected function upgradeCallOfWild() : void
      {
         if(this.level != 4 && this.level != 7 && this.level != 10)
         {
            return;
         }
         if(this.level == 4)
         {
            this.callOfWildLevel = 1;
         }
         if(this.level == 7)
         {
            this.callOfWildLevel = 2;
         }
         if(this.level == 10)
         {
            this.callOfWildLevel = 3;
         }
         this.callOfWildReloadTime = this.cRoot.gameSettings.heroes.heroArcher.callOfWildReloadTime;
         if(this.§_-6a§ != null && this.§_-6a§.isActive)
         {
            this.§_-6a§.§_-FM§(this.callOfWildLevel);
         }
      }
      
      protected function §_-O-§() : Boolean
      {
         if(this.§_-MB§ || this.isFighting || this.§_-J6§ || this.isWalking)
         {
            return false;
         }
         if(!this.§_-GL§)
         {
            if(this.§_-0s§ < this.callOfWildReloadTime)
            {
               return false;
            }
            if(!this.§_-Hf§())
            {
               return false;
            }
            this.§_-GL§ = true;
            this.§_-Mp§ = 0;
            this.§_-0s§ = 0;
            this.gotoAndPlay("callofwild");
            this.cRoot.game.gameSounds.playHeroAlleriaSummon();
            this.§_-7U§(2,this.callOfWildLevel);
            return true;
         }
         if(this.§_-Mp§ < this.§_-7Q§)
         {
            this.§_-Mp§++;
            if(this.§_-Mp§ == 17)
            {
               this.§_-Pm§();
            }
            return true;
         }
         this.§_-GL§ = false;
         this.§_-0s§ = 0;
         this.§_-J9§();
         return false;
      }
      
      protected function §_-Hf§() : Boolean
      {
         if(this.§_-6a§ != null)
         {
            return false;
         }
         if(this.callOfWildReloadTime == 0)
         {
            return false;
         }
         return true;
      }
      
      protected function §_-Pm§() : void
      {
         this.§_-6a§ = new §_-Mz§(this.§_-RK§,this.§_-RK§,null,this.§_-RK§,this.callOfWildLevel,this);
         this.cRoot.entities.addChild(this.§_-6a§);
         this.callOfWildReloadTime = 0;
      }
      
      public function §function§() : void
      {
         this.§_-6a§ = null;
         this.callOfWildReloadTime = this.cRoot.gameSettings.heroes.heroArcher.callOfWildReloadTime * this.cRoot.gameSettings.framesRate;
         this.§_-0s§ = 0;
      }
      
      override public function changeRallyPoint(param1:Point) : void
      {
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
         this.§_-E3§();
         this.getMyPath();
         if(this.§_-6a§ != null)
         {
            this.§_-6a§.§_-Su§(this.§_-RK§,this.path);
         }
         this.playTaunt();
      }
      
      protected function §_-E3§() : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < this.cRoot.paths.length)
         {
            _loc4_ = 0;
            while(_loc4_ < this.cRoot.paths[_loc3_][0].length)
            {
               if(!this.cRoot.hasTunnels || !this.onTunnel(_loc3_,_loc4_))
               {
                  _loc2_ = Math.sqrt(Math.pow(this.cRoot.paths[_loc3_][0][_loc4_].y - this.rangePoint.y,2) + Math.pow(this.cRoot.paths[_loc3_][0][_loc4_].x - this.rangePoint.x,2));
                  if(_loc2_ < 30)
                  {
                     if(_loc1_ == 0 || _loc1_ > _loc2_)
                     {
                        this.§_-OB§ = _loc3_;
                        this.§throw§ = _loc4_;
                        _loc1_ = _loc2_;
                     }
                  }
               }
               _loc4_++;
            }
            _loc3_++;
         }
         if(this.§throw§ != 0)
         {
            _loc5_ = this.§throw§ - 5;
            if(_loc5_ < 0)
            {
               _loc5_ = 0;
            }
            this.§_-RK§ = this.cRoot.paths[this.§_-OB§][0][_loc5_];
         }
      }
      
      override protected function playTaunt() : void
      {
         this.cRoot.game.gameSounds.playHeroAlleriaTaunt();
      }
      
      override public function playDeadSound() : void
      {
         this.cRoot.game.gameSounds.playHeroAlleriaDeath();
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame19() : *
      {
         stop();
      }
      
      function frame34() : *
      {
         stop();
      }
      
      function frame53() : *
      {
         stop();
      }
      
      function frame68() : *
      {
         stop();
      }
      
      function frame94() : *
      {
         stop();
      }
      
      function frame133() : *
      {
         stop();
      }
      
      function frame141() : *
      {
         stop();
      }
   }
}
