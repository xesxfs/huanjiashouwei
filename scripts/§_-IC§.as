package
{
   import fl.lang.Locale;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.casalib.math.geom.Ellipse;
   
   public class §_-IC§ extends §_-2A§
   {
       
      
      protected var currentWeapon:int;
      
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
      
      protected var buffLevel:int;
      
      protected var §_-JL§:Boolean;
      
      protected var buffReloadTime:int;
      
      protected var buffReloadTimeCounter:int;
      
      protected var buffChargeTime:int;
      
      protected var buffChargeTimeCounter:int;
      
      protected var buffRangeWidth:int;
      
      protected var buffRangeHeight:int;
      
      protected var catapultLevel:int;
      
      protected var §_-DX§:Boolean;
      
      protected var catapultPoint:Point;
      
      protected var catapultReloadTime:int;
      
      protected var catapultReloadTimeCounter:int;
      
      protected var catapultChargeTime:int;
      
      protected var catapultChargeTimeCounter:int;
      
      protected var catapultRangeWidth:int;
      
      protected var catapultRangeHeight:int;
      
      protected var catapultRangeMin:int;
      
      public function §_-IC§(param1:Point, param2:Point, param3:Tower, param4:Point)
      {
         addFrameScript(0,this.frame1,25,this.frame26,45,this.frame46,65,this.frame66,85,this.frame86,140,this.frame141,177,this.frame178,191,this.frame192,218,this.frame219,239,this.frame240);
         super(param1,param2,param3,param4,0);
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      override protected function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.lifes = 1;
         this.speed = 1.5;
         this.xAdjust = 17;
         this.attackChargeTime = 19;
         this.attackChargeDamageTime = 8;
         this.respawnTime = 21;
         this.deadTime = this.cRoot.gameSettings.heroes.heroKing.respawn;
         this.idleTime = 30;
         this.§_-EZ§ = 27;
         this.§_-Hk§ = 0;
         this.§_-L3§ = 5;
         this.maxSize = this.cRoot.gameSettings.heroes.heroKing.maxSize;
         this.maxLevel = this.cRoot.gameSettings.heroes.heroKing.maxLevel;
         this.rangeWidth = this.cRoot.gameSettings.heroes.heroKing.range;
         this.rangeHeight = this.cRoot.gameSettings.heroes.heroKing.range * this.cRoot.gameSettings.rangeRatio;
         this.regenerateTime = this.cRoot.gameSettings.heroes.heroKing.regenReload;
         this.attackReloadTime = this.cRoot.gameSettings.heroes.heroKing.reload - this.attackChargeTime;
         this.xpMultiplier = this.cRoot.gameSettings.heroes.heroKing.xpMultiplier;
         this.§_-9h§ = this.cRoot.gameSettings.heroes.heroKing.buffModifier;
         this.§_-LI§ = this.cRoot.gameSettings.heroes.heroKing.catapultModifier;
         this.rangeShootChargeTime = 19;
         this.rangeShootReloadTime = this.cRoot.gameSettings.heroes.heroKing.rangeShootReloadTime * this.cRoot.gameSettings.framesRate;
         this.rangeShootWidth = this.cRoot.gameSettings.heroes.heroKing.rangeShootRangeWidth;
         this.rangeShootHeight = this.rangeShootWidth * this.cRoot.gameSettings.rangeRatio;
         this.rangeShootMinDistance = this.cRoot.gameSettings.heroes.heroKing.rangeShootMinDistance;
         this.catapultReloadTime = this.cRoot.gameSettings.heroes.heroKing.catapultReloadTime * this.cRoot.gameSettings.framesRate;
         this.catapultRangeWidth = this.cRoot.gameSettings.heroes.heroKing.catapultRangeWidth;
         this.catapultRangeHeight = this.catapultRangeWidth * this.cRoot.gameSettings.rangeRatio;
         this.catapultRangeMin = this.cRoot.gameSettings.heroes.heroKing.catapultMinRangeWidth;
         this.buffReloadTime = this.cRoot.gameSettings.heroes.heroKing.buffReloadTime * this.cRoot.gameSettings.framesRate;
         this.buffRangeWidth = this.cRoot.gameSettings.heroes.heroKing.buffRangeWidth;
         this.buffRangeHeight = this.buffRangeWidth * this.cRoot.gameSettings.rangeRatio;
         this.§_-Jc§ = new §_-Ov§(new Point(0,-46),this.health,this.initHealth);
         this.§_-Jc§.updateMaxHealth(this.initHealth,this.health);
         this.§_-Jc§.updateProgress(this.health);
         this.addChild(§_-Jc§);
         this.§_-Gv§ = this.cRoot.gameSettings.heroes.heroKing.portrait;
         this.§_-DH§();
         this.level = 1;
         this.levelUpWithAnimation(false);
         this.buffChargeTime = 54;
         this.catapultChargeTime = 36;
         this.isActive = false;
         this.isDead = true;
         this.deadTimeCounter = this.deadTime - 1;
         this.cRoot.addSoldier(this);
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.sIconName = "denas";
         param1.sName = Locale.loadStringEx("HERO_DENAS_NAME",Locale.getDefaultLang());
         param1.sRespawn = this.cRoot.gameSettings.heroes.heroKing.respawn / this.cRoot.gameSettings.framesRate + "s";
      }
      
      override public function unPause() : void
      {
         switch(this.currentFrameLabel)
         {
            case "runningEnd":
               this.gotoAndPlay("running");
               break;
            case "fighting1End":
               break;
            case "fighting2End":
               break;
            case "fighting3End":
               break;
            case "fighting4End":
               break;
            case "respawningEnd":
               break;
            case "lvlUp":
               break;
            case "catapultEnd":
               break;
            case "buffEnd":
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
         this.health = this.initHealth = this.cRoot.gameSettings.heroes.heroKing.health[this.level - 1];
         this.§_-Rd§ = this.cRoot.gameSettings.heroes.heroKing.regen[this.level - 1];
         this.armor = this.cRoot.gameSettings.heroes.heroKing.armor[this.level - 1];
         this.minDamage = this.cRoot.gameSettings.heroes.heroKing.minDamage[this.level - 1];
         this.maxDamage = this.cRoot.gameSettings.heroes.heroKing.maxDamage[this.level - 1];
         this.§_-Jc§.updateMaxHealth(this.initHealth,this.health);
         this.§_-Jc§.updateProgress(this.health);
         this.portrait.updateHealth();
         this.portrait.updateXp();
         this.upgradeBuff();
         this.upgradeCatapult();
      }
      
      override protected function runSpecial() : Boolean
      {
         this.rangeShootReloadTimeCounter++;
         this.buffReloadTimeCounter++;
         this.catapultReloadTimeCounter++;
         if(super.runSpecial())
         {
            return true;
         }
         if(this.§_-Fv§())
         {
            return true;
         }
         if(this.buffLevel != 0 && this.§ each§())
         {
            return true;
         }
         if(this.catapultLevel != 0 && this.§_-9n§())
         {
            return true;
         }
         return false;
      }
      
      override protected function stopSpecial() : void
      {
         super.stopSpecial();
         this.§_-JL§ = false;
         this.§_-DX§ = false;
         this.isCharging = false;
         this.§_-La§ = false;
      }
      
      override protected function chargeAttack() : void
      {
         this.§_-8H§();
         this.isCharging = true;
      }
      
      protected function §_-8H§() : void
      {
         this.currentWeapon = this.getRandom(1,4);
         switch(this.currentWeapon)
         {
            case 1:
               this.gotoAndPlay("fighting1");
               break;
            case 2:
               this.gotoAndPlay("fighting2");
               break;
            case 3:
               this.gotoAndPlay("fighting3");
               break;
            case 4:
               this.gotoAndPlay("fighting4");
         }
      }
      
      protected function shootStuff(param1:Enemy, param2:Point, param3:int, param4:int) : void
      {
         var _loc5_:Point = null;
         if(this.scaleX == -1)
         {
            _loc5_ = new Point(this.x + 6,this.y - 24);
         }
         else
         {
            _loc5_ = new Point(this.x - 6,this.y - 24);
         }
         switch(this.currentWeapon)
         {
            case 1:
               this.cRoot.bullets.addChild(new §_-LA§(_loc5_,1,param1,param2,param3,param4));
               break;
            case 2:
               this.cRoot.bullets.addChild(new §_-P2§(_loc5_,1,param1,param2,param3,param4));
               break;
            case 3:
               this.cRoot.bullets.addChild(new §_-El§(_loc5_,1,param1,param2,param3,param4));
               break;
            case 4:
               this.cRoot.bullets.addChild(new §_-OT§(_loc5_,1,param1,param2,param3,param4));
         }
      }
      
      protected function §_-Fv§() : Boolean
      {
         var _loc1_:int = 0;
         if(this.§_-JL§ || this.isFighting || this.§_-DX§ || this.isWalking)
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
            this.§_-8H§();
            return true;
         }
         if(this.rangeShootChargeTimeCounter < this.rangeShootChargeTime)
         {
            this.rangeShootChargeTimeCounter++;
            if(this.rangeShootChargeTimeCounter == 8)
            {
               _loc1_ = this.getDamage();
               if(this.rangeShootTarget != null && this.rangeShootTarget.isActive)
               {
                  this.rangeShootPoint = this.rangeShootTarget.road[this.rangeShootTarget.currentNode + 3];
               }
               this.shootStuff(this.rangeShootTarget,this.rangeShootPoint,17,_loc1_);
               this.gainXpByDamage(_loc1_);
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
            this.rangeShootPoint = _loc1_.road[this.rangeShootTarget.currentNode + 3];
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
      
      protected function onRangeShoot(param1:Enemy) : Boolean
      {
         var _loc2_:* = new Ellipse(this.x - this.rangeShootWidth / 2,this.y - this.rangeShootHeight / 2,this.rangeShootWidth,this.rangeShootHeight);
         return _loc2_.containsPoint(new Point(param1.x,param1.y));
      }
      
      override protected function hitEnemy() : void
      {
         var _loc1_:int = 0;
         if(this.enemy == null || !this.enemy.isActive)
         {
            this.§_-Mw§();
            this.setGoToIdleStatus();
            return;
         }
         if(!this.enemy.dodgeAttack())
         {
            _loc1_ = this.getDamage();
            this.shootStuff(this.enemy,new Point(enemy.x,enemy.y),14,_loc1_);
            this.gainXpByDamage(_loc1_);
         }
         else
         {
            this.shootStuff(null,new Point(enemy.x,enemy.y),14,_loc1_);
         }
      }
      
      protected function upgradeBuff() : void
      {
         if(this.level != 2 && this.level != 5 && this.level != 8)
         {
            return;
         }
         if(this.level == 2)
         {
            this.buffLevel = 1;
         }
         if(this.level == 5)
         {
            this.buffLevel = 2;
         }
         if(this.level == 8)
         {
            this.buffLevel = 3;
         }
      }
      
      protected function § each§() : Boolean
      {
         if(this.§_-DX§ || this.isWalking)
         {
            return false;
         }
         if(!this.§_-JL§)
         {
            if(this.buffReloadTimeCounter < this.buffReloadTime)
            {
               return false;
            }
            if(!this.§_-2§())
            {
               return false;
            }
            this.§_-JL§ = true;
            this.buffChargeTimeCounter = 0;
            this.buffReloadTimeCounter = 0;
            this.gotoAndPlay("buff");
            this.cRoot.game.gameSounds.playHeroDenasBuff();
            this.§_-7U§(1,this.buffLevel);
            return true;
         }
         if(this.buffChargeTimeCounter < this.buffChargeTime)
         {
            this.buffChargeTimeCounter++;
            if(this.buffChargeTimeCounter == 13)
            {
               this.§_-7y§();
            }
            return true;
         }
         this.§_-JL§ = false;
         this.buffReloadTimeCounter = 0;
         this.§_-J9§();
         return false;
      }
      
      protected function §_-2§() : Boolean
      {
         var _loc1_:Tower = null;
         for each(_loc1_ in this.cRoot.towers)
         {
            if(!_loc1_.building && !_loc1_.isDisabled && _loc1_.§extends§ && this.onRangeBuff(_loc1_))
            {
               return true;
            }
         }
         return false;
      }
      
      protected function §_-7y§() : void
      {
         var _loc1_:Tower = null;
         for each(_loc1_ in this.cRoot.towers)
         {
            if(!_loc1_.building && !_loc1_.isDisabled && _loc1_.§extends§ && this.onRangeBuff(_loc1_))
            {
               _loc1_.addDebuff(new §_-AA§(this.cRoot,this.level,_loc1_));
            }
         }
      }
      
      protected function onRangeBuff(param1:Tower) : Boolean
      {
         var _loc2_:* = new Ellipse(this.x - this.buffRangeWidth / 2,this.y - this.buffRangeHeight / 2,this.buffRangeWidth,this.buffRangeHeight);
         return _loc2_.containsPoint(new Point(param1.x,param1.y));
      }
      
      protected function upgradeCatapult() : void
      {
         if(this.level != 4 && this.level != 7 && this.level != 10)
         {
            return;
         }
         if(this.level == 4)
         {
            this.catapultLevel = 1;
         }
         if(this.level == 7)
         {
            this.catapultLevel = 2;
         }
         if(this.level == 10)
         {
            this.catapultLevel = 3;
         }
      }
      
      protected function §_-9n§() : Boolean
      {
         if(this.§_-JL§ || this.isWalking)
         {
            return false;
         }
         if(!this.§_-DX§)
         {
            if(this.catapultReloadTimeCounter < this.catapultReloadTime)
            {
               return false;
            }
            if(!this.§_-Ne§())
            {
               return false;
            }
            if(this.catapultPoint.x >= this.x)
            {
               this.scaleX = 1;
               this.§_-Jc§.flip(1);
            }
            else
            {
               this.scaleX = -1;
               this.§_-Jc§.flip(-1);
            }
            this.§_-DX§ = true;
            this.catapultChargeTimeCounter = 0;
            this.catapultReloadTimeCounter = 0;
            this.gotoAndPlay("catapult");
            this.cRoot.game.gameSounds.playHeroDenasAttack();
            this.§_-7U§(2,this.catapultLevel);
            return true;
         }
         if(this.catapultChargeTimeCounter < this.catapultChargeTime)
         {
            this.catapultChargeTimeCounter++;
            if(this.catapultChargeTimeCounter == 7)
            {
               this.§_-8D§();
            }
            return true;
         }
         this.§_-DX§ = false;
         this.catapultReloadTimeCounter = 0;
         this.§_-J9§();
         return false;
      }
      
      protected function §_-Ne§() : Boolean
      {
         var _loc2_:Enemy = null;
         var _loc3_:int = 0;
         var _loc1_:Enemy = null;
         for each(_loc2_ in this.cRoot.enemies)
         {
            if(_loc2_.isActive && !_loc2_.isFlying && this.onRangeCatapult(_loc2_) && this.§_-8k§(_loc2_))
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
            this.catapultPoint = new Point(_loc1_.road[_loc3_].x,_loc1_.road[_loc3_].y);
            return true;
         }
         return false;
      }
      
      protected function §_-8D§() : void
      {
         this.cRoot.decals.addChild(new §_-NB§(this.catapultPoint,this.catapultLevel,this.cRoot));
      }
      
      protected function onRangeCatapult(param1:Enemy) : Boolean
      {
         var _loc2_:* = new Ellipse(this.x - this.catapultRangeWidth / 2,this.y - this.catapultRangeHeight / 2,this.catapultRangeWidth,this.catapultRangeHeight);
         return _loc2_.containsPoint(new Point(param1.x,param1.y));
      }
      
      protected function §_-8k§(param1:Enemy) : Boolean
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:Number = NaN;
         _loc3_ = param1.x - this.x;
         _loc4_ = param1.y - this.y;
         _loc2_ = Math.sqrt(_loc3_ * _loc3_ + _loc4_ * _loc4_);
         if(_loc2_ > this.catapultRangeMin)
         {
            return true;
         }
         return false;
      }
      
      override protected function playTaunt() : void
      {
         this.cRoot.game.gameSounds.playHeroDenasTaunt();
      }
      
      override public function playDeadSound() : void
      {
         this.cRoot.game.gameSounds.playHeroDenasDeath();
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame26() : *
      {
         stop();
      }
      
      function frame46() : *
      {
         stop();
      }
      
      function frame66() : *
      {
         stop();
      }
      
      function frame86() : *
      {
         stop();
      }
      
      function frame141() : *
      {
         stop();
      }
      
      function frame178() : *
      {
         stop();
      }
      
      function frame192() : *
      {
         stop();
      }
      
      function frame219() : *
      {
         stop();
      }
      
      function frame240() : *
      {
         stop();
      }
   }
}
