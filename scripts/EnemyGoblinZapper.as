package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.casalib.math.geom.Ellipse;
   
   public class EnemyGoblinZapper extends EnemyCommon
   {
       
      
      public var effect_Healing:MovieClip;
      
      public var effect_HolyStrike:MovieClip;
      
      public var effect_burn:MovieClip;
      
      public var effect_stun:MovieClip;
      
      public var debuff_Cursed:MovieClip;
      
      public var effect_TeslaHit:MovieClip;
      
      public var debuff_Poison:MovieClip;
      
      public var effect_Sniper:MovieClip;
      
      private var §_-S0§:Point;
      
      private var bombTarget:Soldier;
      
      private var bombOnTarget:Boolean;
      
      private var §_-Qn§:Boolean;
      
      private var bombRangeWidth:int;
      
      private var bombRangeHeight:int;
      
      private var bombMinRange:int;
      
      private var bombChargeTime:int = 12;
      
      private var bombChargeTimeCounter:int;
      
      private var bombReloadTime:int;
      
      private var bombReloadTimeCounter:int;
      
      private var §_-5J§:int = 5;
      
      private var §_-3h§:int;
      
      private var §_-LM§:int;
      
      private var explodeMinDamage:int;
      
      private var explodeMaxDamage:int;
      
      public function EnemyGoblinZapper(param1:int, param2:Array)
      {
         this.§_-S0§ = new Point();
         addFrameScript(21,this.frame22,43,this.frame44,65,this.frame66,66,this.frame67,80,this.frame81,95,this.frame96,114,this.frame115,118,this.frame119,136,this.frame137,147,this.frame148);
         super(param1,param2);
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.bombOnTarget = false;
         this.level = 1;
         this.attackChargeTime = 7;
         this.isFlying = this.cRoot.gameSettings.enemies.goblinZapper.isFlying;
         this.size = this.cRoot.gameSettings.enemies.goblinZapper.size;
         this.health = this.initHealth = this.cRoot.gameSettings.enemies.goblinZapper.health;
         this.speed = this.cRoot.gameSettings.enemies.goblinZapper.speed;
         this.armor = this.cRoot.gameSettings.enemies.goblinZapper.armor;
         this.magicArmor = this.cRoot.gameSettings.enemies.goblinZapper.magicArmor;
         this.dodge = this.cRoot.gameSettings.enemies.goblinZapper.dodge;
         this.gold = this.cRoot.gameSettings.enemies.goblinZapper.gold;
         this.cost = this.cRoot.gameSettings.enemies.goblinZapper.cost;
         this.minDamage = this.cRoot.gameSettings.enemies.goblinZapper.minDamage;
         this.maxDamage = this.cRoot.gameSettings.enemies.goblinZapper.maxDamage;
         this.attackReloadTime = this.cRoot.gameSettings.enemies.goblinZapper.attackReloadTime - this.attackChargeTime;
         this.xSoldierAdjust = this.cRoot.gameSettings.enemies.goblinZapper.xSoldierAdjust;
         this.xAdjust = this.cRoot.gameSettings.enemies.goblinZapper.xAdjust;
         this.yAdjust = this.cRoot.gameSettings.enemies.goblinZapper.yAdjust;
         this.nodeMarginError = this.cRoot.gameSettings.enemies.goblinZapper.speed + 0.1;
         this.bombReloadTime = this.cRoot.gameSettings.enemies.goblinZapper.bombCoolDown;
         this.bombRangeWidth = this.cRoot.gameSettings.enemies.goblinZapper.bombRange + this.getRandom(-70,30);
         this.bombRangeHeight = this.bombRangeWidth * this.cRoot.gameSettings.rangeRatio;
         this.bombMinRange = this.cRoot.gameSettings.enemies.goblinZapper.bombMinRange;
         this.§_-3h§ = this.cRoot.gameSettings.enemies.goblinZapper.exploteRange;
         this.§_-LM§ = this.cRoot.gameSettings.enemies.goblinZapper.exploteRange * this.cRoot.gameSettings.rangeRatio;
         this.explodeMinDamage = this.cRoot.gameSettings.enemies.goblinZapper.exploteMinDamage;
         this.explodeMaxDamage = this.cRoot.gameSettings.enemies.goblinZapper.exploteMaxDamage;
         this.§_-Jc§ = new §_-H8§(new Point(0,-26),this.health,this.initHealth);
         this.addChild(§_-Jc§);
         this.§_-R2§ = "";
         this.getFacing();
         this.§_-NA§ = 19;
         this.§_-C-§ = 36;
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.tIconName = "goblinzapper";
         param1.eName = Locale.loadStringEx("ENEMY_GOBLIN_ZAPPER_NAME",Locale.getDefaultLang());
      }
      
      override public function unPause() : void
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
            case "throwingEnd":
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
      
      override public function onFrameUpdate() : void
      {
         if(this.isDead)
         {
            if(this.deadTimeCounter == 0)
            {
               this.gotoAndPlay("dead");
            }
            this.deadTimeCounter++;
            if(this.deadTimeCounter == this.§_-5J§)
            {
               this.§_-6U§();
            }
            if(this.deadTimeCounter >= this.deadTime)
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
         this.walk();
      }
      
      override protected function stopSpecialPower() : void
      {
         this.isBlocked = false;
         this.bombOnTarget = false;
      }
      
      override public function specialPower() : Boolean
      {
         if(!this.§_-Qn§)
         {
            if(this.isBlocked)
            {
               if(this.bombOnTarget)
               {
                  this.bombOnTarget = false;
               }
               return false;
            }
            if(this.bombReloadTimeCounter < this.bombReloadTime)
            {
               this.bombReloadTimeCounter++;
               return this.bombOnTarget;
            }
            if(!this.getBombTarget())
            {
               if(this.bombOnTarget == true)
               {
                  this.§_-4Y§ = false;
                  this.§_-R2§ = "";
                  this.getFacing();
               }
               this.bombOnTarget = false;
               return false;
            }
            if(this.bombTarget.x >= this.x)
            {
               this.scaleX = 1;
               this.§_-Jc§.flip(1);
            }
            else
            {
               this.scaleX = -1;
               this.§_-Jc§.flip(-1);
            }
            this.§_-S0§ = new Point(this.bombTarget.x,this.bombTarget.y);
            this.§_-Qn§ = true;
            this.§_-4Y§ = true;
            this.bombOnTarget = true;
            this.bombChargeTimeCounter = 0;
            this.gotoAndPlay("throwing");
            return true;
         }
         if(this.bombChargeTimeCounter < this.bombChargeTime)
         {
            this.bombChargeTimeCounter++;
            if(this.bombChargeTimeCounter == 7)
            {
               this.cRoot.bullets.addChild(new BombZapper(new Point(this.x + 4,this.y - 12.5),this.§_-S0§));
            }
            return true;
         }
         this.§_-Qn§ = false;
         this.bombReloadTimeCounter = 0;
         return true;
      }
      
      private function getBombTarget() : Boolean
      {
         var _loc1_:Soldier = null;
         this.bombTarget = null;
         for each(_loc1_ in this.cRoot.soldiers)
         {
            if(_loc1_.isActive && this.bombOnRange(_loc1_) && this.§_-x§(_loc1_))
            {
               this.bombTarget = _loc1_;
               break;
            }
         }
         if(this.bombTarget != null)
         {
            return true;
         }
         return false;
      }
      
      private function getRandom(param1:*, param2:*) : Number
      {
         var _loc3_:Number = NaN;
         _loc3_ = Math.round(Math.random() * (param2 - param1)) + param1;
         return _loc3_;
      }
      
      private function bombOnRange(param1:Soldier) : Boolean
      {
         var _loc2_:* = new Ellipse(this.x - this.bombRangeWidth / 2,this.y - this.bombRangeHeight / 2,this.bombRangeWidth,this.bombRangeHeight);
         return _loc2_.containsPoint(new Point(param1.x,param1.y));
      }
      
      private function §_-x§(param1:Soldier) : Boolean
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:Number = NaN;
         _loc3_ = param1.x - this.x;
         _loc4_ = param1.y - this.y;
         _loc2_ = Math.sqrt(_loc3_ * _loc3_ + _loc4_ * _loc4_);
         if(_loc2_ > this.bombMinRange)
         {
            return true;
         }
         return false;
      }
      
      private function §_-6U§() : void
      {
         var _loc1_:Soldier = null;
         for each(_loc1_ in this.cRoot.soldiers)
         {
            if(_loc1_.isActive && this.onRangeExplode(_loc1_))
            {
               _loc1_.setDamage(this.getDamageExplode(),false);
            }
         }
      }
      
      private function onRangeExplode(param1:Soldier) : Boolean
      {
         var _loc2_:* = new Ellipse(this.x - this.§_-3h§ / 2,this.y - this.§_-LM§ / 2,this.§_-3h§,this.§_-LM§);
         return _loc2_.containsPoint(new Point(param1.x,param1.y));
      }
      
      protected function getDamageExplode() : int
      {
         return this.explodeMinDamage + Math.ceil(Math.random() * (this.explodeMaxDamage - this.explodeMinDamage));
      }
      
      override public function playDeadSound() : void
      {
         this.cRoot.game.gameSounds.playEnemyGoblinDeadSound();
      }
      
      override public function explode() : void
      {
         this.toGraveyard();
         this.setDeadBasicStatus(true);
         this.addBlood();
      }
      
      override public function addBlood() : void
      {
      }
      
      function frame22() : *
      {
         gotoAndPlay("walking");
      }
      
      function frame44() : *
      {
         gotoAndPlay("walkingUp");
      }
      
      function frame66() : *
      {
         gotoAndPlay("walkingDown");
      }
      
      function frame67() : *
      {
         stop();
      }
      
      function frame81() : *
      {
         stop();
      }
      
      function frame96() : *
      {
         stop();
      }
      
      function frame115() : *
      {
         stop();
      }
      
      function frame119() : *
      {
         stop();
      }
      
      function frame137() : *
      {
         stop();
      }
      
      function frame148() : *
      {
         stop();
      }
   }
}
