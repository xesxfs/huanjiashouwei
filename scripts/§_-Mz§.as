package
{
   import fl.lang.Locale;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class §_-Mz§ extends §_-Ol§
   {
       
      
      protected var level:int;
      
      protected var §_-3W§:§_-Ep§;
      
      protected var path:Array;
      
      protected var §_-Js§:int;
      
      public function §_-Mz§(param1:Point, param2:Point, param3:Tower, param4:Point, param5:int, param6:§_-Ep§)
      {
         this.path = [];
         addFrameScript(0,this.frame1,26,this.frame27,45,this.frame46,63,this.frame64);
         super(param1,param2,param3,param4);
         this.level = param5;
         this.§_-3W§ = param6;
         this.rangePoint = param4;
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      override protected function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.lifes = 1;
         this.speed = 1.7;
         this.xAdjust = 5;
         this.attackChargeTime = 16;
         this.attackChargeDamageTime = 9;
         this.respawnTime = 19;
         this.deadTime = 10;
         this.idleTime = 30;
         this.maxSize = this.cRoot.gameSettings.heroes.heroArcher.callOfWildSize;
         this.maxLevel = this.cRoot.gameSettings.heroes.heroArcher.callOfWildMaxLevel;
         this.rangeWidth = this.cRoot.gameSettings.heroes.heroArcher.callOfWildRangeRally;
         this.rangeHeight = this.rangeWidth * this.cRoot.gameSettings.rangeRatio;
         this.§_-Rd§ = this.cRoot.gameSettings.heroes.heroArcher.callOfWildRegen;
         this.regenerateTime = this.cRoot.gameSettings.heroes.heroArcher.callOfWildRegenReload;
         this.armor = this.cRoot.gameSettings.heroes.heroArcher.callOfWildArmor;
         this.attackReloadTime = this.cRoot.gameSettings.heroes.heroArcher.callOfWildReload - this.attackChargeTime;
         this.§_-Jc§ = new §_-H8§(new Point(0,-21),this.health,this.initHealth);
         this.§_-Jc§.updateMaxHealth(this.initHealth,this.health);
         this.§_-Jc§.updateProgress(this.health);
         this.addChild(§_-Jc§);
         this.isActive = false;
         this.isDead = true;
         this.deadTimeCounter = this.deadTime - 1;
         this.cRoot.addSoldier(this);
         this.§_-FM§(this.level);
         this.canBeCourage = false;
         this.addEventListener(MouseEvent.CLICK,this.clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.sIconName = "wildcat";
         param1.sName = Locale.loadStringEx("HERO_ARCHER_WILDCAT_NAME",Locale.getDefaultLang());
         param1.sRespawn = "-";
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
            case "respawningEnd":
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
      
      public function §_-FM§(param1:int) : void
      {
         this.level = param1;
         this.health = this.initHealth = this.cRoot.gameSettings.heroes.heroArcher.callOfWildHealth + this.cRoot.gameSettings.heroes.heroArcher.callOfWildHealthIncrement * this.level;
         this.minDamage = this.cRoot.gameSettings.heroes.heroArcher.callOfWildMinDamage + this.cRoot.gameSettings.heroes.heroArcher.callOfWildDamageIncrement * this.level;
         this.maxDamage = this.cRoot.gameSettings.heroes.heroArcher.callOfWildMaxDamage + this.cRoot.gameSettings.heroes.heroArcher.callOfWildDamageIncrement * this.level;
         this.§_-Jc§.updateMaxHealth(this.initHealth,this.health);
         this.§_-Jc§.updateProgress(this.health);
      }
      
      override protected function stopSpecial() : void
      {
         this.isCharging = false;
      }
      
      override public function stopOnDead() : void
      {
         this.§_-3W§.§function§();
      }
      
      override public function eat() : void
      {
         this.§_-3W§.§function§();
         super.eat();
      }
      
      override protected function fight() : void
      {
         this.attackChargeTimeCounter++;
         if(this.attackChargeTimeCounter < this.attackChargeTime)
         {
            if(this.attackChargeTimeCounter == this.attackChargeDamageTime)
            {
               this.cRoot.game.gameSounds.playHeroAlleriaWildcat();
               this.hitEnemy();
            }
            return;
         }
         this.attackChargeTimeCounter = 0;
         this.isCharging = false;
      }
      
      override public function toSwamp() : void
      {
      }
      
      override protected function clickEvents(param1:MouseEvent) : void
      {
         this.cRoot.freeMenues();
         this.cRoot.soldierSelection.setSoldier(this);
         this.cRoot.menu.showSoldierInfo(this);
      }
      
      public function §_-Su§(param1:Point, param2:Array) : void
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
         if(param2 != null)
         {
            this.path = param2;
            this.§_-Js§ = this.path.length - 1;
         }
      }
      
      override protected function walk() : Boolean
      {
         if(this.path == null || this.path.length == 0)
         {
            return super.walk();
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
         var _loc3_:Number = Math.atan2(_loc2_.y - this.y,_loc2_.x - this.x);
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
         this.x = this.x + Math.cos(_loc3_) * this.speed;
         this.y = this.y + Math.sin(_loc3_) * this.speed;
         this.evalRunningEnd();
         return false;
      }
      
      protected function §_-IW§(param1:Point) : Boolean
      {
         if(Math.sqrt(Math.pow(param1.y - this.y,2) + Math.pow(param1.x - this.x,2)) <= this.speed)
         {
            return true;
         }
         return false;
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame27() : *
      {
         stop();
      }
      
      function frame46() : *
      {
         stop();
      }
      
      function frame64() : *
      {
         stop();
      }
   }
}
