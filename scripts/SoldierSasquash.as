package
{
   import fl.lang.Locale;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.casalib.math.geom.Ellipse;
   
   public class SoldierSasquash extends Soldier
   {
       
      
      private var §_-Fc§:Boolean = true;
      
      private var §_-NN§:Point;
      
      private var §_-NY§:Point;
      
      private var areaAttackRangeWidth:int;
      
      private var §package§:int;
      
      private var §_-GB§:int;
      
      private var lifes:int;
      
      public function SoldierSasquash(param1:Point, param2:Point, param3:Tower)
      {
         this.§_-NN§ = new Point(214,211);
         addFrameScript(0,this.frame1,54,this.frame55,79,this.frame80);
         super(param1,param2,param3);
      }
      
      override protected function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.cRoot.game.gameSounds.playSasquashReady();
         this.lifes = 1;
         this.speed = 1.65;
         this.attackChargeTime = 30;
         this.attackChargeDamageTime = 13;
         this.respawnTime = 18;
         this.idleTime = 30;
         this.deadTime = 50;
         this.xAdjust = 20;
         this.visible = false;
         this.maxSize = this.cRoot.gameSettings.specials.sasquash.maxSize;
         this.maxLevel = this.cRoot.gameSettings.specials.sasquash.maxLevel;
         this.rangeWidth = this.cRoot.gameSettings.specials.sasquash.range;
         this.rangeHeight = this.cRoot.gameSettings.specials.sasquash.range * this.cRoot.gameSettings.rangeRatio;
         this.health = this.initHealth = this.cRoot.gameSettings.specials.sasquash.health;
         this.§_-Rd§ = this.cRoot.gameSettings.specials.sasquash.regen;
         this.regenerateTime = this.cRoot.gameSettings.specials.sasquash.regenReload;
         this.armor = this.cRoot.gameSettings.specials.sasquash.armor;
         this.minDamage = this.cRoot.gameSettings.specials.sasquash.minDamage;
         this.maxDamage = this.cRoot.gameSettings.specials.sasquash.maxDamage;
         this.attackReloadTime = this.cRoot.gameSettings.specials.sasquash.reload - this.attackChargeTime;
         this.areaAttackRangeWidth = this.cRoot.gameSettings.specials.sasquash.areaAttackRangeWidth;
         this.§package§ = this.cRoot.gameSettings.specials.sasquash.areaAttackRangeWidth * this.cRoot.gameSettings.rangeRatio;
         this.§_-GB§ = this.cRoot.gameSettings.specials.sasquash.areaAttackMaxEnemies;
         this.§_-Jc§ = new §_-Ov§(new Point(0,-47),this.health,this.initHealth);
         this.§_-Jc§.updateMaxHealth(this.initHealth,this.health);
         this.§_-Jc§.updateProgress(this.health);
         this.addChild(§_-Jc§);
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.sIconName = "sasquash";
         param1.sName = Locale.loadStringEx("SOLDIER_SASQUASH_NAME",Locale.getDefaultLang());
         param1.sRespawn = "-";
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
         this.x = this.tower.x - 50;
         this.y = this.tower.y + 10;
         this.destinationPoint.x = this.§_-NN§.x;
         this.destinationPoint.y = this.§_-NN§.y;
         this.health = this.initHealth;
         this.§_-Jc§.show();
         this.§_-Jc§.updateProgress(this.health);
         this.deadTimeCounter = 0;
         this.respawnTimeCounter = 0;
         this.respawnCustom();
         this.animationRun();
         this.cRoot.game.gameAchievement.trainSoldier(this.cRoot);
      }
      
      override public function changeRallyPoint(param1:Point) : void
      {
         this.rallyPoint = param1;
         if(this.isDead || this.isRespawning || this.§_-Fc§)
         {
            return;
         }
         this.isActive = false;
         this.§_-Mw§();
         this.setGoToIdleStatus();
         this.stopSpecial();
      }
      
      override protected function runSpecial() : Boolean
      {
         if(this.§_-Fc§)
         {
            return this.§ var§();
         }
         return false;
      }
      
      protected function § var§() : Boolean
      {
         if(Math.sqrt(Math.pow(this.destinationPoint.y - this.y,2) + Math.pow(this.destinationPoint.x - this.x,2)) <= this.speed)
         {
            this.§_-Fc§ = false;
            this.destinationPoint.x = this.rallyPoint.x;
            this.destinationPoint.y = this.rallyPoint.y;
            return false;
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
         return true;
      }
      
      override protected function readyToRespawn() : Boolean
      {
         this.deadTimeCounter++;
         if(this.deadTimeCounter >= this.deadTime)
         {
            if(this.lifes == 1)
            {
               §_-Go§(this.tower).removeSoldier(this);
               this.destroyThis();
               return false;
            }
            this.isDead = false;
            this.doorQueed = false;
            this.isRespawning = true;
            this.lifes++;
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
         this.cRoot.game.gameSounds.playEnemyBigDead();
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame55() : *
      {
         stop();
      }
      
      function frame80() : *
      {
         stop();
      }
   }
}
