package
{
   import fl.lang.Locale;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.casalib.math.geom.Ellipse;
   
   public class §_-Mg§ extends §_-2A§
   {
       
      
      var §_-PY§:int;
      
      var smashLevel:int;
      
      var §_-Kf§:Boolean;
      
      var smashRangeWidth:int;
      
      var smashRangeHeight:int;
      
      var smashMinDamage:int;
      
      var smashMaxDamage:int;
      
      var smashDamageIncrement:int;
      
      var smashReloadTime:int;
      
      var smashReloadTimeCounter:int;
      
      var smashChargeTime:int;
      
      var smashChargeTimeCounter:int;
      
      var fissureLevel:int;
      
      var §_-Ik§:Boolean;
      
      var fissureRangeWidth:int;
      
      var fissureRangeHeight:int;
      
      var fissureMinDamage:int;
      
      var fissureMaxDamage:int;
      
      var fissureDamageIncrement:int;
      
      var fissureReloadTime:int;
      
      var fissureReloadTimeCounter:int;
      
      var fissureChargeTime:int;
      
      var fissureChargeTimeCounter:int;
      
      var fissureNodePath:int;
      
      var fissureNodeSubPath:int;
      
      var fissureNodeIndex:int;
      
      public function §_-Mg§(param1:Point, param2:Point, param3:Tower, param4:Point)
      {
         addFrameScript(0,this.frame1,24,this.frame25,41,this.frame42,76,this.frame77,105,this.frame106,129,this.frame130,148,this.frame149,158,this.frame159);
         super(param1,param2,param3,param4,0);
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      override protected function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.lifes = 1;
         this.speed = 1.45;
         this.xAdjust = 5;
         this.attackChargeTime = 12;
         this.attackChargeDamageTime = 6;
         this.respawnTime = 22;
         this.deadTime = this.cRoot.gameSettings.heroes.heroMalik.respawn;
         this.idleTime = 30;
         this.§_-EZ§ = 22;
         this.§_-Hk§ = 0;
         this.§_-L3§ = 5;
         this.maxSize = this.cRoot.gameSettings.heroes.heroMalik.maxSize;
         this.maxLevel = this.cRoot.gameSettings.heroes.heroMalik.maxLevel;
         this.rangeWidth = this.cRoot.gameSettings.heroes.heroMalik.range;
         this.rangeHeight = this.cRoot.gameSettings.heroes.heroMalik.range * this.cRoot.gameSettings.rangeRatio;
         this.attackReloadTime = this.cRoot.gameSettings.heroes.heroMalik.reload - this.attackChargeTime;
         this.xpMultiplier = this.cRoot.gameSettings.heroes.heroMalik.xpMultiplier;
         this.§_-9h§ = this.cRoot.gameSettings.heroes.heroMalik.smashModifier;
         this.§_-LI§ = this.cRoot.gameSettings.heroes.heroMalik.fissureModifier;
         this.§_-Jc§ = new §_-Ov§(new Point(0,-32),this.health,this.initHealth);
         this.§_-Jc§.updateMaxHealth(this.initHealth,this.health);
         this.§_-Jc§.updateProgress(this.health);
         this.addChild(§_-Jc§);
         this.§_-Gv§ = this.cRoot.gameSettings.heroes.heroMalik.portrait;
         this.§_-DH§();
         this.level = 1;
         this.levelUpWithAnimation(false);
         this.smashChargeTime = 28;
         this.fissureChargeTime = 35;
         this.isActive = false;
         this.isDead = true;
         this.deadTimeCounter = this.deadTime - 1;
         this.cRoot.addSoldier(this);
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.sIconName = "malik";
         param1.sName = Locale.loadStringEx("HERO_REINFORCEMENT_NAME",Locale.getDefaultLang());
         param1.sRespawn = this.cRoot.gameSettings.heroes.heroMalik.respawn / this.cRoot.gameSettings.framesRate + "s";
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
            case "fighting2End":
               break;
            case "respawningEnd":
               break;
            case "lvlUp":
               break;
            case "fissureEnd":
               break;
            case "smashEnd":
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
         this.health = this.initHealth = this.cRoot.gameSettings.heroes.heroMalik.health[this.level];
         this.§_-Rd§ = this.cRoot.gameSettings.heroes.heroMalik.regen[this.level];
         this.armor = this.cRoot.gameSettings.heroes.heroMalik.armor[this.level];
         this.minDamage = this.cRoot.gameSettings.heroes.heroMalik.minDamage[this.level];
         this.maxDamage = this.cRoot.gameSettings.heroes.heroMalik.maxDamage[this.level];
         this.§_-Jc§.updateMaxHealth(this.initHealth,this.health);
         this.§_-Jc§.updateProgress(this.health);
         this.portrait.updateHealth();
         this.portrait.updateXp();
         this.upgradeFissure();
         this.upgradeSmash();
      }
      
      override protected function runSpecial() : Boolean
      {
         this.smashReloadTimeCounter++;
         this.fissureReloadTimeCounter++;
         if(super.runSpecial())
         {
            return true;
         }
         if(this.smashLevel != 0 && this.§_-Q3§())
         {
            return true;
         }
         if(this.fissureLevel != 0 && this.§_-3Q§())
         {
            return true;
         }
         return false;
      }
      
      override protected function stopSpecial() : void
      {
         super.stopSpecial();
         this.§_-Kf§ = false;
         this.§_-Ik§ = false;
         this.§_-La§ = false;
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
               this.cRoot.game.gameSounds.playHeroMalikHit();
               this.hitEnemy();
            }
            return;
         }
         this.attackChargeTimeCounter = 0;
         this.isCharging = false;
      }
      
      protected function upgradeSmash() : void
      {
         if(this.level != 2 && this.level != 5 && this.level != 8)
         {
            return;
         }
         if(this.level == 2)
         {
            this.smashLevel = 1;
         }
         if(this.level == 5)
         {
            this.smashLevel = 2;
         }
         if(this.level == 8)
         {
            this.smashLevel = 3;
         }
         this.smashRangeWidth = this.cRoot.gameSettings.heroes.heroMalik.smashRangeWidth;
         this.smashRangeHeight = this.smashRangeWidth * this.cRoot.gameSettings.rangeRatio;
         this.smashReloadTime = this.cRoot.gameSettings.heroes.heroMalik.smashReloadTime * this.cRoot.gameSettings.framesRate;
         this.smashMinDamage = this.cRoot.gameSettings.heroes.heroMalik.smashMinDamage + this.cRoot.gameSettings.heroes.heroMalik.smashDamageIncrement * this.smashLevel;
         this.smashMaxDamage = this.cRoot.gameSettings.heroes.heroMalik.smashMaxDamage + this.cRoot.gameSettings.heroes.heroMalik.smashDamageIncrement * this.smashLevel;
      }
      
      protected function §_-Q3§() : Boolean
      {
         if(this.§_-La§ || this.isCharging || this.§_-Ik§ || this.isWalking)
         {
            return false;
         }
         if(!this.§_-Kf§)
         {
            if(this.smashReloadTimeCounter < this.smashReloadTime)
            {
               return false;
            }
            if(!this.§_-6q§())
            {
               return false;
            }
            this.§_-Kf§ = true;
            this.smashChargeTimeCounter = 0;
            this.smashReloadTimeCounter = 0;
            this.gotoAndPlay("smash");
            this.cRoot.game.gameSounds.playHeroMalikCharge();
            this.§_-7U§(1,this.smashLevel);
            return true;
         }
         if(this.smashChargeTimeCounter < this.smashChargeTime)
         {
            this.smashChargeTimeCounter++;
            if(this.smashChargeTimeCounter == 14)
            {
               if(this.scaleX == 1)
               {
                  this.cRoot.addToDecal(new BombDecal(new Point(this.x + 17,this.y)));
                  this.cRoot.addToDecal(new §_-QC§(new Point(this.x + 17,this.y),this.cRoot));
               }
               else
               {
                  this.cRoot.addToDecal(new BombDecal(new Point(this.x - 17,this.y)));
                  this.cRoot.addToDecal(new §_-QC§(new Point(this.x - 17,this.y),this.cRoot));
               }
               this.§ set§();
            }
            return true;
         }
         this.§_-Kf§ = false;
         this.isCharging = false;
         this.attackReloadTimeCounter = 0;
         this.attackChargeTimeCounter = 0;
         this.smashChargeTimeCounter = 0;
         this.smashReloadTimeCounter = 0;
         this.§_-J9§();
         return false;
      }
      
      protected function §_-6q§() : Boolean
      {
         var _loc2_:Enemy = null;
         if(this.enemy == null || !this.enemy.isActive || !this.enemy.isFighting || this.isWalking)
         {
            return false;
         }
         var _loc1_:int = 0;
         for each(_loc2_ in this.cRoot.enemies)
         {
            if(_loc2_.isActive && !_loc2_.isFlying && this.onRangeSmash(_loc2_))
            {
               _loc1_++;
               if(_loc1_ == 3)
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      protected function § set§() : void
      {
         var _loc1_:Enemy = null;
         for each(_loc1_ in this.cRoot.enemies)
         {
            if(_loc1_.isActive && !_loc1_.isFlying && this.onRangeSmash(_loc1_))
            {
               _loc1_.setDamage(this.getDamageSmash(),this.cRoot.gameSettings.I_ARMOR,null,0,false);
            }
         }
      }
      
      protected function onRangeSmash(param1:Object) : Boolean
      {
         var _loc2_:* = new Ellipse(this.x - this.smashRangeWidth / 2,this.y - this.smashRangeHeight / 2,this.smashRangeWidth,this.smashRangeHeight);
         return _loc2_.containsPoint(new Point(param1.x,param1.y));
      }
      
      protected function getDamageSmash() : int
      {
         return this.smashMinDamage + Math.ceil(Math.random() * (this.smashMaxDamage - this.smashMinDamage));
      }
      
      protected function upgradeFissure() : void
      {
         if(this.level != 4 && this.level != 7 && this.level != 10)
         {
            return;
         }
         if(this.level == 4)
         {
            this.fissureLevel = 1;
         }
         if(this.level == 7)
         {
            this.fissureLevel = 2;
         }
         if(this.level == 10)
         {
            this.fissureLevel = 3;
         }
         this.fissureRangeWidth = this.cRoot.gameSettings.heroes.heroMalik.fissureRangeWidth;
         this.fissureRangeHeight = this.fissureRangeWidth * this.cRoot.gameSettings.rangeRatio;
         this.fissureReloadTime = this.cRoot.gameSettings.heroes.heroMalik.fissureReloadTime * this.cRoot.gameSettings.framesRate;
         this.fissureMinDamage = this.cRoot.gameSettings.heroes.heroMalik.fissureMinDamage + this.cRoot.gameSettings.heroes.heroMalik.fissureDamageIncrement * this.fissureLevel;
         this.fissureMaxDamage = this.cRoot.gameSettings.heroes.heroMalik.fissureMaxDamage + this.cRoot.gameSettings.heroes.heroMalik.fissureDamageIncrement * this.fissureLevel;
      }
      
      protected function §_-3Q§() : Boolean
      {
         if(this.§_-La§ || this.isCharging || this.§_-Kf§ || this.isWalking)
         {
            return false;
         }
         if(!this.§_-Ik§)
         {
            if(this.fissureReloadTimeCounter < this.fissureReloadTime)
            {
               return false;
            }
            if(!this.isFighting || !this.§_-J3§())
            {
               return false;
            }
            this.§_-Ik§ = true;
            this.fissureChargeTimeCounter = 0;
            this.fissureReloadTimeCounter = 0;
            this.gotoAndPlay("fissure");
            this.cRoot.game.gameSounds.playHeroMalikJump();
            this.§_-7U§(2,this.fissureLevel);
            return true;
         }
         if(this.fissureChargeTimeCounter < this.fissureChargeTime)
         {
            this.fissureChargeTimeCounter++;
            if(this.fissureChargeTimeCounter == 17)
            {
               this.§_-Sc§();
            }
            return true;
         }
         this.§_-Ik§ = false;
         this.isCharging = false;
         this.attackReloadTimeCounter = 0;
         this.attackChargeTimeCounter = 0;
         this.fissureChargeTimeCounter = 0;
         this.fissureReloadTimeCounter = 0;
         this.§_-J9§();
         return false;
      }
      
      protected function §_-J3§() : Boolean
      {
         if(this.enemy == null || !this.enemy.isActive || !this.enemy.isFighting || this.isWalking)
         {
            return false;
         }
         if(this.enemy.road == this.cRoot.paths[this.enemy.roadIndex][0])
         {
            this.fissureNodeSubPath = 0;
         }
         else if(this.enemy.road == this.cRoot.paths[this.enemy.roadIndex][1])
         {
            this.fissureNodeSubPath = 1;
         }
         else
         {
            this.fissureNodeSubPath = 2;
         }
         this.fissureNodePath = this.enemy.roadIndex;
         this.fissureNodeIndex = this.enemy.currentNode;
         return true;
      }
      
      protected function §_-Sc§() : void
      {
         if(this.scaleX == 1)
         {
            this.doFissureDamage(new Point(this.x + 17,this.y));
         }
         else
         {
            this.doFissureDamage(new Point(this.x - 17,this.y));
         }
         this.cRoot.entities.addChild(new §_-Hz§(this.fissureNodePath,this.fissureNodeSubPath,this.fissureNodeIndex,this.fissureLevel,this.fissureMinDamage,this.fissureMaxDamage,this.fissureRangeWidth,this.fissureRangeHeight,this.cRoot));
      }
      
      protected function doFissureDamage(param1:Point) : void
      {
         var _loc2_:Enemy = null;
         this.cRoot.entities.addChild(new §_-Rw§(param1,this.cRoot));
         for each(_loc2_ in this.cRoot.enemies)
         {
            if(_loc2_.isActive && this.onRangeFissure(_loc2_,param1))
            {
               _loc2_.setDamage(this.getDamageFissure(),this.cRoot.gameSettings.I_ARMOR,null,0,false);
               if(!_loc2_.isBoss && !_loc2_.isFlying && _loc2_.isActive && !_loc2_.isDead)
               {
                  _loc2_.addDebuff(new §_-SG§(this.cRoot,1,_loc2_));
               }
            }
         }
      }
      
      protected function onRangeFissure(param1:Object, param2:Point) : Boolean
      {
         var _loc3_:* = new Ellipse(param2.x - this.fissureRangeWidth / 2,param2.y - this.fissureRangeHeight / 2,this.fissureRangeWidth,this.fissureRangeHeight);
         return _loc3_.containsPoint(new Point(param1.x,param1.y));
      }
      
      protected function getDamageFissure() : int
      {
         return this.fissureMinDamage + Math.ceil(Math.random() * (this.fissureMaxDamage - this.fissureMinDamage));
      }
      
      override protected function chargeAttack() : void
      {
         if(Math.random() > 0.5)
         {
            this.gotoAndPlay("fighting");
         }
         else
         {
            this.gotoAndPlay("fighting2");
         }
         this.isCharging = true;
      }
      
      override protected function playTaunt() : void
      {
         this.cRoot.game.gameSounds.playHeroMalikTaunt();
      }
      
      override public function playDeadSound() : void
      {
         this.cRoot.game.gameSounds.playHeroMalikDeath();
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame25() : *
      {
         stop();
      }
      
      function frame42() : *
      {
         stop();
      }
      
      function frame77() : *
      {
         stop();
      }
      
      function frame106() : *
      {
         stop();
      }
      
      function frame130() : *
      {
         stop();
      }
      
      function frame149() : *
      {
         stop();
      }
      
      function frame159() : *
      {
         stop();
      }
   }
}
