package
{
   import com.mosesSupposes.bitmap.InteractivePNG;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.ColorMatrixFilter;
   import flash.filters.GlowFilter;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   import org.casalib.math.geom.Ellipse;
   
   public class Soldier extends InteractivePNG
   {
       
      
      public var isActive:Boolean = false;
      
      public var isDead:Boolean = false;
      
      public var isRespawning:Boolean = true;
      
      public var doorQueed:Boolean;
      
      public var isCharging:Boolean = false;
      
      public var isWalking:Boolean = false;
      
      public var isFighting:Boolean = false;
      
      public var §_-Na§:Boolean = false;
      
      public var §_-R0§:Boolean = true;
      
      public var §_-2x§:Boolean = true;
      
      public var canBeCourage:Boolean = true;
      
      protected var §_-E9§:Boolean = false;
      
      protected var lifeTime:int;
      
      protected var §_-PB§:int;
      
      protected var isBlocking:Boolean = false;
      
      protected var isIdle:Boolean = false;
      
      protected var §_-EA§:int = 60;
      
      protected var targetedTimeCounter:int = 0;
      
      protected var tower:Tower;
      
      protected var enemy:Enemy;
      
      protected var fightingPosition:int;
      
      protected var §_-Jc§:LifeBar;
      
      public var nameIndex:int;
      
      protected var §_-Qm§:int = 40;
      
      protected var rallyPoint:Point;
      
      protected var destinationPoint:Point;
      
      protected var xAdjust:int;
      
      protected var §_-Jy§:Number;
      
      protected var §_-IR§:Number;
      
      protected var speed:Number;
      
      protected var health:int;
      
      protected var initHealth:int;
      
      protected var §_-Rd§:int;
      
      public var armor:int;
      
      protected var maxLevel:int;
      
      protected var maxSize:int;
      
      protected var rangeWidth:int;
      
      protected var rangeHeight:int;
      
      public var minDamage:int;
      
      public var maxDamage:int;
      
      protected var attackChargeTime:int;
      
      protected var attackChargeTimeCounter:int = 0;
      
      protected var attackChargeDamageTime:int;
      
      protected var attackReloadTime:int;
      
      protected var attackReloadTimeCounter:int = 0;
      
      protected var idleTime:int;
      
      protected var idleTimeCounter:int = 0;
      
      protected var respawnTime:int;
      
      protected var respawnTimeCounter:int = 0;
      
      protected var deadTime:int;
      
      protected var deadTimeCounter:int = 0;
      
      protected var regenerateTime:int;
      
      protected var §_-AD§:int;
      
      protected var dodgeDamage:int;
      
      public var §_-GF§:Dictionary;
      
      public var §_-HW§:Point;
      
      protected var cRoot:Level;
      
      public function Soldier(param1:Point, param2:Point, param3:Tower, param4:int = 0)
      {
         this.destinationPoint = new Point();
         this.§_-GF§ = new Dictionary(true);
         super();
         this.x = param1.x;
         this.y = param1.y;
         this.tower = param3;
         this.rallyPoint = param2;
         this.alphaTolerance = 0;
         this.§_-HW§ = new Point(0,8);
         if(param4 != 0)
         {
            this.§_-Qm§ = param4;
         }
         this.getRandomName();
         this.addEventListener(MouseEvent.ROLL_OVER,this.rollOver,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,this.rollOut,false,0,true);
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      public function selectMe() : void
      {
         this.addGlow();
      }
      
      public function include() : void
      {
         this.§_-9H§();
      }
      
      public function §_-K0§(param1:Point) : void
      {
         this.rallyPoint = param1;
         if(this.isFighting)
         {
            return;
         }
         this.isActive = false;
         this.§_-Mw§();
         this.setGoToIdleStatus();
      }
      
      public function changeRallyPoint(param1:Point) : void
      {
         this.rallyPoint = param1;
         if(this.isDead || this.isRespawning)
         {
            return;
         }
         this.isActive = false;
         this.§_-Mw§();
         this.setGoToIdleStatus();
         this.stopSpecial();
      }
      
      public function §_-B9§(param1:Class, param2:Dictionary, param3:Boolean = false, param4:Boolean = false) : void
      {
         var _loc5_:* = !!this.isDead?true:false;
         var _loc6_:* = new param1(new Point(this.x,this.y),this.rallyPoint,this.tower,_loc5_);
         if(param4)
         {
            _loc6_.nameIndex = this.nameIndex;
         }
         if(this.isDead)
         {
            param2[_loc6_] = _loc6_;
            if(!param3)
            {
               this.cRoot.entities.addChild(_loc6_);
            }
            return;
         }
         _loc6_.isActive = this.isActive;
         _loc6_.isDead = this.isDead;
         _loc6_.isCharging = false;
         _loc6_.isRespawning = this.isRespawning;
         _loc6_.isWalking = this.isWalking;
         _loc6_.isBlocking = this.isBlocking;
         _loc6_.isFighting = this.isFighting;
         _loc6_.isIdle = this.isIdle;
         _loc6_.doorQueed = this.doorQueed;
         _loc6_.targetedTimeCounter = this.targetedTimeCounter;
         _loc6_.destinationPoint = new Point(this.destinationPoint.x,this.destinationPoint.y);
         if(this.enemy != null)
         {
            this.enemy.soldier = _loc6_;
            _loc6_.enemy = this.enemy;
         }
         if(this.isWalking)
         {
            _loc6_.animationRun();
         }
         param2[_loc6_] = _loc6_;
         this.cRoot.entities.addChild(_loc6_);
      }
      
      public function getInfo() : Object
      {
         var _loc1_:Object = {};
         _loc1_.sHealth = this.health;
         _loc1_.sInitHealth = this.initHealth;
         _loc1_.sArmor = this.armor;
         _loc1_.sDamageMin = this.minDamage;
         _loc1_.sDamageMax = this.maxDamage;
         this.getOtherInfo(_loc1_);
         return _loc1_;
      }
      
      public function getOtherInfo(param1:Object) : void
      {
      }
      
      public function updateTower(param1:Tower) : void
      {
         this.tower = param1;
      }
      
      public function eat() : void
      {
         this.visible = false;
         this.health = 0;
         this.isActive = false;
         this.isDead = true;
         this.§_-Jc§.hide();
         if(this.isBlocking)
         {
            this.§_-Mw§();
         }
         this.cRoot.game.gameAchievement.§_-TI§(this.cRoot);
      }
      
      public function tsung(param1:Point) : void
      {
         this.cRoot.bullets.addChild(new Soul(new Point(this.x,this.y - 10),param1));
         this.cRoot.entities.addChild(new §_-b§(new Point(this.x,this.y),this.cRoot));
         this.visible = false;
         this.health = 0;
         this.isActive = false;
         this.isDead = true;
         this.§_-Jc§.hide();
         if(this.isBlocking)
         {
            this.§_-Mw§();
         }
         this.cRoot.game.gameAchievement.§_-TI§(this.cRoot);
      }
      
      public function burn(param1:int) : void
      {
         var _loc2_:int = this.health - (param1 - this.armor * param1 / 100);
         if(_loc2_ <= 0)
         {
            this.cRoot.entities.addChild(new §_-b§(new Point(this.x,this.y),this.cRoot));
            this.visible = false;
            this.health = 0;
            this.isActive = false;
            this.isDead = true;
            this.§_-Jc§.hide();
            if(this.isBlocking)
            {
               this.§_-Mw§();
            }
            this.cRoot.game.gameAchievement.§_-TI§(this.cRoot);
         }
         else
         {
            this.setDamage(param1,false);
         }
      }
      
      public function setDamage(param1:int, param2:Boolean = false) : *
      {
         this.targetedTimeCounter = 0;
         if(!param2)
         {
            this.health = this.health - (param1 - this.armor * param1 / 100);
         }
         else
         {
            this.health = this.health - param1;
         }
         if(this.health <= 0)
         {
            this.health = 0;
            this.isActive = false;
            this.isDead = true;
            this.isCharging = false;
            this.attackChargeTimeCounter = 0;
            this.updateLifebarProgress();
            this.§_-Jc§.hide();
            this.gotoAndPlay("dead");
            if(this.isBlocking)
            {
               this.§_-Mw§();
            }
            this.playDeadSound();
            this.cRoot.game.gameAchievement.§_-TI§(this.cRoot);
            this.stopOnDead();
            this.toSwamp();
            this.§_-BN§(true);
            return;
         }
         if(this.cRoot.game.gameUpgrades.barracksUpBarbedArmor == true && (this.cRoot.maxUpgradeLevel == 0 || this.cRoot.maxUpgradeLevel == 5))
         {
            if(this.enemy != null && this.enemy.isActive)
            {
               this.enemy.setDamage(Math.ceil(param1 * 0.1),this.cRoot.gameSettings.I_ARMOR);
               if(!this.enemy.isActive)
               {
                  this.§_-Mw§();
               }
            }
         }
         this.updateLifebarProgress();
         this.afterDamage();
      }
      
      public function afterDamage() : void
      {
      }
      
      public function updateLifebarProgress() : void
      {
         this.§_-Jc§.updateProgress(this.health);
      }
      
      public function stopOnDead() : void
      {
      }
      
      public function playDeadSound() : void
      {
      }
      
      public function §_-LD§() : Boolean
      {
         if(!this.isActive)
         {
            return false;
         }
         if(this.health * 100 / this.initHealth <= 70)
         {
            return true;
         }
         return false;
      }
      
      public function heal(param1:int) : void
      {
         this.health = this.health + param1;
         if(this.health > this.initHealth)
         {
            this.health = this.initHealth;
         }
         this.updateLifebarProgress();
      }
      
      public function onFrameUpdate() : void
      {
         this.§ if§();
         if(this.isDead && !this.readyToRespawn())
         {
            return;
         }
         if(this.isRespawning && !this.readyToLive())
         {
            return;
         }
         if(this.§_-E9§ && this.readyToHide())
         {
            return;
         }
         if(this.runSpecial())
         {
            return;
         }
         if(this.isActive && !this.isFighting && !this.isBlocking && this.attackChargeTimeCounter != 0 && this.§_-QU§())
         {
            return;
         }
         if(this.isWalking && !this.walk())
         {
            return;
         }
         if(this.isActive)
         {
            if(this.isIdle)
            {
               if(!this.findEnemy())
               {
                  this.playIdle();
               }
            }
            else if(this.isFighting)
            {
               if(this.enemy == null || !this.enemy.isActive)
               {
                  this.§_-Mw§();
               }
               if(this.isFighting && !this.isBlocking && !this.enemy.isBlocked)
               {
                  this.§_-Mw§();
               }
               if(!this.isBlocking && this.findEnemy())
               {
                  return;
               }
               if(this.isCharging)
               {
                  this.fight();
               }
               else
               {
                  this.readyToAttack();
               }
            }
            else
            {
               this.setGoToIdleStatus();
            }
         }
      }
      
      public function rollOver(param1:MouseEvent) : void
      {
         this.buttonMode = true;
         this.mouseChildren = false;
         this.useHandCursor = true;
      }
      
      public function rollOut(param1:MouseEvent) : void
      {
         this.useHandCursor = false;
      }
      
      public function §_-QU§() : Boolean
      {
         if(this.attackChargeTimeCounter < this.attackChargeTime)
         {
            this.attackChargeTimeCounter++;
            return true;
         }
         this.attackChargeTimeCounter = 0;
         this.setGoToIdleStatus();
         return false;
      }
      
      public function pause() : void
      {
         this.stop();
         this.§_-f§();
      }
      
      public function unPause() : void
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
            case "idle":
               break;
            default:
               this.play();
         }
         this.§_-MJ§();
      }
      
      protected function init(param1:Event) : void
      {
      }
      
      protected function clickEvents(param1:MouseEvent) : void
      {
         this.cRoot.freeMenues();
         if(this.isActive)
         {
            this.cRoot.soldierSelection.setSoldier(this);
            this.cRoot.menu.showSoldierInfo(this);
         }
      }
      
      protected function respawnCustom() : void
      {
      }
      
      protected function runSpecial() : Boolean
      {
         return false;
      }
      
      protected function stopSpecial() : void
      {
      }
      
      protected function respawn() : *
      {
         this.isActive = true;
         this.isDead = false;
         this.isRespawning = false;
         this.isWalking = true;
         this.isCharging = false;
         this.isBlocking = false;
         this.isFighting = false;
         this.isIdle = false;
         this.x = this.tower.x;
         this.y = this.tower.y - 1;
         this.destinationPoint.x = this.rallyPoint.x;
         this.destinationPoint.y = this.rallyPoint.y;
         this.health = this.initHealth;
         this.§_-Jc§.show();
         this.updateLifebarProgress();
         this.deadTimeCounter = 0;
         this.respawnTimeCounter = 0;
         this.respawnCustom();
         this.animationRun();
         this.cRoot.game.gameAchievement.trainSoldier(this.cRoot);
      }
      
      protected function walk() : Boolean
      {
         if(this.isActive)
         {
            if(this.isFighting)
            {
               if(this.enemy == null || !this.enemy.isActive || !this.enemy.isBlocked)
               {
                  this.§_-Mw§();
                  if(!this.findEnemy())
                  {
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
         var _loc1_:Number = Math.atan2(this.destinationPoint.y - this.y,this.destinationPoint.x - this.x);
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
         this.x = this.x + Math.cos(_loc1_) * this.speed;
         this.y = this.y + Math.sin(_loc1_) * this.speed;
         this.evalRunningEnd();
         return false;
      }
      
      protected function evalRunningEnd() : void
      {
         if(this.currentFrameLabel == "runningEnd")
         {
            this.gotoAndPlay("running");
         }
      }
      
      protected function destinationReach() : Boolean
      {
         if(Math.sqrt(Math.pow(this.destinationPoint.y - this.y,2) + Math.pow(this.destinationPoint.x - this.x,2)) <= this.speed)
         {
            this.isWalking = false;
            this.isActive = true;
            this.x = Math.round(this.destinationPoint.x);
            this.y = Math.round(this.destinationPoint.y);
            if(this.isFighting)
            {
               this.§_-8v§();
               if(this.isBlocking)
               {
                  if(this.enemy != null && this.enemy.isActive)
                  {
                     EnemyCommon(this.enemy).startFighting();
                  }
               }
            }
            else
            {
               this.isIdle = true;
            }
            this.animationIdle();
            return true;
         }
         return false;
      }
      
      protected function §_-Mw§() : void
      {
         this.isBlocking = false;
         this.isFighting = false;
         this.isCharging = false;
         this.attackChargeTimeCounter = 0;
         if(this.enemy != null)
         {
            this.enemy.§_-QS§(this.fightingPosition);
         }
         this.enemy = null;
      }
      
      protected function chargeAttack() : void
      {
         this.gotoAndPlay("fighting");
         this.isCharging = true;
      }
      
      protected function fight() : void
      {
         this.attackChargeTimeCounter++;
         if(this.attackChargeTimeCounter < this.attackChargeTime)
         {
            if(this.attackChargeTimeCounter == this.attackChargeDamageTime)
            {
               this.hitEnemy();
            }
            return;
         }
         this.attackChargeTimeCounter = 0;
         this.isCharging = false;
      }
      
      protected function hitEnemy() : void
      {
         if(this.enemy == null || !this.enemy.isActive)
         {
            this.§_-Mw§();
            this.setGoToIdleStatus();
            return;
         }
         if(!this.enemy.dodgeAttack())
         {
            if(Math.random() < 0.3)
            {
               if(Math.random() > 0.5)
               {
                  this.cRoot.bullets.addChild(new Pop(new Point(this.enemy.x,this.enemy.y + this.enemy.yAdjust),"pow"));
               }
               else
               {
                  this.cRoot.bullets.addChild(new Pop(new Point(this.enemy.x,this.enemy.y + this.enemy.yAdjust),"sok"));
               }
            }
            this.enemy.setDamage(this.getDamage(),this.cRoot.gameSettings.P_ARMOR);
            if(!this.enemy.isActive)
            {
               this.§_-Mw§();
            }
         }
      }
      
      public function dodgeHit() : Boolean
      {
         return false;
      }
      
      protected function getDamage() : int
      {
         return this.minDamage + Math.ceil(Math.random() * (this.maxDamage - this.minDamage));
      }
      
      protected function findEnemy() : Boolean
      {
         var _loc3_:Enemy = null;
         var _loc1_:Enemy = null;
         var _loc2_:Enemy = null;
         if(this.isBlocking)
         {
            return false;
         }
         for each(_loc3_ in this.cRoot.enemies)
         {
            if(_loc3_.isActive && _loc3_.canBeBlocked && this.onRange(_loc3_))
            {
               if(!_loc3_.isBlocked)
               {
                  if(_loc1_ == null || _loc1_.currentNode > _loc3_.currentNode)
                  {
                     _loc1_ = _loc3_;
                  }
               }
               else if(!this.isFighting && (_loc2_ == null || _loc2_.currentNode > _loc3_.currentNode))
               {
                  _loc2_ = _loc3_;
               }
            }
         }
         if(_loc1_ != null)
         {
            this.§_-1M§(_loc1_);
            return true;
         }
         if(_loc2_ != null)
         {
            this.§_-Md§(_loc2_);
            return true;
         }
         return this.findEnemyStatic();
      }
      
      protected function findEnemyStatic() : Boolean
      {
         return false;
      }
      
      protected function §_-1M§(param1:Enemy) : void
      {
         if(this.isFighting)
         {
            this.enemy.§_-QS§(this.fightingPosition);
         }
         this.isFighting = true;
         this.isBlocking = true;
         this.isWalking = true;
         this.isIdle = false;
         this.enemy = param1;
         this.enemy.block(this);
         this.fightingPosition = 2;
         this.attackReloadTimeCounter = this.attackReloadTime - 1;
         this.setFightingPosition();
      }
      
      protected function §_-Md§(param1:Enemy) : void
      {
         this.isWalking = true;
         this.isBlocking = false;
         this.isFighting = true;
         this.isIdle = false;
         this.enemy = param1;
         this.fightingPosition = this.enemy.getFighterPosition();
         this.attackReloadTimeCounter = this.attackReloadTime - 1;
         this.setFightingPosition();
      }
      
      public function setGoToIdleStatus() : void
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
         this.destinationPoint.x = this.rallyPoint.x;
         this.destinationPoint.y = this.rallyPoint.y;
      }
      
      protected function setFightingPosition() : void
      {
         var _loc1_:Number = 0;
         var _loc2_:Number = 0;
         if(this.fightingPosition == 2)
         {
            _loc1_ = 0;
            _loc2_ = 0;
         }
         else if(this.fightingPosition == 0)
         {
            _loc1_ = 6;
            _loc2_ = 3;
         }
         else
         {
            _loc1_ = -6;
            _loc2_ = 3;
         }
         this.destinationPoint.y = Math.round(this.enemy.y) + _loc1_;
         if(this.enemy.scaleX == 1)
         {
            this.destinationPoint.x = Math.round(this.enemy.x) + this.xAdjust + this.enemy.xSoldierAdjust - _loc2_;
         }
         else
         {
            this.destinationPoint.x = Math.round(this.enemy.x) - this.xAdjust - this.enemy.xSoldierAdjust + _loc2_;
         }
         this.animationRun();
      }
      
      protected function §_-8v§() : void
      {
         if(this.enemy.scaleX == 1)
         {
            this.scaleX = -1;
            this.§_-Jc§.flip(-1);
         }
         else
         {
            this.scaleX = 1;
            this.§_-Jc§.flip(1);
            this.enemy.scaleX = -1;
         }
      }
      
      protected function playIdle() : void
      {
         this.targetedTimeCounter++;
         this.idleTimeCounter++;
         if(this.idleTimeCounter >= this.idleTime)
         {
            if(Math.round(Math.random() * 10) < 4)
            {
               this.scaleX = this.scaleX * -1;
               this.§_-Jc§.flip(this.scaleX * 1);
            }
            this.idleTimeCounter = 0;
         }
         if(this.targetedTimeCounter < this.§_-EA§)
         {
            return;
         }
         this.targetedTimeCounter = this.§_-EA§;
         this.§_-AD§++;
         if(this.§_-AD§ >= this.regenerateTime)
         {
            if(this.health < this.initHealth)
            {
               this.health = this.health + this.§_-Rd§;
               this.cRoot.game.gameAchievement.addRegeneration(this.§_-Rd§,this.cRoot);
               if(this.health > this.initHealth)
               {
                  this.health = this.initHealth;
               }
               this.updateLifebarProgress();
            }
            this.§_-AD§ = 0;
         }
      }
      
      protected function readyToAttack() : Boolean
      {
         this.attackReloadTimeCounter++;
         if(this.attackReloadTimeCounter == this.attackReloadTime)
         {
            this.chargeAttack();
            this.attackReloadTimeCounter = 0;
            return true;
         }
         return false;
      }
      
      protected function readyToRespawn() : Boolean
      {
         this.deadTimeCounter++;
         if(this.deadTimeCounter >= this.deadTime)
         {
            this.isDead = false;
            this.doorQueed = false;
            this.isRespawning = true;
            return true;
         }
         return false;
      }
      
      protected function readyToLive() : Boolean
      {
         if(this.tower != null && this.tower.isDisabled)
         {
            return false;
         }
         this.visible = false;
         if(!this.doorQueed && !this.§_-Lu§())
         {
            return false;
         }
         this.respawnTimeCounter++;
         if(this.respawnTimeCounter >= this.respawnTime)
         {
            this.visible = true;
            this.respawn();
            return true;
         }
         return false;
      }
      
      protected function readyToHide() : Boolean
      {
         this.§_-PB§++;
         if(this.§_-PB§ < this.lifeTime)
         {
            return false;
         }
         this.isActive = false;
         this.isDead = true;
         this.§_-Jc§.hide();
         this.gotoAndPlay("dead");
         if(this.isBlocking)
         {
            this.§_-Mw§();
         }
         return true;
      }
      
      protected function §_-Lu§() : Boolean
      {
         if(§_-Go§(this.tower).override())
         {
            §_-Go§(this.tower).openDoor();
            this.respawnTime = §_-Go§(this.tower).§_-1n§;
            this.doorQueed = true;
            return true;
         }
         if(§_-Go§(this.tower).§_-Kg§())
         {
            this.respawnTime = §_-Go§(this.tower).§_-1n§ - §_-Go§(this.tower).§_-Cp§;
            this.doorQueed = true;
            return true;
         }
         return false;
      }
      
      public function toSwamp() : void
      {
         if(this.cRoot.swamp != null && this.§_-2x§)
         {
            this.cRoot.swamp.§_-z§(this.initHealth);
         }
      }
      
      protected function onRange(param1:Object) : Boolean
      {
         var _loc2_:* = new Ellipse(this.tower.soldierRallyPoint.x - this.rangeWidth / 2,this.tower.soldierRallyPoint.y + 10 - this.rangeHeight / 2,this.rangeWidth,this.rangeHeight);
         return _loc2_.containsPoint(new Point(param1.x,param1.y));
      }
      
      protected function animationRun() : void
      {
         this.gotoAndPlay("running");
      }
      
      protected function animationIdle() : void
      {
         this.gotoAndStop("idle");
      }
      
      protected function §_-J9§() : void
      {
         if(this.isWalking)
         {
            this.animationRun();
         }
         else if(this.isIdle)
         {
            this.animationIdle();
         }
         else if(this.isFighting)
         {
            this.attackReloadTimeCounter = 0;
            this.§_-8v§();
         }
      }
      
      protected function onTunnel(param1:*, param2:*) : Boolean
      {
         if(this.cRoot.tunnels[param1][0])
         {
            if(param2 >= this.cRoot.tunnels[param1][1] && param2 <= this.cRoot.tunnels[param1][4])
            {
               return true;
            }
         }
         return false;
      }
      
      protected function § if§() : void
      {
         var _loc1_:§_-BC§ = null;
         for each(_loc1_ in this.§_-GF§)
         {
            _loc1_.§_-Nq§();
         }
      }
      
      protected function §_-f§() : void
      {
         var _loc1_:§_-BC§ = null;
         for each(_loc1_ in this.§_-GF§)
         {
            _loc1_.pause();
         }
      }
      
      protected function §_-MJ§() : void
      {
         var _loc1_:§_-BC§ = null;
         for each(_loc1_ in this.§_-GF§)
         {
            _loc1_.unPause();
         }
      }
      
      public function addDebuff(param1:§_-BC§) : void
      {
         var _loc2_:§_-BC§ = null;
         for each(_loc2_ in this.§_-GF§)
         {
            if(getQualifiedClassName(_loc2_) == getQualifiedClassName(param1))
            {
               if(_loc2_.level > param1.level)
               {
                  return;
               }
               _loc2_.resetToLevel(param1.level);
               return;
            }
         }
         this.addChild(param1);
         this.§_-GF§[param1] = param1;
         param1.init();
      }
      
      public function showAllDebuff() : void
      {
         var _loc1_:§_-BC§ = null;
         for each(_loc1_ in this.§_-GF§)
         {
            _loc1_.showDebuff();
         }
      }
      
      public function removeDebuff(param1:§_-BC§) : void
      {
         if(this.contains(param1))
         {
            this.removeChild(param1);
         }
         delete this.§_-GF§[param1];
      }
      
      public function hasDebuff(param1:String) : Boolean
      {
         var _loc2_:§_-BC§ = null;
         for each(_loc2_ in this.§_-GF§)
         {
            if(getQualifiedClassName(_loc2_) == param1)
            {
               return true;
            }
         }
         return false;
      }
      
      public function §_-BN§(param1:Boolean) : void
      {
         var _loc2_:§_-BC§ = null;
         for each(_loc2_ in this.§_-GF§)
         {
            _loc2_.removeDebuff();
         }
      }
      
      public function getHealth() : int
      {
         return this.health;
      }
      
      public function getInitHealth() : int
      {
         return this.initHealth;
      }
      
      protected function addGlow() : void
      {
         var _loc8_:Number = BitmapFilterQuality.HIGH;
         var _loc9_:GlowFilter = new GlowFilter(16772164,0.7,4,4,4,_loc8_,false,false);
         this.filters = new Array(_loc9_);
      }
      
      protected function §_-9H§() : void
      {
         var _loc1_:ColorMatrixFilter = new ColorMatrixFilter([1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0]);
         this.filters = [_loc1_];
      }
      
      protected function getRandomName() : void
      {
         this.nameIndex = Math.round(Math.random() * (this.§_-Qm§ - 1)) + 1;
      }
      
      public function getRandom(param1:*, param2:*) : Number
      {
         var _loc3_:Number = NaN;
         _loc3_ = Math.round(Math.random() * (param2 - param1)) + param1;
         return _loc3_;
      }
      
      public function destroyThis() : void
      {
         this.§_-BN§(false);
         this.isActive = false;
         if(this.isBlocking)
         {
            this.§_-Mw§();
         }
         else if(this.isFighting)
         {
            this.enemy.§_-QS§(this.fightingPosition);
         }
         this.tower = null;
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.removeEventListener(MouseEvent.CLICK,this.clickEvents);
         this.parent.removeChild(this);
      }
   }
}
