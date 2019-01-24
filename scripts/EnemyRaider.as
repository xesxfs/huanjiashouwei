package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.casalib.math.geom.Ellipse;
   
   public class EnemyRaider extends EnemyCommon
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
      
      private var §_-Qn§:Boolean;
      
      private var bombRangeWidth:int;
      
      private var bombRangeHeight:int;
      
      private var bombMinRange:int;
      
      private var bombChargeTime:int = 23;
      
      private var bombChargeTimeCounter:int;
      
      private var bombReloadTime:int;
      
      private var bombReloadTimeCounter:int;
      
      public function EnemyRaider(param1:int, param2:Array)
      {
         this.§_-S0§ = new Point();
         addFrameScript(21,this.frame22,43,this.frame44,65,this.frame66,66,this.frame67,85,this.frame86,108,this.frame109,126,this.frame127,131,this.frame132,149,this.frame150,160,this.frame161);
         super(param1,param2);
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.isFlying = this.cRoot.gameSettings.enemies.raider.isFlying;
         this.level = 1;
         this.attackChargeTime = 19;
         this.size = this.cRoot.gameSettings.enemies.raider.size;
         this.health = this.initHealth = this.cRoot.gameSettings.enemies.raider.health;
         this.speed = this.cRoot.gameSettings.enemies.raider.speed;
         this.armor = this.cRoot.gameSettings.enemies.raider.armor;
         this.dodge = this.cRoot.gameSettings.enemies.raider.dodge;
         this.gold = this.cRoot.gameSettings.enemies.raider.gold;
         this.cost = this.cRoot.gameSettings.enemies.raider.cost;
         this.minDamage = this.cRoot.gameSettings.enemies.raider.minDamage;
         this.maxDamage = this.cRoot.gameSettings.enemies.raider.maxDamage;
         this.attackReloadTime = this.cRoot.gameSettings.enemies.raider.attackReloadTime;
         this.xSoldierAdjust = this.cRoot.gameSettings.enemies.raider.xSoldierAdjust;
         this.xAdjust = this.cRoot.gameSettings.enemies.raider.xAdjust;
         this.yAdjust = this.cRoot.gameSettings.enemies.raider.yAdjust;
         this.nodeMarginError = this.cRoot.gameSettings.enemies.raider.speed + 0.1;
         this.bombChargeTime = 23;
         this.bombReloadTime = this.cRoot.gameSettings.enemies.raider.bombCoolDown;
         this.bombRangeWidth = this.cRoot.gameSettings.enemies.raider.bombRange + this.getRandom(-70,30);
         this.bombRangeHeight = this.bombRangeWidth * this.cRoot.gameSettings.rangeRatio;
         this.bombMinRange = this.cRoot.gameSettings.enemies.raider.bombMinRange;
         this.§_-Jc§ = new §_-Ov§(new Point(0,-40),this.health,this.initHealth);
         this.addChild(§_-Jc§);
         this.§_-R2§ = "";
         this.getFacing();
         this.§_-NA§ = 68;
         this.§_-C-§ = 52;
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.tIconName = "raider";
         param1.eName = Locale.loadStringEx("ENEMY_RAIDER_NAME",Locale.getDefaultLang());
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
            case "rangeEnd":
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
         this.isBlocked = false;
         this.§_-Qn§ = false;
      }
      
      override public function specialPower() : Boolean
      {
         if(!this.§_-Qn§)
         {
            if(this.isBlocked)
            {
               return false;
            }
            if(this.bombReloadTimeCounter < this.bombReloadTime)
            {
               this.bombReloadTimeCounter++;
               return false;
            }
            if(!this.getBombTarget())
            {
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
            this.bombChargeTimeCounter = 0;
            this.gotoAndPlay("range");
            return true;
         }
         if(this.bombChargeTimeCounter < this.bombChargeTime)
         {
            this.bombChargeTimeCounter++;
            if(this.bombChargeTimeCounter == 15)
            {
               this.cRoot.bullets.addChild(new §_-D8§(new Point(this.x,this.y - 18),this.bombTarget,this.§_-S0§,1));
            }
            return true;
         }
         this.§_-Qn§ = false;
         this.bombReloadTimeCounter = 0;
         this.§_-R2§ = "";
         if(!this.isBlocked)
         {
            this.getFacing();
         }
         return false;
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
      
      function frame86() : *
      {
         stop();
      }
      
      function frame109() : *
      {
         stop();
      }
      
      function frame127() : *
      {
         stop();
      }
      
      function frame132() : *
      {
         stop();
      }
      
      function frame150() : *
      {
         stop();
      }
      
      function frame161() : *
      {
         stop();
      }
   }
}
