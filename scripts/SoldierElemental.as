package
{
   import fl.lang.Locale;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.casalib.math.geom.Ellipse;
   
   public class SoldierElemental extends Soldier
   {
       
      
      public var level:int;
      
      private var §_-NY§:Point;
      
      private var areaAttackRangeWidth:int;
      
      private var §package§:int;
      
      private var §_-GB§:int;
      
      public function SoldierElemental(param1:Point, param2:Point, param3:Tower)
      {
         addFrameScript(0,this.frame1,56,this.frame57,69,this.frame70,95,this.frame96);
         super(param1,param2,param3);
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      override protected function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.maxSize = this.cRoot.gameSettings.mages.sorcerer.elementalMaxSize;
         this.maxLevel = this.cRoot.gameSettings.mages.sorcerer.elementalMaxLevel;
         this.rangeWidth = this.cRoot.gameSettings.mages.sorcerer.elementalRange;
         this.rangeHeight = this.cRoot.gameSettings.mages.sorcerer.elementalRange * this.cRoot.gameSettings.rangeRatio;
         this.§_-Rd§ = this.cRoot.gameSettings.mages.sorcerer.elementalRegen;
         this.regenerateTime = this.cRoot.gameSettings.mages.sorcerer.elementalRegenReload;
         this.deadTime = this.cRoot.gameSettings.mages.sorcerer.elementalRespawnTime;
         this.attackReloadTime = this.cRoot.gameSettings.mages.sorcerer.elementalReload;
         this.areaAttackRangeWidth = this.cRoot.gameSettings.mages.sorcerer.elementalAreaAttackRangeWidth;
         this.§package§ = this.cRoot.gameSettings.mages.sorcerer.elementalAreaAttackRangeWidth * this.cRoot.gameSettings.rangeRatio;
         this.§_-GB§ = this.cRoot.gameSettings.mages.sorcerer.elementalAreaAttackMaxEnemies;
         this.attackChargeTime = 30;
         this.attackChargeDamageTime = 13;
         this.respawnTime = 27;
         this.idleTime = 30;
         this.speed = 1.3;
         this.xAdjust = 15;
         this.isActive = false;
         this.isDead = true;
         this.deadTimeCounter = this.deadTime - 1;
         this.§_-Jc§ = new §_-Ov§(new Point(0,-43),this.health,this.initHealth);
         this.addChild(§_-Jc§);
         this.upgrade(1);
         this.§_-R0§ = false;
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.sIconName = "elemental";
         param1.sName = Locale.loadStringEx("SOLDIER_ELEMENTAL_NAME",Locale.getDefaultLang());
         param1.sRespawn = this.cRoot.gameSettings.mages.sorcerer.elementalRespawnTime / this.cRoot.gameSettings.framesRate + "s";
      }
      
      override public function pause() : void
      {
         this.stop();
         this.§_-f§();
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
            case "idle":
               break;
            default:
               this.play();
         }
         this.§_-MJ§();
      }
      
      public function upgrade(param1:int) : void
      {
         this.level = param1;
         this.health = this.initHealth = this.cRoot.gameSettings.mages.sorcerer.elementalHealth + this.cRoot.gameSettings.mages.sorcerer.elementalExtraHealth * this.level;
         this.armor = this.cRoot.gameSettings.mages.sorcerer.elementalArmor + this.cRoot.gameSettings.mages.sorcerer.elementalArmorExtra * this.level;
         this.minDamage = this.cRoot.gameSettings.mages.sorcerer.elementalMinDamage + this.cRoot.gameSettings.mages.sorcerer.elementalDamageExtra * this.level;
         this.maxDamage = this.cRoot.gameSettings.mages.sorcerer.elementalMaxDamage + this.cRoot.gameSettings.mages.sorcerer.elementalDamageExtra * this.level;
         this.§_-Jc§.updateMaxHealth(this.initHealth,this.health);
         this.§_-Jc§.updateProgress(this.health);
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
         this.respawnCustom();
         this.animationRun();
      }
      
      override protected function readyToRespawn() : Boolean
      {
         this.deadTimeCounter++;
         if(this.deadTimeCounter >= this.deadTime)
         {
            this.isDead = false;
            this.doorQueed = false;
            this.isRespawning = true;
            this.gotoAndPlay("respawning");
            this.cRoot.game.gameSounds.playElementalDead();
            this.visible = true;
            return true;
         }
         return false;
      }
      
      override protected function readyToLive() : Boolean
      {
         if(this.tower != null && this.tower.isDisabled)
         {
            return false;
         }
         this.respawnTimeCounter++;
         if(this.respawnTimeCounter >= this.respawnTime)
         {
            this.respawn();
            return true;
         }
         return false;
      }
      
      override protected function hitEnemy() : void
      {
         this.cRoot.decals.addChild(new HitGroundSmokeDecal(new Point(this.x,this.y),this.scaleX));
         this.cRoot.bullets.addChild(new HitGroundSmoke(new Point(this.x,this.y),this.scaleX));
         if(this.enemy == null || !this.enemy.isActive)
         {
            this.§_-Mw§();
            this.setGoToIdleStatus();
            return;
         }
         if(Math.random() < 0.3)
         {
            if(Math.random() > 0.5)
            {
               this.cRoot.bullets.addChild(new Pop(new Point(this.enemy.x,this.enemy.y),"whaam"));
            }
            else
            {
               this.cRoot.bullets.addChild(new Pop(new Point(this.enemy.x,this.enemy.y),"kapow"));
            }
         }
         this.§_-5o§();
         if(!this.enemy.isActive)
         {
            this.§_-Mw§();
         }
      }
      
      private function getAttackPoint() : Point
      {
         if(this.scaleX == 1)
         {
            return new Point(this.x + 30,this.y);
         }
         return new Point(this.x - 30,this.y);
      }
      
      private function §_-5o§() : void
      {
         var _loc2_:Enemy = null;
         this.§_-NY§ = this.getAttackPoint();
         var _loc1_:int = 0;
         for each(_loc2_ in this.cRoot.enemies)
         {
            if(_loc2_.isActive && !_loc2_.isFlying && this.onRangeAttack(_loc2_))
            {
               if(!_loc2_.dodgeAttack())
               {
                  _loc2_.setDamage(this.getDamage(),this.cRoot.gameSettings.P_ARMOR);
               }
               _loc1_++;
               if(_loc1_ != this.§_-GB§)
               {
                  continue;
               }
               break;
            }
         }
      }
      
      protected function onRangeAttack(param1:Object) : Boolean
      {
         var _loc2_:* = new Ellipse(this.§_-NY§.x - this.areaAttackRangeWidth / 2,this.§_-NY§.y - this.§package§ / 2,this.areaAttackRangeWidth,this.§package§);
         return _loc2_.containsPoint(new Point(param1.x,param1.y));
      }
      
      override public function playDeadSound() : void
      {
         this.cRoot.game.gameSounds.playElementalDead();
      }
      
      override public function tsung(param1:Point) : void
      {
      }
      
      override public function burn(param1:int) : void
      {
         this.setDamage(param1,false);
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame57() : *
      {
         stop();
      }
      
      function frame70() : *
      {
         stop();
      }
      
      function frame96() : *
      {
         stop();
      }
   }
}
