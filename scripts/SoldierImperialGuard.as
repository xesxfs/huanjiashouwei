package
{
   import fl.lang.Locale;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.casalib.math.geom.Ellipse;
   
   public class SoldierImperialGuard extends Soldier
   {
       
      
      private var lifes:int;
      
      private var rangePoint:Point;
      
      public function SoldierImperialGuard(param1:Point, param2:Point, param3:Tower, param4:Point)
      {
         addFrameScript(0,this.frame1,16,this.frame17,27,this.frame28,34,this.frame35);
         super(param1,param2,param3,20);
         this.rangePoint = param4;
      }
      
      override protected function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.lifes = 1;
         this.speed = 2;
         this.xAdjust = 12;
         this.attackChargeTime = 18;
         this.attackChargeDamageTime = 8;
         this.respawnTime = 1;
         this.idleTime = 30;
         this.deadTime = 23;
         this.§_-E9§ = false;
         this.maxSize = this.cRoot.gameSettings.specials.imperial.maxSize;
         this.maxLevel = this.cRoot.gameSettings.specials.imperial.maxLevel;
         this.rangeWidth = this.cRoot.gameSettings.specials.imperial.range;
         this.rangeHeight = this.cRoot.gameSettings.specials.imperial.range * this.cRoot.gameSettings.rangeRatio;
         this.health = this.initHealth = this.cRoot.gameSettings.specials.imperial.health;
         this.§_-Rd§ = this.cRoot.gameSettings.specials.imperial.regen;
         this.regenerateTime = this.cRoot.gameSettings.specials.imperial.regenReload;
         this.armor = this.cRoot.gameSettings.specials.imperial.armor;
         this.minDamage = this.cRoot.gameSettings.specials.imperial.minDamage;
         this.maxDamage = this.cRoot.gameSettings.specials.imperial.maxDamage;
         this.attackReloadTime = this.cRoot.gameSettings.specials.imperial.reload - this.attackChargeTime;
         this.§_-Jc§ = new §_-H8§(new Point(0,-26),this.health,this.initHealth);
         this.§_-Jc§.updateMaxHealth(this.initHealth,this.health);
         this.§_-Jc§.updateProgress(this.health);
         this.addChild(§_-Jc§);
         this.cRoot.addSoldier(this);
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.sIconName = "imperial";
         param1.sName = Locale.loadStringEx("SOLDIER_PALADIN_RANDOM_" + this.nameIndex + "_NAME",Locale.getDefaultLang());
         param1.sRespawn = "-";
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
            case "attack1End":
               break;
            case "attack2End":
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
            if(this.lifes == 1)
            {
               this.destroyThis();
               this.cRoot.removeSoldier(this);
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
      
      override protected function readyToLive() : Boolean
      {
         this.respawnTimeCounter++;
         if(this.respawnTimeCounter >= this.respawnTime)
         {
            this.respawn();
            return true;
         }
         return false;
      }
      
      override protected function chargeAttack() : void
      {
         this.isCharging = true;
         if(Math.random() > 0.5)
         {
            this.gotoAndPlay("attack1");
         }
         else
         {
            this.gotoAndPlay("attack2");
         }
      }
      
      override protected function onRange(param1:Object) : Boolean
      {
         var _loc2_:* = new Ellipse(this.rangePoint.x - this.rangeWidth / 2,this.rangePoint.y - this.rangeHeight / 2,this.rangeWidth,this.rangeHeight);
         return _loc2_.containsPoint(new Point(param1.x,param1.y));
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame17() : *
      {
         stop();
      }
      
      function frame28() : *
      {
         stop();
      }
      
      function frame35() : *
      {
         stop();
      }
   }
}
