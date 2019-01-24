package
{
   import fl.lang.Locale;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.casalib.math.geom.Ellipse;
   
   public class §_-D7§ extends Soldier
   {
       
      
      private var respawnOnInit:Boolean;
      
      private var §_-S0§:Point;
      
      private var nettingTarget:Enemy;
      
      private var throwingTarget:Enemy;
      
      private var §_-4P§:String = "";
      
      private var dualWeaponsLevel:int;
      
      private var throwingLevel:int;
      
      private var §_-SF§:Boolean;
      
      private var throwingRangeWidth:int;
      
      private var throwingRangeHeight:int;
      
      private var throwingMinRange:int;
      
      private var throwingChargeTime:int = 14;
      
      private var throwingChargeTimeCounter:int;
      
      private var throwingReloadTime:int;
      
      private var throwingReloadTimeCounter:int;
      
      private var tmpAxeRotation:int;
      
      private var nettingsLevel:int;
      
      private var §_-Gd§:Boolean;
      
      private var §_-IB§:int;
      
      private var §_-05§:int;
      
      private var §_-3u§:int = 14;
      
      private var §_-GZ§:int;
      
      private var §_-Jk§:int;
      
      private var §_-RQ§:int;
      
      private var enemiesKills:int;
      
      public function §_-D7§(param1:Point, param2:Point, param3:Tower, param4:Boolean)
      {
         this.§_-S0§ = new Point();
         addFrameScript(0,this.frame1,1,this.frame2,22,this.frame23,41,this.frame42,55,this.frame56,69,this.frame70,85,this.frame86,101,this.frame102,108,this.frame109);
         super(param1,param2,param3,20);
         this.respawnOnInit = param4;
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      override protected function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.maxSize = this.cRoot.gameSettings.soldiers.barbarian.maxSize;
         this.maxLevel = this.cRoot.gameSettings.soldiers.barbarian.maxLevel;
         this.rangeWidth = this.cRoot.gameSettings.soldiers.barbarian.range;
         this.rangeHeight = this.cRoot.gameSettings.soldiers.barbarian.range * this.cRoot.gameSettings.rangeRatio;
         this.health = this.initHealth = this.cRoot.gameSettings.soldiers.barbarian.health;
         this.§_-Rd§ = this.cRoot.gameSettings.soldiers.barbarian.regen;
         this.regenerateTime = this.cRoot.gameSettings.soldiers.barbarian.regenReload;
         this.armor = this.cRoot.gameSettings.soldiers.barbarian.armor;
         this.minDamage = this.cRoot.gameSettings.soldiers.barbarian.minDamage;
         this.maxDamage = this.cRoot.gameSettings.soldiers.barbarian.maxDamage;
         this.deadTime = this.cRoot.gameSettings.soldiers.barbarian.respawn;
         this.attackReloadTime = this.cRoot.gameSettings.soldiers.barbarian.reload;
         this.respawnTime = 1;
         this.attackChargeTime = 20;
         this.attackChargeDamageTime = 5;
         this.speed = 2;
         this.idleTime = 30;
         this.xAdjust = 2;
         this.§_-Jc§ = new §_-H8§(new Point(0,-23),this.health,this.initHealth);
         this.addChild(§_-Jc§);
         if(this.respawnOnInit)
         {
            this.visible = false;
         }
         else if(this.isFighting)
         {
            this.§_-8v§();
         }
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.sIconName = "barbarian";
         param1.sName = Locale.loadStringEx("SOLDIER_BARBARIAN_RANDOM_" + this.nameIndex + "_NAME",Locale.getDefaultLang());
         param1.sRespawn = this.cRoot.gameSettings.soldiers.barbarian.respawn / this.cRoot.gameSettings.framesRate + "s";
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
            case "running2End":
               this.gotoAndPlay("running2");
               break;
            case "hunting_nets":
               break;
            case "hunting_nets2":
               break;
            case "throwing_axe":
               break;
            case "throwing_axe2":
               break;
            case "attackEnd":
               break;
            case "attack2End":
               break;
            case "deadEnd":
               break;
            case "idle":
               break;
            case "idle2":
               break;
            default:
               this.play();
         }
         this.§_-MJ§();
      }
      
      override public function stopOnDead() : void
      {
         this.§_-SF§ = false;
         this.§_-Gd§ = false;
      }
      
      override protected function hitEnemy() : void
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
                  this.cRoot.bullets.addChild(new Pop(new Point(this.enemy.x,this.enemy.y),"pow"));
               }
               else
               {
                  this.cRoot.bullets.addChild(new Pop(new Point(this.enemy.x,this.enemy.y),"sok"));
               }
            }
            this.enemy.setDamage(this.getDamage(),this.cRoot.gameSettings.P_ARMOR);
            if(this.enemy != null && !this.enemy.isActive)
            {
               if(this.enemy.isDead)
               {
                  this.§_-2k§();
               }
               this.§_-Mw§();
            }
         }
      }
      
      override protected function readyToRespawn() : Boolean
      {
         this.deadTimeCounter++;
         if(this.deadTimeCounter >= this.deadTime)
         {
            this.isDead = false;
            this.doorQueed = false;
            this.isRespawning = true;
            this.enemiesKills = 0;
            return true;
         }
         return false;
      }
      
      public function §_-2k§() : void
      {
         this.enemiesKills++;
         if(this.enemiesKills == 10)
         {
            this.cRoot.game.gameAchievement.evalBarbarianRush(this.cRoot);
         }
      }
      
      override protected function runSpecial() : Boolean
      {
         if(this.nettingsLevel != 0 && this.§_-SQ§())
         {
            return true;
         }
         if(this.throwingLevel != 0 && this.§_-B§())
         {
            return true;
         }
         return false;
      }
      
      private function §_-SQ§() : Boolean
      {
         var _loc1_:Boolean = false;
         if(this.§_-SF§)
         {
            return false;
         }
         if(!this.§_-Gd§)
         {
            if(this.§_-RQ§ < this.§_-Jk§)
            {
               this.§_-RQ§++;
               return false;
            }
            if(!this.getNettingTarget())
            {
               return false;
            }
            if(this.nettingTarget.x >= this.x)
            {
               this.scaleX = 1;
               this.§_-Jc§.flip(1);
            }
            else
            {
               this.scaleX = -1;
               this.§_-Jc§.flip(-1);
            }
            this.§_-Gd§ = true;
            this.§_-GZ§ = 0;
            this.gotoAndPlay("hunting_nets" + this.§_-4P§);
            return true;
         }
         if(this.§_-GZ§ < this.§_-3u§)
         {
            this.§_-GZ§++;
            if(this.§_-GZ§ == 7)
            {
               _loc1_ = true;
               if(this.nettingTarget == null || !this.nettingTarget.isActive || !this.nettingCanNetTarget(this.nettingTarget))
               {
                  _loc1_ = this.getNettingTarget();
               }
               if(_loc1_)
               {
                  this.cRoot.bullets.addChild(new §_-c§(this.nettingsLevel,new Point(this.x,this.y),this.nettingTarget,null));
               }
            }
            return true;
         }
         this.§_-Gd§ = false;
         this.§_-RQ§ = 0;
         this.§_-J9§();
         return false;
      }
      
      private function getNettingTarget() : Boolean
      {
         var _loc1_:Enemy = null;
         this.nettingTarget = null;
         for each(_loc1_ in this.cRoot.enemies)
         {
            if(_loc1_.isActive && _loc1_.isFlying && this.§_-2H§(_loc1_))
            {
               if(this.nettingCanNetTarget(_loc1_))
               {
                  this.nettingTarget = _loc1_;
                  break;
               }
            }
         }
         if(this.nettingTarget != null)
         {
            return true;
         }
         return false;
      }
      
      private function nettingCanNetTarget(param1:Enemy) : Boolean
      {
         if(!param1.hasDebuff("DebuffNet") && !param1.hasDebuff("DebuffRocketeer") && !param1.hasDebuff("DebuffSlow"))
         {
            return true;
         }
         return false;
      }
      
      private function §_-2H§(param1:Enemy) : Boolean
      {
         var _loc2_:* = new Ellipse(this.x - this.§_-IB§ / 2,this.y - this.§_-05§ / 2,this.§_-IB§,this.§_-05§);
         return _loc2_.containsPoint(new Point(param1.x,param1.y));
      }
      
      private function §_-B§() : Boolean
      {
         var _loc1_:Point = null;
         if(this.§_-Gd§)
         {
            return false;
         }
         if(!this.§_-SF§)
         {
            if(this.throwingReloadTimeCounter < this.throwingReloadTime)
            {
               this.throwingReloadTimeCounter++;
               return false;
            }
            if(!this.getThrowingTarget())
            {
               return false;
            }
            if(this.throwingTarget.x >= this.x)
            {
               this.scaleX = 1;
               this.§_-Jc§.flip(1);
               this.tmpAxeRotation = 1;
            }
            else
            {
               this.scaleX = -1;
               this.§_-Jc§.flip(-1);
               this.tmpAxeRotation = -1;
            }
            this.§_-S0§.x = this.throwingTarget.x + this.throwingTarget.xAdjust;
            this.§_-S0§.y = this.throwingTarget.y + this.throwingTarget.yAdjust;
            this.§_-SF§ = true;
            this.throwingChargeTimeCounter = 0;
            this.gotoAndPlay("throwing_axe" + this.§_-4P§);
            return true;
         }
         if(this.throwingChargeTimeCounter < this.throwingChargeTime)
         {
            this.throwingChargeTimeCounter++;
            if(this.throwingChargeTimeCounter == 7)
            {
               _loc1_ = null;
               if(this.throwingTarget == null || !this.throwingTarget.isActive)
               {
                  if(!this.getThrowingTarget())
                  {
                     _loc1_ = new Point(this.§_-S0§.x,this.§_-S0§.y);
                  }
               }
               this.cRoot.bullets.addChild(new Axe(this.throwingLevel,new Point(this.x,this.y - 12),this.throwingTarget,_loc1_,this.tmpAxeRotation));
               this.cRoot.game.gameAchievement.axeFire(this.cRoot);
            }
            return true;
         }
         this.§_-SF§ = false;
         this.throwingReloadTimeCounter = 0;
         this.§_-J9§();
         return false;
      }
      
      public function getThrowingTarget() : Boolean
      {
         var _loc2_:Enemy = null;
         var _loc1_:Enemy = null;
         this.throwingTarget = null;
         for each(_loc2_ in this.cRoot.enemies)
         {
            if(_loc2_.isActive && this.throwingOnRange(_loc2_) && this.§_-x§(_loc2_))
            {
               if(_loc1_ == null || this.§_-ET§(_loc1_,_loc2_))
               {
                  _loc1_ = _loc2_;
               }
            }
         }
         if(_loc1_ != null)
         {
            this.throwingTarget = _loc1_;
            return true;
         }
         return false;
      }
      
      public function §_-ET§(param1:Enemy, param2:Enemy) : Boolean
      {
         if(param1.road.length - param1.currentNode > param2.road.length - param2.currentNode)
         {
            return true;
         }
         return false;
      }
      
      private function throwingOnRange(param1:Enemy) : Boolean
      {
         var _loc2_:* = new Ellipse(this.x - this.throwingRangeWidth / 2,this.y - this.throwingRangeHeight / 2,this.throwingRangeWidth,this.throwingRangeHeight);
         return _loc2_.containsPoint(new Point(param1.x,param1.y));
      }
      
      private function §_-x§(param1:Enemy) : Boolean
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:Number = NaN;
         _loc3_ = param1.x - this.x;
         _loc4_ = param1.y - this.y;
         _loc2_ = Math.sqrt(_loc3_ * _loc3_ + _loc4_ * _loc4_);
         if(_loc2_ > this.throwingMinRange)
         {
            return true;
         }
         return false;
      }
      
      public function upgradeThrowingAxes(param1:int) : void
      {
         this.throwingLevel = param1;
         this.throwingReloadTime = this.cRoot.gameSettings.soldiers.barbarian.throwingCoolDown;
         this.throwingRangeWidth = this.cRoot.gameSettings.soldiers.barbarian.throwingRange + this.throwingLevel * this.cRoot.gameSettings.soldiers.barbarian.throwingIncrementRange;
         this.throwingRangeHeight = this.throwingRangeWidth * this.cRoot.gameSettings.rangeRatio;
         this.throwingMinRange = this.cRoot.gameSettings.soldiers.barbarian.throwingMinRange;
      }
      
      public function upgradeHuntingNettings(param1:int) : void
      {
         this.nettingsLevel = param1;
         this.§_-Jk§ = this.cRoot.gameSettings.soldiers.barbarian.huntingNetsCoolDown;
         this.§_-IB§ = this.cRoot.gameSettings.soldiers.barbarian.huntingNetsRange;
         this.§_-05§ = this.cRoot.gameSettings.soldiers.barbarian.huntingNetsRange * this.cRoot.gameSettings.rangeRatio;
      }
      
      public function upgradeDualWeapons(param1:int) : void
      {
         var _loc2_:* = this.§_-4P§;
         this.§_-4P§ = "2";
         this.attackChargeDamageTime = 14;
         this.dualWeaponsLevel = param1;
         this.minDamage = this.cRoot.gameSettings.soldiers.barbarian.minDamage + this.cRoot.gameSettings.soldiers.barbarian.dualWeaponsIncrementDamage * this.dualWeaponsLevel;
         this.maxDamage = this.cRoot.gameSettings.soldiers.barbarian.maxDamage + this.cRoot.gameSettings.soldiers.barbarian.dualWeaponsIncrementDamage * this.dualWeaponsLevel;
         if(_loc2_ == "")
         {
            this.§_-J9§();
         }
      }
      
      override protected function chargeAttack() : void
      {
         this.isCharging = true;
         this.gotoAndPlay("attack" + this.§_-4P§);
      }
      
      override protected function animationRun() : void
      {
         this.gotoAndPlay("running" + this.§_-4P§);
      }
      
      override protected function animationIdle() : void
      {
         this.gotoAndStop("idle" + this.§_-4P§);
      }
      
      override protected function evalRunningEnd() : void
      {
         if(this.§_-4P§ == "")
         {
            if(this.currentFrameLabel == "runningEnd")
            {
               this.gotoAndPlay("running");
            }
         }
         else if(this.currentFrameLabel == "running2End")
         {
            this.gotoAndPlay("running2");
         }
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame2() : *
      {
         stop();
      }
      
      function frame23() : *
      {
         stop();
      }
      
      function frame42() : *
      {
         stop();
      }
      
      function frame56() : *
      {
         stop();
      }
      
      function frame70() : *
      {
         stop();
      }
      
      function frame86() : *
      {
         stop();
      }
      
      function frame102() : *
      {
         stop();
      }
      
      function frame109() : *
      {
         stop();
      }
   }
}
