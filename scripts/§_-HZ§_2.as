package
{
   import fl.lang.Locale;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.casalib.math.geom.Ellipse;
   
   public class §_-HZ§ extends §_-2A§
   {
       
      
      protected var surgeOfFlameLevel:int;
      
      protected var §_-DC§:Boolean;
      
      protected var §_-AT§:Boolean;
      
      protected var isSurgeOfFlameEnd:Boolean;
      
      protected var surgeOfFlameReloadTime:int;
      
      protected var §_-LU§:int;
      
      protected var §_-1I§:int;
      
      protected var §_-AS§:int;
      
      protected var surgeOfFlameSpeed:Number;
      
      protected var surgeOfFlameRangeWidth:int;
      
      protected var §_-6L§:int;
      
      protected var surgeOfFlameMinDamage:int;
      
      protected var surgeOfFlameMaxDamage:int;
      
      protected var surgeOfFlameBlockRangeWidth:int;
      
      protected var §_-1F§:int;
      
      protected var surgeOfFlameBlockMinDistance:int;
      
      protected var surgeOfFlameStartTime:int;
      
      protected var surgeOfFlameStartTimeCounter:int;
      
      protected var surgeOfFlameEndTime:int;
      
      protected var surgeOfFlameEndTimeCounter:int;
      
      protected var flamingFrenzyLevel:int;
      
      protected var §_-EV§:Boolean;
      
      protected var flamingFrenzyChargeTime:int;
      
      protected var flamingFrenzyChargeTimeCounter:int;
      
      protected var flamingFrenzyRangeWidth:int;
      
      protected var flamingFrenzyRangeHeight:int;
      
      protected var flamingFrenzyMinDamage:int;
      
      protected var flamingFrenzyMaxDamage:int;
      
      protected var flamingFrenzyHealing:int;
      
      protected var §_-Lg§;
      
      protected var §_-P3§:Number;
      
      protected var idleParticleCounter:int;
      
      public function §_-HZ§(param1:Point, param2:Point, param3:Tower, param4:Point)
      {
         addFrameScript(0,this.frame1,33,this.frame34,57,this.frame58,81,this.frame82,99,this.frame100,102,this.frame103,112,this.frame113,128,this.frame129);
         super(param1,param2,param3,param4,0);
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      override protected function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.lifes = 1;
         this.speed = 2.2;
         this.§_-P3§ = this.speed;
         this.xAdjust = 5;
         this.attackChargeTime = 19;
         this.attackChargeDamageTime = 9;
         this.respawnTime = 18;
         this.deadTime = this.cRoot.gameSettings.heroes.heroFire.respawn;
         this.idleTime = 30;
         this.§_-EZ§ = 24;
         this.§_-Hk§ = 0;
         this.§_-L3§ = 7;
         this.maxSize = this.cRoot.gameSettings.heroes.heroFire.maxSize;
         this.maxLevel = this.cRoot.gameSettings.heroes.heroFire.maxLevel;
         this.rangeWidth = this.cRoot.gameSettings.heroes.heroFire.range;
         this.rangeHeight = this.cRoot.gameSettings.heroes.heroFire.range * this.cRoot.gameSettings.rangeRatio;
         this.regenerateTime = this.cRoot.gameSettings.heroes.heroFire.regenReload;
         this.attackReloadTime = this.cRoot.gameSettings.heroes.heroFire.reload - this.attackChargeTime;
         this.xpMultiplier = this.cRoot.gameSettings.heroes.heroFire.xpMultiplier;
         this.§_-9h§ = this.cRoot.gameSettings.heroes.heroFire.surgeOfFlameModifier;
         this.§_-LI§ = this.cRoot.gameSettings.heroes.heroFire.flamingFrenzyModifier;
         this.§_-Jc§ = new §_-Ov§(new Point(0,-38),this.health,this.initHealth);
         this.§_-Jc§.updateMaxHealth(this.initHealth,this.health);
         this.§_-Jc§.updateProgress(this.health);
         this.addChild(§_-Jc§);
         this.surgeOfFlameStartTime = 3;
         this.surgeOfFlameEndTime = 10;
         this.§_-Gv§ = this.cRoot.gameSettings.heroes.heroFire.portrait;
         this.§_-DH§();
         this.level = 1;
         this.levelUpWithAnimation(false);
         this.§_-1I§ = 31;
         this.flamingFrenzyChargeTime = 24;
         this.isActive = false;
         this.isDead = true;
         this.deadTimeCounter = this.deadTime - 1;
         this.§_-Lg§ = 0;
         this.idleParticleCounter = 0;
         this.cRoot.addSoldier(this);
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.sIconName = "ignus";
         param1.sName = Locale.loadStringEx("HERO_FIRE_NAME",Locale.getDefaultLang());
         param1.sRespawn = this.cRoot.gameSettings.heroes.heroFire.respawn / this.cRoot.gameSettings.framesRate + "s";
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
            case "flamingEnd":
               break;
            case "surgeOfFlameStartEnd":
               break;
            case "surgeOfFlameEndEnd":
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
         this.health = this.initHealth = this.cRoot.gameSettings.heroes.heroFire.health[this.level - 1];
         this.§_-Rd§ = this.cRoot.gameSettings.heroes.heroFire.regen[this.level - 1];
         this.armor = this.cRoot.gameSettings.heroes.heroFire.armor[this.level - 1];
         this.minDamage = this.cRoot.gameSettings.heroes.heroFire.minDamage[this.level - 1];
         this.maxDamage = this.cRoot.gameSettings.heroes.heroFire.maxDamage[this.level - 1];
         this.§_-Jc§.updateMaxHealth(this.initHealth,this.health);
         this.§_-Jc§.updateProgress(this.health);
         this.portrait.updateHealth();
         this.portrait.updateXp();
         this.upgradeFlamingFrenzy();
         this.upgradeSurgeOfFlame();
      }
      
      override protected function runSpecial() : Boolean
      {
         this.§_-LU§++;
         if(super.runSpecial())
         {
            return true;
         }
         if(this.§_-DC§ && this.§_-P1§())
         {
            return true;
         }
         if(this.§_-EV§ && this.§_-Ch§())
         {
            return true;
         }
         return false;
      }
      
      override protected function stopSpecial() : void
      {
         super.stopSpecial();
         this.§_-EV§ = false;
         this.isCharging = false;
         this.§_-La§ = false;
         this.§_-DC§ = false;
         this.§_-AT§ = false;
         this.isSurgeOfFlameEnd = false;
      }
      
      override protected function readyToRespawn() : Boolean
      {
         this.deadTimeCounter++;
         if(this.deadTimeCounter >= this.deadTime)
         {
            this.isDead = false;
            this.doorQueed = false;
            this.isRespawning = true;
            this.visible = true;
            this.gotoAndPlay("respawning");
            this.§_-l§();
            this.speed = this.§_-P3§;
            this.lifes++;
            this.portrait.endLoading();
            return true;
         }
         this.portrait.updateLoading(this.deadTime,this.deadTimeCounter);
         return false;
      }
      
      protected function upgradeFlamingFrenzy() : void
      {
         if(this.level != 4 && this.level != 7 && this.level != 10)
         {
            return;
         }
         if(this.level == 4)
         {
            this.flamingFrenzyLevel = 1;
         }
         if(this.level == 7)
         {
            this.flamingFrenzyLevel = 2;
         }
         if(this.level == 10)
         {
            this.flamingFrenzyLevel = 3;
         }
         this.flamingFrenzyMinDamage = this.cRoot.gameSettings.heroes.heroFire.flamingFrenzyMinDamage + this.cRoot.gameSettings.heroes.heroFire.surgeOfFlameDamageIncrement * this.flamingFrenzyLevel;
         this.flamingFrenzyMaxDamage = this.cRoot.gameSettings.heroes.heroFire.flamingFrenzyMaxDamage + this.cRoot.gameSettings.heroes.heroFire.surgeOfFlameDamageIncrement * this.flamingFrenzyLevel;
         this.flamingFrenzyRangeWidth = this.cRoot.gameSettings.heroes.heroFire.flamingFrenzyRangeWidth;
         this.flamingFrenzyRangeHeight = this.flamingFrenzyRangeWidth * this.cRoot.gameSettings.rangeRatio;
      }
      
      protected function §_-Ch§() : Boolean
      {
         var _loc1_:EnemyCommon = null;
         if(this.flamingFrenzyChargeTimeCounter < this.flamingFrenzyChargeTime)
         {
            this.flamingFrenzyChargeTimeCounter++;
            if(this.flamingFrenzyChargeTimeCounter == 12)
            {
               this.cRoot.decals.addChild(new §_-Ns§(new Point(this.x,this.y),this.cRoot));
               for each(_loc1_ in this.cRoot.enemies)
               {
                  if(!_loc1_.isBoss && !_loc1_.isFlying && _loc1_.isActive && this.onRangeFlamingFrenzy(_loc1_))
                  {
                     _loc1_.burnDamage(this.getDamageFlamingFrenzy());
                  }
               }
               this.heal(this.initHealth * 0.2);
            }
            return true;
         }
         this.§_-EV§ = false;
         this.flamingFrenzyChargeTimeCounter = 0;
         this.§_-J9§();
         return false;
      }
      
      protected function §_-JB§() : void
      {
         this.stopSpecial();
         this.§_-EV§ = true;
         this.gotoAndPlay("flaming");
         this.§_-7U§(2,this.flamingFrenzyLevel);
         this.cRoot.game.gameSounds.playHeroIgnusArea();
      }
      
      protected function getDamageFlamingFrenzy() : int
      {
         return this.flamingFrenzyMinDamage + Math.ceil(Math.random() * (this.flamingFrenzyMaxDamage - this.flamingFrenzyMinDamage));
      }
      
      protected function onRangeFlamingFrenzy(param1:Enemy) : Boolean
      {
         var _loc2_:* = new Ellipse(this.x - this.flamingFrenzyRangeWidth / 2,this.y - this.flamingFrenzyRangeHeight / 2,this.flamingFrenzyRangeWidth,this.flamingFrenzyRangeHeight);
         return _loc2_.containsPoint(new Point(param1.x,param1.y));
      }
      
      override protected function readyToAttack() : Boolean
      {
         this.addParticleIdle();
         this.attackReloadTimeCounter++;
         if(this.attackReloadTimeCounter == this.attackReloadTime)
         {
            this.chargeAttack();
            this.attackReloadTimeCounter = 0;
            return true;
         }
         return false;
      }
      
      override protected function fight() : void
      {
         this.attackChargeTimeCounter++;
         if(this.attackChargeTimeCounter < this.attackChargeTime)
         {
            if(this.attackChargeTimeCounter == this.attackChargeDamageTime - 2)
            {
               this.cRoot.game.gameSounds.playHeroMalikHit();
            }
            if(this.attackChargeTimeCounter == this.attackChargeDamageTime)
            {
               this.hitEnemy();
            }
            return;
         }
         this.attackChargeTimeCounter = 0;
         this.isCharging = false;
         if(this.§_-Bo§())
         {
            this.§_-6B§();
            return;
         }
         if(this.flamingFrenzyLevel != 0 && !this.§_-EV§ && !this.§_-La§ && Math.random() < 0.25)
         {
            this.§_-JB§();
         }
      }
      
      protected function upgradeSurgeOfFlame() : void
      {
         if(this.level != 2 && this.level != 5 && this.level != 8)
         {
            return;
         }
         if(this.level == 2)
         {
            this.surgeOfFlameLevel = 1;
         }
         if(this.level == 5)
         {
            this.surgeOfFlameLevel = 2;
         }
         if(this.level == 8)
         {
            this.surgeOfFlameLevel = 3;
         }
         this.surgeOfFlameReloadTime = this.cRoot.gameSettings.heroes.heroFire.surgeOfFlameReloadTime * this.cRoot.gameSettings.framesRate;
         this.surgeOfFlameMinDamage = this.cRoot.gameSettings.heroes.heroFire.surgeOfFlameMinDamage + this.cRoot.gameSettings.heroes.heroFire.surgeOfFlameMinDamage * this.surgeOfFlameLevel;
         this.surgeOfFlameMaxDamage = this.cRoot.gameSettings.heroes.heroFire.surgeOfFlameMaxDamage + this.cRoot.gameSettings.heroes.heroFire.surgeOfFlameDamageIncrement * this.surgeOfFlameLevel;
         this.surgeOfFlameRangeWidth = this.cRoot.gameSettings.heroes.heroFire.surgeOfFlameRangeWidth;
         this.§_-6L§ = this.surgeOfFlameRangeWidth * this.cRoot.gameSettings.rangeRatio;
         this.surgeOfFlameBlockRangeWidth = this.cRoot.gameSettings.heroes.heroFire.surgeOfFlameBlockRangeWidth;
         this.§_-1F§ = this.surgeOfFlameBlockRangeWidth * this.cRoot.gameSettings.rangeRatio;
         this.surgeOfFlameBlockMinDistance = this.cRoot.gameSettings.heroes.heroFire.surgeOfFlameBlockMinDistance;
         this.surgeOfFlameSpeed = this.cRoot.gameSettings.heroes.heroFire.surgeOfFlameSpeed;
      }
      
      protected function §_-Bo§() : Boolean
      {
         var _loc2_:Enemy = null;
         if(this.§_-LU§ < this.surgeOfFlameReloadTime)
         {
            return false;
         }
         if(!this.isActive)
         {
            return false;
         }
         var _loc1_:Enemy = null;
         for each(_loc2_ in this.cRoot.enemies)
         {
            if(_loc2_.isActive && !_loc2_.isBlocked && _loc2_.canBeBlocked && this.onRangeSurgeOfFlameBlock(_loc2_) && this.§_-Rl§(_loc2_) && (_loc2_.currentNode > 20 && _loc2_.currentNode < _loc2_.road.length - 20))
            {
               _loc1_ = _loc2_;
               break;
            }
         }
         if(_loc1_ != null)
         {
            if(this.isBlocking && this.enemy != null)
            {
               this.enemy.stopFighting();
            }
            this.§_-Mw§();
            this.§_-1M§(_loc1_);
            this.rangePoint = this.destinationPoint;
            this.rallyPoint = this.rangePoint;
            return true;
         }
         return false;
      }
      
      protected function §_-Rl§(param1:Enemy) : Boolean
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:Number = NaN;
         _loc3_ = param1.x - this.x;
         _loc4_ = param1.y - this.y;
         _loc2_ = Math.sqrt(_loc3_ * _loc3_ + _loc4_ * _loc4_);
         if(_loc2_ > this.surgeOfFlameBlockMinDistance)
         {
            return true;
         }
         return false;
      }
      
      protected function §_-P1§() : Boolean
      {
         if(!this.§_-AT§)
         {
            this.surgeOfFlameStartTimeCounter++;
            if(this.surgeOfFlameStartTimeCounter < this.surgeOfFlameStartTime)
            {
               return true;
            }
            this.§_-AT§ = true;
            return false;
         }
         if(this.isSurgeOfFlameEnd)
         {
            this.surgeOfFlameEndTimeCounter++;
            if(this.surgeOfFlameEndTimeCounter < this.surgeOfFlameEndTime)
            {
               return true;
            }
            this.doSurgeOfFlameEnd();
            return false;
         }
         return false;
      }
      
      protected function §_-6B§() : void
      {
         this.§_-DC§ = true;
         this.§_-AT§ = false;
         this.isSurgeOfFlameEnd = false;
         this.speed = this.surgeOfFlameSpeed;
         if(this.enemy.scaleX == -1)
         {
            this.destinationPoint = new Point(this.destinationPoint.x - 6,this.destinationPoint.y);
         }
         else
         {
            this.destinationPoint = new Point(this.destinationPoint.x - 2,this.destinationPoint.y);
         }
         this.gotoAndPlay("surgeOfFlameStart");
         this.§_-7U§(1,this.surgeOfFlameLevel);
         this.cRoot.game.gameSounds.playHeroIgnusStart();
      }
      
      protected function doSurgeOfFlameEnd() : void
      {
         this.§_-DC§ = false;
         this.isSurgeOfFlameEnd = false;
         this.§_-AT§ = false;
         this.§_-LU§ = 0;
         this.speed = this.§_-P3§;
         this.§_-8v§();
      }
      
      protected function onRangeSurgeOfFlame(param1:Enemy) : Boolean
      {
         var _loc2_:* = new Ellipse(this.x - this.surgeOfFlameRangeWidth / 2,this.y - this.§_-6L§ / 2,this.surgeOfFlameRangeWidth,this.§_-6L§);
         return _loc2_.containsPoint(new Point(param1.x,param1.y));
      }
      
      protected function onRangeSurgeOfFlameBlock(param1:Enemy) : Boolean
      {
         var _loc2_:* = new Ellipse(this.x - this.surgeOfFlameBlockRangeWidth / 2,this.y - this.§_-1F§ / 2,this.surgeOfFlameBlockRangeWidth,this.§_-1F§);
         return _loc2_.containsPoint(new Point(param1.x,param1.y));
      }
      
      protected function getDamageSurgeOfFlame() : int
      {
         return this.surgeOfFlameMinDamage + Math.ceil(Math.random() * (this.surgeOfFlameMaxDamage - this.surgeOfFlameMinDamage));
      }
      
      protected function §_-18§() : void
      {
         var _loc1_:EnemyCommon = null;
         var _loc2_:§_-3z§ = null;
         if(this.§_-DC§ && this.§_-AT§)
         {
            for each(_loc1_ in this.cRoot.enemies)
            {
               if(!_loc1_.isBoss && !_loc1_.isFlying && _loc1_.isActive && this.onRangeSurgeOfFlame(_loc1_))
               {
                  _loc1_.burnDamage(this.getDamageSurgeOfFlame());
               }
            }
            _loc2_ = new §_-3z§();
            _loc2_.§_-Rt§(new Point(this.x + 6,this.y - 16),this.cRoot.decals);
         }
         else
         {
            this.§_-Lg§++;
            if(this.§_-Lg§ == 3)
            {
               this.cRoot.entities.addChild(new §_-2M§(new Point(this.x,this.y - 1),this.cRoot));
               this.§_-Lg§ = 0;
            }
         }
      }
      
      override protected function destinationReach() : Boolean
      {
         if(Math.sqrt(Math.pow(this.destinationPoint.y - this.y,2) + Math.pow(this.destinationPoint.x - this.x,2)) <= this.speed)
         {
            this.isWalking = false;
            this.isActive = true;
            this.x = Math.round(this.destinationPoint.x);
            this.y = Math.round(this.destinationPoint.y);
            if(this.isFighting)
            {
               if(!this.§_-DC§)
               {
                  this.§_-8v§();
               }
               if(this.isBlocking)
               {
                  if(this.enemy != null && this.enemy.isActive)
                  {
                     this.enemy.startFighting();
                  }
               }
               if(this.§_-DC§)
               {
                  this.§_-AT§ = false;
                  this.isSurgeOfFlameEnd = true;
                  this.gotoAndPlay("surgeOfFlameEnd");
                  this.cRoot.game.gameSounds.playHeroIgnusEnd();
                  return false;
               }
            }
            else
            {
               this.isIdle = true;
            }
            this.animationIdle();
            if(this.§_-DC§)
            {
               this.§_-DC§ = false;
            }
            return true;
         }
         return false;
      }
      
      override public function changeRallyPoint(param1:Point) : void
      {
         this.rallyPoint = param1;
         this.rangePoint = param1;
         if(this.isDead || this.isRespawning)
         {
            return;
         }
         var _loc2_:Boolean = this.§_-DC§;
         this.isActive = false;
         this.§_-Mw§();
         this.setGoToIdleStatus();
         this.stopSpecial();
         this.speed = this.§_-P3§;
         this.getMyPath();
         this.playTaunt();
         if(_loc2_)
         {
            this.animationRun();
         }
      }
      
      override protected function walk() : Boolean
      {
         var _loc3_:Number = NaN;
         if(this.path == null || this.path.length == 0)
         {
            if(this.isActive)
            {
               if(this.isFighting)
               {
                  if(this.enemy == null || !this.enemy.isActive || !this.enemy.isBlocked)
                  {
                     this.§_-Mw§();
                     if(this.§_-DC§ || !this.findEnemy())
                     {
                        this.speed = this.§_-P3§;
                        this.setGoToIdleStatus();
                     }
                  }
                  else if(!this.isBlocking)
                  {
                     this.findEnemy();
                  }
               }
               else
               {
                  this.findEnemy();
               }
            }
            if(this.destinationReach())
            {
               return true;
            }
            _loc3_ = Math.atan2(this.destinationPoint.y - this.y,this.destinationPoint.x - this.x);
            if(this.destinationPoint.x < this.x)
            {
               this.scaleX = -1;
               this.§_-Jc§.flip(-1);
            }
            else
            {
               this.scaleX = 1;
               this.§_-Jc§.flip(1);
            }
            this.§_-18§();
            this.x = this.x + Math.cos(_loc3_) * this.speed;
            this.y = this.y + Math.sin(_loc3_) * this.speed;
            this.evalRunningEnd();
            return false;
         }
         if(this.§_-IW§(this.path[this.§_-Js§ - 1].getNodeRealPosition()))
         {
            this.§_-Js§--;
            if(this.§_-Js§ - 1 == 0)
            {
               this.path = [];
               this.path = null;
               this.§_-Js§ = 0;
               return super.walk();
            }
         }
         var _loc1_:§_-Ts§ = this.path[this.§_-Js§ - 1];
         var _loc2_:Point = _loc1_.getNodeRealPosition();
         _loc3_ = Math.atan2(_loc2_.y - this.y,_loc2_.x - this.x);
         if(_loc2_.x >= this.x)
         {
            this.scaleX = 1;
            this.§_-Jc§.flip(1);
         }
         else
         {
            this.scaleX = -1;
            this.§_-Jc§.flip(-1);
         }
         this.§_-18§();
         this.x = this.x + Math.cos(_loc3_) * this.speed;
         this.y = this.y + Math.sin(_loc3_) * this.speed;
         this.evalRunningEnd();
         return false;
      }
      
      override public function setGoToIdleStatus() : void
      {
         if(!this.isWalking)
         {
            this.isIdle = false;
            this.isWalking = true;
            this.animationRun();
         }
         this.enemy = null;
         this.isFighting = false;
         this.isBlocking = false;
         this.isCharging = false;
         this.§_-DC§ = false;
         this.destinationPoint.x = this.rallyPoint.x;
         this.destinationPoint.y = this.rallyPoint.y;
      }
      
      override protected function playIdle() : void
      {
         super.playIdle();
         this.addParticleIdle();
      }
      
      protected function addParticleIdle() : void
      {
         this.idleParticleCounter++;
         var _loc1_:int = 0;
         if(this.scaleX == -1)
         {
            _loc1_ = 2;
         }
         switch(this.idleParticleCounter)
         {
            case 2:
               this.cRoot.entities.addChild(new IgnusParticleIdle(new Point(this.x - 12 + _loc1_,this.y - 15),this.cRoot));
               break;
            case 4:
               this.cRoot.entities.addChild(new IgnusParticleIdle(new Point(this.x - 8 + _loc1_,this.y - 20),this.cRoot));
               break;
            case 6:
               this.cRoot.entities.addChild(new IgnusParticleIdle(new Point(this.x - 2,this.y - 28),this.cRoot));
               break;
            case 8:
               this.cRoot.entities.addChild(new IgnusParticleIdle(new Point(this.x + 4,this.y - 27),this.cRoot));
               break;
            case 10:
               this.cRoot.entities.addChild(new IgnusParticleIdle(new Point(this.x + 7 + _loc1_,this.y - 18),this.cRoot));
               break;
            case 12:
               this.cRoot.entities.addChild(new IgnusParticleIdle(new Point(this.x + 10 + _loc1_,this.y - 14),this.cRoot));
               this.idleParticleCounter = 0;
         }
      }
      
      override protected function playTaunt() : void
      {
         this.cRoot.game.gameSounds.playHeroIgnusTaunt();
      }
      
      override public function playDeadSound() : void
      {
         this.cRoot.game.gameSounds.playHeroIgnusDeath();
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame34() : *
      {
         stop();
      }
      
      function frame58() : *
      {
         stop();
      }
      
      function frame82() : *
      {
         stop();
      }
      
      function frame100() : *
      {
         stop();
      }
      
      function frame103() : *
      {
         stop();
      }
      
      function frame113() : *
      {
         stop();
      }
      
      function frame129() : *
      {
         stop();
      }
   }
}
