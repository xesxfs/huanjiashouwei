package
{
   import com.mosesSupposes.bitmap.InteractivePNG;
   import flash.display.Shape;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   
   public class Enemy extends InteractivePNG
   {
       
      
      public var isActive:Boolean;
      
      public var isBoss:Boolean;
      
      public var isFlying:Boolean;
      
      public var isDead:Boolean;
      
      public var §_-4Y§:Boolean;
      
      public var isRespawning:Boolean;
      
      public var isCharging:Boolean;
      
      public var isFighting:Boolean;
      
      public var isBlocked:Boolean;
      
      public var §_-0H§:Boolean = false;
      
      public var onTunnel:Boolean = false;
      
      public var §_-Jc§:LifeBar;
      
      public var canBeBlocked:Boolean = true;
      
      public var §_-0f§:Boolean = true;
      
      public var canPoison:Boolean = true;
      
      public var §_-KS§:Boolean = false;
      
      public var §_-06§:Boolean = false;
      
      public var canSkeleton:Boolean = true;
      
      public var §_-2y§:Boolean = true;
      
      public var §_-3Y§:Boolean = true;
      
      public var §_-8e§:Boolean = true;
      
      public var level:int;
      
      public var size:int;
      
      public var initHealth:int;
      
      public var health:int;
      
      public var speed:Number;
      
      public var §_-58§:Number;
      
      public var armor:int;
      
      public var magicArmor:int;
      
      public var dodge:int;
      
      public var cost:int;
      
      public var gold:int;
      
      public var soldier:Soldier;
      
      public var fighterPosition:Array;
      
      public var maxDamage:int;
      
      public var minDamage:int;
      
      public var attackChargeTime:int = 8;
      
      public var attackChargeTimeCounter:int;
      
      public var attackReloadTime:int;
      
      public var attackReloadTimeCounter:int;
      
      public var attackDodgeTime:int;
      
      public var attackIsDodged:Boolean;
      
      public var deadTime:int = 50;
      
      public var deadTimeCounter:int = 0;
      
      public var roadIndex:int;
      
      public var road:Array;
      
      public var currentNode:int = 0;
      
      public var countNodesActive:int = 10;
      
      public var nodeMarginError:Number;
      
      public var §_-R2§:String;
      
      public var §_-Jy§:Number = 0;
      
      public var §_-IR§:Number = 0;
      
      public var xSoldierAdjust:int;
      
      public var xAdjust:int;
      
      public var yAdjust:int;
      
      public var §_-NA§:int;
      
      public var §_-C-§:int;
      
      public var §_-GF§:Dictionary;
      
      public var §_-4q§:String = "Blood";
      
      public var cRoot:Level;
      
      public function Enemy(param1:int, param2:Array)
      {
         this.fighterPosition = [0,0];
         this.§_-GF§ = new Dictionary(true);
         super();
         this.roadIndex = param1;
         this.road = param2;
         this.x = param2[this.currentNode].x;
         this.y = param2[this.currentNode].y;
         this.isActive = false;
         this.isDead = false;
         this.isCharging = false;
         this.isFighting = false;
         this.isBlocked = false;
         this.isRespawning = false;
         this.soldier = null;
         this.alphaTolerance = 0;
         this.attackDodgeTime = 4;
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OVER,this.rollOver,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,this.rollOut,false,0,true);
      }
      
      public function §_-Mx§(param1:int) : void
      {
         var _loc2_:Shape = new Shape();
         _loc2_.graphics.beginFill(0);
         _loc2_.graphics.lineStyle(0,6710886);
         _loc2_.graphics.drawCircle(this.road[param1].x,this.road[param1].y,2);
         _loc2_.graphics.endFill();
         Level(this.parent.parent).addChild(_loc2_);
      }
      
      public function init(param1:Event) : void
      {
      }
      
      public function clickEvents(param1:MouseEvent) : void
      {
         this.cRoot.freeMenues();
         this.cRoot.enemySelection.setEnemy(this);
         this.cRoot.menu.showEnemyInfo(this);
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
      
      public function getInfo() : Object
      {
         var _loc1_:Object = {};
         _loc1_.eHealth = this.health;
         _loc1_.eInitHealth = this.initHealth;
         _loc1_.eCost = this.cost;
         _loc1_.eArmor = this.armor;
         _loc1_.eMagicArmor = this.magicArmor;
         _loc1_.eReload = this.attackReloadTime;
         _loc1_.eDamageMin = this.minDamage;
         _loc1_.eDamageMax = this.maxDamage;
         this.getOtherInfo(_loc1_);
         return _loc1_;
      }
      
      public function §_-9I§(param1:int) : void
      {
         this.currentNode = param1;
         this.x = this.road[this.currentNode].x;
         this.y = this.road[this.currentNode].y;
      }
      
      public function getOtherInfo(param1:Object) : void
      {
         param1.tIconName = "p_enemy_bandit";
         param1.eName = "Enemy";
      }
      
      public function onFrameUpdate() : void
      {
         if(this.isDead)
         {
            if(this.deadTimeCounter == 0)
            {
               this.gotoAndPlay("dead");
            }
            this.deadTimeCounter++;
            if(this.deadTime == this.deadTimeCounter)
            {
               this.destroyThis();
            }
            return;
         }
         if(this.specialMove())
         {
            return;
         }
         if(this.isDead)
         {
            return;
         }
         this.§ if§();
         if(this.isDead)
         {
            return;
         }
         if(this.§_-0H§)
         {
            return;
         }
         if(this.isActive && !this.isCharging && this.specialPower())
         {
            return;
         }
         if(this.isBlocked)
         {
            if(this.soldier == null || !this.soldier.isActive || !this.soldier.isFighting)
            {
               this.stopFighting();
            }
         }
         if(this.isFighting)
         {
            if(this.soldier == null || !this.soldier.isActive)
            {
               this.stopFighting();
            }
            else if(this.isCharging)
            {
               if(!this.readyToDamage())
               {
                  return;
               }
               this.isCharging = false;
               this.attack();
               this.gotoAndStop("idle");
               if(this.soldier.isDead)
               {
                  this.stopFighting();
               }
            }
            else
            {
               this.readyToAttack();
            }
         }
         else
         {
            this.walk();
         }
      }
      
      public function attack() : void
      {
         if(this.attackIsDodged)
         {
            return;
         }
         if(Math.random() < 0.3)
         {
            if(this.size < GameSettings.§_-d§)
            {
               if(Math.random() > 0.5)
               {
                  this.cRoot.bullets.addChild(new Pop(new Point(this.soldier.x,this.soldier.y),"pow"));
               }
               else
               {
                  this.cRoot.bullets.addChild(new Pop(new Point(this.soldier.x,this.soldier.y),"sok"));
               }
            }
            else if(Math.random() > 0.5)
            {
               this.cRoot.bullets.addChild(new Pop(new Point(this.soldier.x,this.soldier.y),"whaam"));
            }
            else
            {
               this.cRoot.bullets.addChild(new Pop(new Point(this.soldier.x,this.soldier.y),"kapow"));
            }
         }
         this.playAttackSound();
         this.soldier.setDamage(this.getDamage());
      }
      
      public function pause() : void
      {
         this.stop();
      }
      
      public function unPause() : void
      {
         switch(this.currentFrameLabel)
         {
            case "walkingEnd":
               this.gotoAndPlay("walking");
               break;
            case "walkingUpEnd":
               this.gotoAndPlay("walkingUp");
               break;
            case "walkingDownEnd":
               this.gotoAndPlay("walkingDown");
               break;
            case "fightingEnd":
               break;
            case "thorEnd":
               break;
            case "thorFreeEnd":
               break;
            case "deadEnd":
               break;
            case "teleportEnd":
               break;
            case "idle":
               break;
            default:
               this.play();
         }
         this.unPauseEffects();
      }
      
      public function unPauseEffects() : void
      {
      }
      
      protected function getDamage() : int
      {
         return this.minDamage + Math.ceil(Math.random() * (this.maxDamage - this.minDamage));
      }
      
      public function block(param1:Soldier) : void
      {
         this.soldier = param1;
         this.isBlocked = true;
         this.gotoAndStop("idle");
      }
      
      public function startFighting() : void
      {
         this.isFighting = true;
         this.§_-R2§ = "";
         this.y = this.y + 0.1;
         this.chargeAttack();
      }
      
      public function stopFighting() : void
      {
         this.isBlocked = false;
         this.isFighting = false;
         this.isCharging = false;
         this.soldier = null;
         this.§_-R2§ = "";
         this.getFacing();
      }
      
      public function getFighterPosition() : int
      {
         if(this.fighterPosition[0] == 0)
         {
            this.fighterPosition[0] = this.fighterPosition[0] + 1;
            return 0;
         }
         if(this.fighterPosition[1] == 0)
         {
            this.fighterPosition[1] = this.fighterPosition[1] + 1;
            return 1;
         }
         if(Math.random() >= 0.5)
         {
            this.fighterPosition[0] = this.fighterPosition[0] + 1;
            return 0;
         }
         this.fighterPosition[1] = this.fighterPosition[1] + 1;
         return 1;
      }
      
      public function §_-QS§(param1:int) : void
      {
         if(this.fighterPosition == null)
         {
            return;
         }
         if(param1 < this.fighterPosition.length)
         {
            this.fighterPosition[param1] = this.fighterPosition[param1] - 1;
         }
      }
      
      public function dodgeAttack() : Boolean
      {
         if(this.dodge == 0)
         {
            return false;
         }
         if(Math.random() * 100 <= this.dodge)
         {
            return true;
         }
         return false;
      }
      
      public function toGraveyard() : void
      {
         if(this.cRoot.graveyard != null && this.canSkeleton)
         {
            this.cRoot.graveyard.spawnSkeleton(this.initHealth);
         }
      }
      
      public function setDamage(param1:int, param2:int = 3, param3:§_-27§ = null, param4:int = 0, param5:Boolean = false) : void
      {
         if(param2 != this.cRoot.gameSettings.I_ARMOR)
         {
            this.health = this.health - this.getArmorDamage(param2,param1,param4);
         }
         else
         {
            this.health = this.health - param1;
         }
         if(this.health <= 0)
         {
            this.health = 0;
            this.toGraveyard();
            this.setDeadBasicStatus(true);
            this.addBlood();
            return;
         }
         this.§_-Jc§.updateProgress(this.health);
         if(param3 != null)
         {
            this.addDebuff(param3);
         }
      }
      
      public function addBlood() : void
      {
         this.cRoot.addToDecal(new BloodDecal(new Point(this.x,this.y)));
      }
      
      public function setDamageArmor(param1:int) : void
      {
         if(this.armor == 0)
         {
            return;
         }
         this.armor = this.armor - param1;
         if(this.armor < 0)
         {
            this.armor = 0;
         }
      }
      
      public function setDeadBasicStatus(param1:Boolean = false) : void
      {
         this.isActive = false;
         this.isDead = true;
         this.§_-Jc§.hide();
         this.cRoot.updateCash(this.gold);
         this.cRoot.data.currentEnemiesDefeated = this.cRoot.data.currentEnemiesDefeated + 1;
         this.cRoot.game.gameAchievement.killEnemie(this.cRoot,getQualifiedClassName(this));
         if(param1)
         {
            this.playDeadSound();
         }
         if(this.cRoot.hasTunnels && this.§_-TJ§())
         {
            this.§_-CC§();
         }
      }
      
      public function specialMove() : Boolean
      {
         return false;
      }
      
      public function specialPower() : Boolean
      {
         return false;
      }
      
      public function §_-7v§() : Boolean
      {
         return false;
      }
      
      public function playDeadSound() : void
      {
      }
      
      public function playAttackSound() : void
      {
      }
      
      public function chargeAttack() : void
      {
         this.gotoAndPlay("fighting");
         this.isCharging = true;
      }
      
      public function getFacing() : void
      {
         if(this.isFighting)
         {
            this.attackChargeTimeCounter = 0;
            this.gotoAndStop("idle");
            return;
         }
         var _loc1_:* = this.road[this.currentNode + 1].y - this.road[this.currentNode].y;
         var _loc2_:* = this.road[this.currentNode + 1].x - this.road[this.currentNode].x;
         var _loc3_:* = Math.round(Math.atan2(-_loc1_,_loc2_) * 180 / Math.PI);
         if(_loc3_ < 0)
         {
            _loc3_ = _loc3_ + 360;
         }
         if(_loc3_ > 55 && _loc3_ < 135)
         {
            if(this.§_-R2§ != "up")
            {
               this.gotoAndPlay("walkingUp");
               this.§_-R2§ = "up";
            }
         }
         else if(_loc3_ >= 135 && _loc3_ <= 240)
         {
            if(this.§_-R2§ != "left")
            {
               this.gotoAndPlay("walking");
               this.scaleX = -1;
               this.§_-Jc§.flip(-1);
               this.§_-R2§ = "left";
            }
         }
         else if(_loc3_ > 240 && _loc3_ < 315)
         {
            if(this.§_-R2§ != "down")
            {
               this.gotoAndPlay("walkingDown");
               this.§_-R2§ = "down";
            }
         }
         else if(this.§_-R2§ != "right")
         {
            this.gotoAndPlay("walking");
            this.scaleX = 1;
            this.§_-Jc§.flip(1);
            this.§_-R2§ = "right";
         }
      }
      
      public function §_-HB§() : void
      {
         var _loc1_:* = this.road[this.currentNode + 1].y - this.road[this.currentNode].y;
         var _loc2_:* = this.road[this.currentNode + 1].x - this.road[this.currentNode].x;
         var _loc3_:* = Math.round(Math.atan2(-_loc1_,_loc2_) * 180 / Math.PI);
         if(_loc3_ < 0)
         {
            _loc3_ = _loc3_ + 360;
         }
         if(_loc3_ > 90 && _loc3_ < 270)
         {
            this.scaleX = -1;
            this.§_-Jc§.flip(-1);
         }
         else
         {
            this.scaleX = 1;
            this.§_-Jc§.flip(1);
         }
      }
      
      public function getNodesSpeed() : int
      {
         if(this.isBlocked)
         {
            return 0;
         }
         if(this.§_-4Y§)
         {
            return 0;
         }
         var _loc1_:int = Math.ceil(5.5 * this.speed);
         if(this.currentNode + _loc1_ >= this.road.length)
         {
            return this.road.length - this.currentNode - 1;
         }
         return _loc1_;
      }
      
      public function addDebuff(param1:§_-27§) : void
      {
         var _loc2_:§_-27§ = null;
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
         this.§_-GF§[param1] = param1;
         param1.init();
      }
      
      public function showAllDebuff() : void
      {
         var _loc1_:§_-27§ = null;
         for each(_loc1_ in this.§_-GF§)
         {
            _loc1_.showDebuff();
         }
      }
      
      public function removeDebuff(param1:§_-27§) : void
      {
         delete this.§_-GF§[param1];
      }
      
      public function hasDebuff(param1:String) : Boolean
      {
         var _loc2_:§_-27§ = null;
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
         var _loc2_:§_-27§ = null;
         for each(_loc2_ in this.§_-GF§)
         {
            _loc2_.removeDebuff(param1);
         }
      }
      
      protected function §_-TJ§() : Boolean
      {
         if(this.cRoot.tunnels[this.roadIndex][0] && (this.currentNode >= this.cRoot.tunnels[this.roadIndex][1] && this.currentNode <= this.cRoot.tunnels[this.roadIndex][4]))
         {
            return true;
         }
         return false;
      }
      
      protected function § if§() : void
      {
         var _loc1_:§_-27§ = null;
         for each(_loc1_ in this.§_-GF§)
         {
            _loc1_.§_-Nq§();
            if(this.isDead)
            {
               return;
            }
         }
      }
      
      public function getArmorDamage(param1:int, param2:int, param3:int = 0) : int
      {
         var _loc4_:int = 0;
         _loc4_ = this.armor;
         if(param3 != 0)
         {
            _loc4_ = _loc4_ - param3;
            if(_loc4_ < 0)
            {
               _loc4_ = 0;
            }
         }
         switch(param1)
         {
            case this.cRoot.gameSettings.P_ARMOR:
               return param2 - _loc4_ * param2 / 100;
            case this.cRoot.gameSettings.M_ARMOR:
               return param2 - this.magicArmor * param2 / 100;
            case this.cRoot.gameSettings.E_ARMOR:
               return param2 - _loc4_ / 2 * param2 / 100;
            default:
               return param2;
         }
      }
      
      protected function walk() : void
      {
         if(this.isBlocked)
         {
            this.§_-Jy§ = 0;
            this.§_-IR§ = 0;
            return;
         }
         var _loc1_:Number = this.road[this.currentNode + 1].y - this.y;
         var _loc2_:Number = this.road[this.currentNode + 1].x - this.x;
         var _loc3_:Number = Math.atan2(_loc1_,_loc2_);
         this.§_-IR§ = Math.sin(_loc3_) * this.speed;
         this.§_-Jy§ = Math.cos(_loc3_) * this.speed;
         this.x = this.x + this.§_-Jy§;
         this.y = this.y + this.§_-IR§;
         if(Math.sqrt(Math.pow(this.road[this.currentNode + 1].y - this.y,2) + Math.pow(this.road[this.currentNode + 1].x - this.x,2)) < this.nodeMarginError)
         {
            this.currentNode++;
            if(this.§_-2c§())
            {
               return;
            }
            this.getFacing();
         }
      }
      
      protected function readyToAttack() : Boolean
      {
         this.attackReloadTimeCounter++;
         if(this.attackReloadTimeCounter == this.attackReloadTime)
         {
            this.chargeAttack();
            this.attackReloadTimeCounter = 0;
            this.attackIsDodged = false;
            return true;
         }
         return false;
      }
      
      protected function readyToDamage() : Boolean
      {
         this.attackChargeTimeCounter++;
         if(this.attackChargeTimeCounter == this.attackChargeTime)
         {
            this.attackChargeTimeCounter = 0;
            return true;
         }
         if(this.attackChargeTimeCounter == this.attackDodgeTime)
         {
            if(this.soldier != null && this.soldier.isActive)
            {
               if(this.soldier.dodgeHit())
               {
                  this.attackIsDodged = true;
               }
            }
         }
         return false;
      }
      
      protected function §_-2c§() : Boolean
      {
         if(this.currentNode == this.countNodesActive)
         {
            this.isActive = true;
            return false;
         }
         if(this.currentNode + 11 == this.road.length)
         {
            this.isActive = false;
            return false;
         }
         if(this.cRoot.hasTunnels)
         {
            if(this.cRoot.tunnels[this.roadIndex][0] == true)
            {
               if(this.currentNode == this.cRoot.tunnels[this.roadIndex][1])
               {
                  this.isActive = false;
                  this.get();
               }
               else if(this.currentNode == this.cRoot.tunnels[this.roadIndex][2])
               {
                  this.visible = false;
                  this.§_-58§ = this.speed;
                  this.speed = this.speed + this.§_-58§;
                  this.nodeMarginError = this.speed + 0.1;
               }
               else if(this.currentNode == this.cRoot.tunnels[this.roadIndex][3])
               {
                  this.visible = true;
                  this.speed = this.speed - this.§_-58§;
                  this.nodeMarginError = this.speed + 0.1;
               }
               else if(this.currentNode == this.cRoot.tunnels[this.roadIndex][4])
               {
                  this.isActive = true;
                  this.§_-CC§();
               }
            }
         }
         if(this.currentNode + 7 < this.road.length)
         {
            return false;
         }
         this.isActive = false;
         this.cRoot.removeEnemy(this);
         this.cRoot.looseLive(this.cost);
         this.cRoot.updateCash(this.gold);
         this.destroyThis();
         return true;
      }
      
      protected function get() : void
      {
         this.onTunnel = true;
         _loc1_[5] = this.cRoot.tunnels[this.roadIndex][5] + 1;
         if(this.cRoot.tunnels[this.roadIndex][5] == 1)
         {
            this.cRoot.changeTunneStatus(this.roadIndex + 1,true);
         }
      }
      
      protected function §_-CC§() : void
      {
         this.onTunnel = false;
         _loc1_[5] = this.cRoot.tunnels[this.roadIndex][5] - 1;
         if(this.cRoot.tunnels[this.roadIndex][5] == 0)
         {
            this.cRoot.changeTunneStatus(this.roadIndex + 1,false);
         }
      }
      
      protected function removeFromList() : void
      {
         this.cRoot.removeEnemy(this);
      }
      
      public function destroyThis() : void
      {
         this.§_-BN§(false);
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.removeEventListener(MouseEvent.ROLL_OVER,this.rollOver);
         this.removeEventListener(MouseEvent.ROLL_OUT,this.rollOut);
         this.removeEventListener(MouseEvent.CLICK,this.clickEvents);
         this.removeFromList();
         if(this.§_-Jc§ != null && this.contains(this.§_-Jc§))
         {
            this.removeChild(this.§_-Jc§);
         }
         this.§_-Jc§ = null;
         this.soldier = null;
         this.road = null;
         this.§_-GF§ = null;
         this.cRoot = null;
         this.parent.removeChild(this);
      }
   }
}
