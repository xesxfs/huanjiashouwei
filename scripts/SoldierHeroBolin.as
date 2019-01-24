package
{
   import fl.lang.Locale;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.casalib.math.geom.Ellipse;
   
   public class SoldierHeroBolin extends §_-2A§
   {
       
      
      protected var §_-OB§:int;
      
      protected var §throw§:int;
      
      protected var animationCurrentShoot:String;
      
      protected var shootEnemies:Array;
      
      protected var rangeShootTargetOriginal:Enemy;
      
      protected var rangeShootTarget:Enemy;
      
      protected var rangeShootPointOriginal:Point;
      
      protected var rangeShootPoint:Point;
      
      protected var §_-J6§:Boolean;
      
      protected var rangeShootReloadTime:int;
      
      protected var rangeShootReloadTimeCounter:int;
      
      protected var rangeShootChargeTime:int;
      
      protected var rangeShootChargeTimeCounter:int;
      
      protected var rangeShootWidth:int;
      
      protected var rangeShootHeight:int;
      
      protected var rangeShootNearWidth:int;
      
      protected var rangeShootNearHeight:int;
      
      protected var rangeShootMinDamage:int;
      
      protected var rangeShootMaxDamage:int;
      
      protected var rangeShootMaxShoots:int;
      
      protected var rangeShootCurrentShoot:int;
      
      protected var rangeShootMinDistance:int;
      
      protected var tarBombLevel:int;
      
      protected var §_-KE§:Boolean;
      
      protected var §_-85§:int;
      
      protected var §_-1p§:int;
      
      protected var §_-NR§:int;
      
      protected var §_-G-§:int;
      
      protected var §_-45§:int;
      
      protected var §_-IO§:int;
      
      protected var §_-N5§:int;
      
      protected var §_-Bh§:Point;
      
      protected var mineLevel:int;
      
      protected var §_-8c§:Boolean;
      
      protected var mineRangeWidth:int;
      
      protected var mineRangeHeight:int;
      
      protected var mineReloadTime:int;
      
      protected var mineReloadTimeCounter:int;
      
      protected var mineChargeTime:int;
      
      protected var mineChargeTimeCounter:int;
      
      protected var mineMax:int;
      
      protected var mineCurrent:int;
      
      protected var minePoint:Point;
      
      protected var reloadChargeTime;
      
      protected var reloadChargeTimeCounter;
      
      protected var isReloading:Boolean;
      
      public function SoldierHeroBolin(param1:Point, param2:Point, param3:Tower, param4:Point)
      {
         this.shootEnemies = [];
         addFrameScript(0,this.frame1,14,this.frame15,30,this.frame31,37,this.frame38,53,this.frame54,62,this.frame63,78,this.frame79,99,this.frame100,123,this.frame124,141,this.frame142,167,this.frame168,184,this.frame185,201,this.frame202,210,this.frame211);
         super(param1,param2,param3,param4,0);
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      override protected function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.lifes = 1;
         this.speed = 1.5;
         this.xAdjust = 5;
         this.attackChargeTime = 17;
         this.attackChargeDamageTime = 5;
         this.respawnTime = 18;
         this.deadTime = this.cRoot.gameSettings.heroes.heroDwarf.respawn;
         this.idleTime = 30;
         this.§_-EZ§ = 18;
         this.§_-Hk§ = 0;
         this.§_-L3§ = 5;
         this.rangeShootCurrentShoot = 0;
         this.reloadChargeTime = 23;
         this.§_-L3§ = 5;
         this.maxSize = this.cRoot.gameSettings.heroes.heroDwarf.maxSize;
         this.maxLevel = this.cRoot.gameSettings.heroes.heroDwarf.maxLevel;
         this.rangeWidth = this.cRoot.gameSettings.heroes.heroDwarf.range;
         this.rangeHeight = this.cRoot.gameSettings.heroes.heroDwarf.range * this.cRoot.gameSettings.rangeRatio;
         this.regenerateTime = this.cRoot.gameSettings.heroes.heroDwarf.regenReload;
         this.attackReloadTime = this.cRoot.gameSettings.heroes.heroDwarf.reload - this.attackChargeTime;
         this.xpMultiplier = this.cRoot.gameSettings.heroes.heroDwarf.xpMultiplier;
         this.§_-9h§ = this.cRoot.gameSettings.heroes.heroDwarf.mineModifier;
         this.§_-LI§ = this.cRoot.gameSettings.heroes.heroDwarf.tarModifier;
         this.rangeShootChargeTime = 28;
         this.rangeShootReloadTime = this.cRoot.gameSettings.heroes.heroDwarf.rangeShootReloadTime * this.cRoot.gameSettings.framesRate;
         this.rangeShootWidth = this.cRoot.gameSettings.heroes.heroDwarf.rangeShootRangeWidth;
         this.rangeShootHeight = this.rangeShootWidth * this.cRoot.gameSettings.rangeRatio;
         this.rangeShootMinDistance = this.cRoot.gameSettings.heroes.heroDwarf.rangeShootMinDistance;
         this.rangeShootNearWidth = 60;
         this.rangeShootNearHeight = this.rangeShootNearWidth * this.cRoot.gameSettings.rangeRatio;
         this.§_-Jc§ = new §_-Ov§(new Point(0,-29),this.health,this.initHealth);
         this.§_-Jc§.updateMaxHealth(this.initHealth,this.health);
         this.§_-Jc§.updateProgress(this.health);
         this.addChild(§_-Jc§);
         this.§_-Gv§ = this.cRoot.gameSettings.heroes.heroDwarf.portrait;
         this.§_-DH§();
         this.level = 1;
         this.levelUpWithAnimation(false);
         this.§_-NR§ = 27;
         this.mineChargeTime = 19;
         this.isActive = false;
         this.isDead = true;
         this.deadTimeCounter = this.deadTime - 1;
         this.cRoot.addSoldier(this);
         this.§_-E3§();
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.sIconName = "bolin";
         param1.sName = Locale.loadStringEx("HERO_RIFLEMAN_NAME",Locale.getDefaultLang());
         param1.sRespawn = this.cRoot.gameSettings.heroes.heroDwarf.respawn / this.cRoot.gameSettings.framesRate + "s";
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
            case "aimLateralEnd":
               break;
            case "shootLateralEnd":
               break;
            case "aimUpEnd":
               break;
            case "shootUpEnd":
               break;
            case "aimDownEnd":
               break;
            case "shootDownEnd":
               break;
            case "reloadEnd":
               break;
            case "respawningEnd":
               break;
            case "lvlUp":
               break;
            case "tarbombEnd":
               break;
            case "mineEnd":
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
         this.health = this.initHealth = this.cRoot.gameSettings.heroes.heroDwarf.health[this.level - 1];
         this.§_-Rd§ = this.cRoot.gameSettings.heroes.heroDwarf.regen[this.level - 1];
         this.armor = this.cRoot.gameSettings.heroes.heroDwarf.armor[this.level - 1];
         this.minDamage = this.cRoot.gameSettings.heroes.heroDwarf.minDamage[this.level - 1];
         this.maxDamage = this.cRoot.gameSettings.heroes.heroDwarf.maxDamage[this.level - 1];
         this.rangeShootMinDamage = this.cRoot.gameSettings.heroes.heroDwarf.minRangeDamage[this.level - 1];
         this.rangeShootMaxDamage = this.cRoot.gameSettings.heroes.heroDwarf.maxRangeDamage[this.level - 1];
         if(this.level == 1)
         {
            this.rangeShootMaxShoots = 2;
         }
         else if(this.level == 5)
         {
            this.rangeShootMaxShoots = 3;
         }
         else if(this.level == 10)
         {
            this.rangeShootMaxShoots = 4;
         }
         this.§_-Jc§.updateMaxHealth(this.initHealth,this.health);
         this.§_-Jc§.updateProgress(this.health);
         this.portrait.updateHealth();
         this.portrait.updateXp();
         this.upgradeMine();
         this.upgradeTar();
      }
      
      override protected function runSpecial() : Boolean
      {
         this.rangeShootReloadTimeCounter++;
         this.§_-1p§++;
         this.mineReloadTimeCounter++;
         if(super.runSpecial())
         {
            return true;
         }
         if(this.§_-Fv§())
         {
            return true;
         }
         if(this.tarBombLevel != 0 && this.§_-Po§())
         {
            return true;
         }
         if(this.mineLevel != 0 && this.§_-Ny§())
         {
            return true;
         }
         return false;
      }
      
      override protected function stopSpecial() : void
      {
         super.stopSpecial();
         this.§_-KE§ = false;
         this.§_-8c§ = false;
         this.§_-J6§ = false;
         this.isCharging = false;
         this.§_-La§ = false;
         this.isReloading = false;
         this.rangeShootCurrentShoot = 0;
      }
      
      protected function §_-Fv§() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:Bullet = null;
         if(this.§_-KE§ || this.isFighting || this.§_-8c§ || this.isWalking)
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
            this.rangeShootCurrentShoot = 0;
            this.rangeShootReloadTimeCounter = 0;
            this.shootEnemies = [];
            this.§_-L4§(new Point(this.x,this.y),this.rangeShootPoint);
            return true;
         }
         if(this.rangeShootChargeTimeCounter < this.rangeShootChargeTime && this.rangeShootCurrentShoot <= 3)
         {
            this.rangeShootChargeTimeCounter++;
            if(this.rangeShootChargeTimeCounter == this.rangeShootMaxShoots && this.rangeShootCurrentShoot > 0)
            {
               _loc1_ = this.getDamageRangeShoot();
               _loc2_ = new Bullet(this.rangeShootTarget,this.rangeShootPoint,false,0,false,0,false,_loc1_);
               _loc2_.x = this.x;
               _loc2_.y = this.y - 16;
               this.cRoot.bullets.addChild(_loc2_);
               this.gainXpByDamage(_loc1_);
            }
            if(this.rangeShootChargeTimeCounter == 10 && this.rangeShootCurrentShoot == 0 || this.rangeShootChargeTimeCounter == 14 && this.rangeShootCurrentShoot > 0)
            {
               this.shootEnemies.push(this.rangeShootTarget);
               if(!this.findRangeShootTarget())
               {
                  this.shootEnemies = [];
                  if(!this.findRangeShootTarget())
                  {
                     this.§_-J6§ = false;
                     this.rangeShootReloadTimeCounter = 0;
                     this.rangeShootCurrentShoot = 0;
                     this.§_-J9§();
                     this.gotoAndPlay("reload");
                     return false;
                  }
               }
               this.rangeShootCurrentShoot++;
               this.rangeShootChargeTimeCounter = 0;
               this.gotoAndPlay(this.animationCurrentShoot);
               this.shootEnemies = [];
            }
            return true;
         }
         this.§_-J6§ = false;
         this.rangeShootReloadTimeCounter = 0;
         this.rangeShootCurrentShoot = 0;
         this.§_-J9§();
         this.gotoAndPlay("reload");
         return false;
      }
      
      protected function §_-L4§(param1:Point, param2:Point) : void
      {
         var _loc3_:Number = param2.y - param1.y;
         var _loc4_:Number = param2.x - param1.x;
         var _loc5_:Number = Math.round(Math.atan2(-_loc3_,_loc4_) * 180 / Math.PI);
         if(_loc5_ < 0)
         {
            _loc5_ = _loc5_ + 360;
         }
         if(_loc5_ > 45 && _loc5_ < 135)
         {
            this.gotoAndPlay("aimUp");
            this.animationCurrentShoot = "shootUp";
         }
         else if(_loc5_ >= 135 && _loc5_ <= 240)
         {
            this.gotoAndPlay("aimLateral");
            this.animationCurrentShoot = "shootLateral";
         }
         else if(_loc5_ > 240 && _loc5_ < 315)
         {
            this.gotoAndPlay("aimDown");
            this.animationCurrentShoot = "shootDown";
         }
         else
         {
            this.gotoAndPlay("aimLateral");
            this.animationCurrentShoot = "shootLateral";
         }
      }
      
      protected function findRangeShootTarget() : Boolean
      {
         var _loc2_:Enemy = null;
         var _loc1_:Enemy = null;
         this.rangeShootTarget = null;
         for each(_loc2_ in this.cRoot.enemies)
         {
            if(_loc2_.isActive && this.onRangeShoot(_loc2_) && this.§_-2v§(_loc2_) && this.canTarget(_loc2_))
            {
               _loc1_ = _loc2_;
               break;
            }
         }
         if(_loc1_ != null)
         {
            this.rangeShootTarget = _loc1_;
            this.rangeShootPoint = new Point(_loc1_.x + _loc1_.xAdjust,_loc1_.y + _loc1_.yAdjust);
            if(this.rangeShootCurrentShoot == 0)
            {
               this.rangeShootPointOriginal = this.rangeShootPoint;
               this.rangeShootTargetOriginal = this.rangeShootTarget;
            }
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
         var _loc2_:* = undefined;
         if(this.rangeShootCurrentShoot == 0)
         {
            _loc2_ = new Ellipse(this.x - this.rangeShootWidth / 2,this.y - this.rangeShootHeight / 2,this.rangeShootWidth,this.rangeShootHeight);
            return _loc2_.containsPoint(new Point(param1.x,param1.y));
         }
         _loc2_ = new Ellipse(this.rangeShootPointOriginal.x - this.rangeShootNearWidth / 2,this.rangeShootPointOriginal.y - this.rangeShootNearHeight / 2,this.rangeShootNearWidth,this.rangeShootNearHeight);
         return _loc2_.containsPoint(new Point(param1.x,param1.y));
      }
      
      protected function canTarget(param1:Enemy) : Boolean
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.shootEnemies.length)
         {
            if(this.shootEnemies[_loc2_] == param1)
            {
               return false;
            }
            _loc2_++;
         }
         return true;
      }
      
      protected function evalReload() : Boolean
      {
         if(this.reloadChargeTimeCounter < this.reloadChargeTime)
         {
            this.reloadChargeTimeCounter++;
            return true;
         }
         this.isReloading = false;
         this.reloadChargeTimeCounter = 0;
         this.§_-J9§();
         return false;
      }
      
      protected function doReload() : void
      {
         this.isReloading = true;
         this.reloadChargeTimeCounter = 0;
         this.gotoAndPlay("reload");
         if(this.rangeShootCurrentShoot >= this.rangeShootMaxShoots)
         {
            this.rangeShootReloadTime = this.cRoot.gameSettings.heroes.heroDwarf.rangeShootReloadTime * this.cRoot.gameSettings.framesRate;
         }
         else
         {
            this.rangeShootReloadTime = (this.cRoot.gameSettings.heroes.heroDwarf.rangeShootReloadTime - (3 - this.rangeShootCurrentShoot)) * this.cRoot.gameSettings.framesRate;
         }
      }
      
      protected function upgradeMine() : void
      {
         if(this.level != 2 && this.level != 5 && this.level != 8)
         {
            return;
         }
         if(this.level == 2)
         {
            this.mineLevel = 1;
         }
         if(this.level == 5)
         {
            this.mineLevel = 2;
         }
         if(this.level == 8)
         {
            this.mineLevel = 3;
         }
         this.mineRangeWidth = this.cRoot.gameSettings.heroes.heroDwarf.mineRangeWidth;
         this.mineRangeHeight = this.mineRangeWidth * this.cRoot.gameSettings.rangeRatio;
         this.mineReloadTime = this.cRoot.gameSettings.heroes.heroDwarf.mineReloadTime * this.cRoot.gameSettings.framesRate;
         this.mineMax = this.cRoot.gameSettings.heroes.heroDwarf.mineMax + this.cRoot.gameSettings.heroes.heroDwarf.mineMaxIncrement * this.mineLevel;
      }
      
      protected function §_-Ny§() : Boolean
      {
         if(this.§_-KE§ || this.isFighting || this.isWalking || this.§_-J6§)
         {
            return false;
         }
         if(!this.§_-8c§)
         {
            if(this.mineReloadTimeCounter < this.mineReloadTime)
            {
               return false;
            }
            if(!this.§_-Np§())
            {
               return false;
            }
            if(this.minePoint.x >= this.x)
            {
               this.scaleX = 1;
               this.§_-Jc§.flip(1);
            }
            else
            {
               this.scaleX = -1;
               this.§_-Jc§.flip(-1);
            }
            this.§_-8c§ = true;
            this.mineChargeTimeCounter = 0;
            this.mineReloadTimeCounter = 0;
            this.gotoAndPlay("mine");
            this.§_-7U§(1,this.mineLevel);
            return true;
         }
         if(this.mineChargeTimeCounter < this.mineChargeTime)
         {
            this.mineChargeTimeCounter++;
            if(this.mineChargeTimeCounter == 7)
            {
               this.§_-0F§();
            }
            return true;
         }
         this.§_-8c§ = false;
         this.mineReloadTimeCounter = 0;
         this.§_-J9§();
         return false;
      }
      
      protected function §_-Np§() : Boolean
      {
         var _loc1_:int = this.getRandom(0,2);
         var _loc2_:int = this.getRandom(-12,12);
         if(this.§throw§ + _loc2_ >= this.cRoot.paths[this.§_-OB§][0].length)
         {
            _loc2_ = 0;
         }
         if(this.§throw§ + _loc2_ < 0)
         {
            _loc2_ = 0;
         }
         this.minePoint = this.cRoot.paths[this.§_-OB§][_loc1_][this.§throw§ + _loc2_];
         return true;
      }
      
      protected function §_-E3§() : void
      {
         var _loc4_:int = 0;
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
      }
      
      protected function §_-0F§() : void
      {
         this.cRoot.bullets.addChild(new §_-2h§(new Point(this.x,this.y - 16),this.mineLevel,this.minePoint));
      }
      
      protected function upgradeTar() : void
      {
         if(this.level != 4 && this.level != 7 && this.level != 10)
         {
            return;
         }
         if(this.level == 4)
         {
            this.tarBombLevel = 1;
         }
         if(this.level == 7)
         {
            this.tarBombLevel = 2;
         }
         if(this.level == 10)
         {
            this.tarBombLevel = 3;
         }
         this.§_-45§ = this.cRoot.gameSettings.heroes.heroDwarf.tarRangeWidth;
         this.§_-IO§ = this.§_-45§ * this.cRoot.gameSettings.rangeRatio;
         this.§_-85§ = this.cRoot.gameSettings.heroes.heroDwarf.tarReloadTime * this.cRoot.gameSettings.framesRate;
         this.§_-N5§ = this.cRoot.gameSettings.heroes.heroDwarf.tarMinDistance;
      }
      
      protected function §_-Po§() : Boolean
      {
         if(this.§_-8c§ || this.isFighting || this.isWalking || this.§_-J6§)
         {
            return false;
         }
         if(!this.§_-KE§)
         {
            if(this.§_-1p§ < this.§_-85§)
            {
               return false;
            }
            if(!this.§_-NC§())
            {
               return false;
            }
            if(this.§_-Bh§.x >= this.x)
            {
               this.scaleX = 1;
               this.§_-Jc§.flip(1);
            }
            else
            {
               this.scaleX = -1;
               this.§_-Jc§.flip(-1);
            }
            this.§_-KE§ = true;
            this.§_-G-§ = 0;
            this.§_-1p§ = 0;
            this.gotoAndPlay("tarbomb");
            this.§_-7U§(2,this.tarBombLevel);
            return true;
         }
         if(this.§_-G-§ < this.§_-NR§)
         {
            this.§_-G-§++;
            if(this.§_-G-§ == 13)
            {
               this.§_-Fa§();
            }
            return true;
         }
         this.§_-KE§ = false;
         this.§_-1p§ = 0;
         this.§_-J9§();
         return false;
      }
      
      protected function §_-NC§() : Boolean
      {
         var _loc2_:Enemy = null;
         var _loc3_:int = 0;
         var _loc1_:Enemy = null;
         for each(_loc2_ in this.cRoot.enemies)
         {
            if(_loc2_.isActive && !_loc2_.isFlying && this.onRangeTar(_loc2_) && this.§_-8C§(_loc2_))
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
            this.§_-Bh§ = new Point(_loc1_.road[_loc3_].x,_loc1_.road[_loc3_].y);
            return true;
         }
         return false;
      }
      
      protected function §_-Fa§() : void
      {
         this.cRoot.bullets.addChild(new §_-H3§(new Point(this.x,this.y - 16),this.tarBombLevel,this.§_-Bh§));
      }
      
      protected function onRangeTar(param1:Enemy) : Boolean
      {
         var _loc2_:* = new Ellipse(this.x - this.§_-45§ / 2,this.y - this.§_-IO§ / 2,this.§_-45§,this.§_-IO§);
         return _loc2_.containsPoint(new Point(param1.x,param1.y));
      }
      
      protected function §_-8C§(param1:Enemy) : Boolean
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:Number = NaN;
         _loc3_ = param1.x - this.x;
         _loc4_ = param1.y - this.y;
         _loc2_ = Math.sqrt(_loc3_ * _loc3_ + _loc4_ * _loc4_);
         if(_loc2_ > this.§_-N5§)
         {
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
         this.isActive = false;
         this.§_-Mw§();
         this.setGoToIdleStatus();
         this.stopSpecial();
         this.getMyPath();
         this.§_-E3§();
         this.playTaunt();
      }
      
      override protected function playTaunt() : void
      {
         this.cRoot.game.gameSounds.playHeroBolinTaunt();
      }
      
      override public function playDeadSound() : void
      {
         this.cRoot.game.gameSounds.playHeroBolinDeath();
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame15() : *
      {
         stop();
      }
      
      function frame31() : *
      {
         stop();
      }
      
      function frame38() : *
      {
         stop();
      }
      
      function frame54() : *
      {
         stop();
      }
      
      function frame63() : *
      {
         stop();
      }
      
      function frame79() : *
      {
         stop();
      }
      
      function frame100() : *
      {
         stop();
      }
      
      function frame124() : *
      {
         stop();
      }
      
      function frame142() : *
      {
         stop();
      }
      
      function frame168() : *
      {
         stop();
      }
      
      function frame185() : *
      {
         stop();
      }
      
      function frame202() : *
      {
         stop();
      }
      
      function frame211() : *
      {
         stop();
      }
   }
}
