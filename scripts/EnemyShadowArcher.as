package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.casalib.math.geom.Ellipse;
   
   public class EnemyShadowArcher extends EnemyCommon
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
      
      private var arrowTarget:Soldier;
      
      private var arrowOnTarget:Boolean;
      
      private var § else§:Boolean;
      
      private var arrowRangeWidth:int;
      
      private var arrowRangeHeight:int;
      
      private var arrowMinRange:int;
      
      private var arrowChargeTime:int = 12;
      
      private var arrowChargeTimeCounter:int;
      
      private var arrowReloadTime:int;
      
      private var arrowReloadTimeCounter:int;
      
      public function EnemyShadowArcher(param1:int, param2:Array)
      {
         this.§_-S0§ = new Point();
         addFrameScript(21,this.frame22,43,this.frame44,65,this.frame66,66,this.frame67,73,this.frame74,87,this.frame88,106,this.frame107,110,this.frame111,117,this.frame118,128,this.frame129);
         super(param1,param2);
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.arrowOnTarget = false;
         this.level = 1;
         this.attackChargeTime = 7;
         this.isFlying = this.cRoot.gameSettings.enemies.shadowArcher.isFlying;
         this.size = this.cRoot.gameSettings.enemies.shadowArcher.size;
         this.health = this.initHealth = this.cRoot.gameSettings.enemies.shadowArcher.health;
         this.speed = this.cRoot.gameSettings.enemies.shadowArcher.speed;
         this.armor = this.cRoot.gameSettings.enemies.shadowArcher.armor;
         this.magicArmor = this.cRoot.gameSettings.enemies.shadowArcher.magicArmor;
         this.dodge = this.cRoot.gameSettings.enemies.shadowArcher.dodge;
         this.gold = this.cRoot.gameSettings.enemies.shadowArcher.gold;
         this.cost = this.cRoot.gameSettings.enemies.shadowArcher.cost;
         this.minDamage = this.cRoot.gameSettings.enemies.shadowArcher.minDamage;
         this.maxDamage = this.cRoot.gameSettings.enemies.shadowArcher.maxDamage;
         this.attackReloadTime = this.cRoot.gameSettings.enemies.shadowArcher.attackReloadTime - this.attackChargeTime;
         this.xSoldierAdjust = this.cRoot.gameSettings.enemies.shadowArcher.xSoldierAdjust;
         this.xAdjust = this.cRoot.gameSettings.enemies.shadowArcher.xAdjust;
         this.yAdjust = this.cRoot.gameSettings.enemies.shadowArcher.yAdjust;
         this.nodeMarginError = this.cRoot.gameSettings.enemies.shadowArcher.speed + 0.1;
         this.arrowReloadTime = this.cRoot.gameSettings.enemies.shadowArcher.arrowCoolDown;
         this.arrowRangeWidth = this.cRoot.gameSettings.enemies.shadowArcher.arrowRange + this.getRandom(-70,30);
         this.arrowRangeHeight = this.arrowRangeWidth * this.cRoot.gameSettings.rangeRatio;
         this.arrowMinRange = this.cRoot.gameSettings.enemies.shadowArcher.arrowMinRange;
         this.§_-Jc§ = new §_-H8§(new Point(0,-25),this.health,this.initHealth);
         this.addChild(§_-Jc§);
         this.§_-R2§ = "";
         this.getFacing();
         this.§_-NA§ = 22;
         this.§_-C-§ = 22;
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.tIconName = "shadowarcher";
         param1.eName = Locale.loadStringEx("ENEMY_SHADOW_ARCHER_NAME",Locale.getDefaultLang());
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
            case "arrowEnd":
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
      
      override protected function stopSpecialPower() : void
      {
         this.§ else§ = false;
         this.arrowOnTarget = false;
      }
      
      override public function specialPower() : Boolean
      {
         var _loc1_:Point = null;
         var _loc2_:ArrowEnemy = null;
         if(!this.§ else§)
         {
            if(this.isBlocked)
            {
               if(this.arrowOnTarget)
               {
                  this.arrowOnTarget = false;
               }
               return false;
            }
            if(this.arrowReloadTimeCounter < this.arrowReloadTime)
            {
               this.arrowReloadTimeCounter++;
               return this.arrowOnTarget;
            }
            if(!this.getArrowTarget())
            {
               if(this.arrowOnTarget == true)
               {
                  this.§_-4Y§ = false;
                  this.§_-R2§ = "";
                  this.getFacing();
               }
               this.arrowOnTarget = false;
               return false;
            }
            if(this.arrowTarget.x >= this.x)
            {
               this.scaleX = 1;
               this.§_-Jc§.flip(1);
            }
            else
            {
               this.scaleX = -1;
               this.§_-Jc§.flip(-1);
            }
            this.§_-S0§ = new Point(this.arrowTarget.x,this.arrowTarget.y - 7);
            this.§ else§ = true;
            this.§_-4Y§ = true;
            this.arrowOnTarget = true;
            this.arrowChargeTimeCounter = 0;
            this.gotoAndPlay("arrow");
            return true;
         }
         if(this.arrowChargeTimeCounter < this.arrowChargeTime)
         {
            this.arrowChargeTimeCounter++;
            if(this.arrowChargeTimeCounter == 7)
            {
               _loc1_ = null;
               if(this.arrowTarget == null || !this.arrowTarget.isActive)
               {
                  if(!this.getArrowTarget())
                  {
                     _loc1_ = this.§_-S0§;
                  }
               }
               _loc2_ = new ArrowEnemy(this.arrowTarget,_loc1_);
               _loc2_.x = this.x + 4;
               _loc2_.y = this.y - 12.5;
               this.cRoot.bullets.addChild(_loc2_);
            }
            return true;
         }
         this.§ else§ = false;
         this.arrowReloadTimeCounter = 0;
         return true;
      }
      
      private function getArrowTarget() : Boolean
      {
         var _loc1_:Soldier = null;
         this.arrowTarget = null;
         for each(_loc1_ in this.cRoot.soldiers)
         {
            if(_loc1_.isActive && this.arrowOnRange(_loc1_) && this.§_-x§(_loc1_))
            {
               this.arrowTarget = _loc1_;
               break;
            }
         }
         if(this.arrowTarget != null)
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
      
      private function arrowOnRange(param1:Soldier) : Boolean
      {
         var _loc2_:* = new Ellipse(this.x - this.arrowRangeWidth / 2,this.y - this.arrowRangeHeight / 2,this.arrowRangeWidth,this.arrowRangeHeight);
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
         if(_loc2_ > this.arrowMinRange)
         {
            return true;
         }
         return false;
      }
      
      override public function playDeadSound() : void
      {
         this.cRoot.game.gameSounds.playEnemyHumanDeadSound();
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
      
      function frame74() : *
      {
         stop();
      }
      
      function frame88() : *
      {
         stop();
      }
      
      function frame107() : *
      {
         stop();
      }
      
      function frame111() : *
      {
         stop();
      }
      
      function frame118() : *
      {
         stop();
      }
      
      function frame129() : *
      {
         stop();
      }
   }
}
