package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.casalib.math.geom.Ellipse;
   
   public class EnemyTrollAxeThrower extends EnemyCommon
   {
       
      
      public var effect_Healing:MovieClip;
      
      public var effect_HolyStrike:MovieClip;
      
      public var effect_burn:MovieClip;
      
      public var effect_stun:MovieClip;
      
      public var debuff_rage:MovieClip;
      
      public var debuff_Cursed:MovieClip;
      
      public var effect_TeslaHit:MovieClip;
      
      public var debuff_Poison:MovieClip;
      
      public var effect_Sniper:MovieClip;
      
      private var §_-S0§:Point;
      
      private var axeTarget:Soldier;
      
      private var tmpAxeRotation:int;
      
      private var axeOnTarget:Boolean;
      
      private var §_-8b§:Boolean;
      
      private var axeRangeWidth:int;
      
      private var axeRangeHeight:int;
      
      private var axeMinRange:int;
      
      private var axeChargeTime:int = 15;
      
      private var axeChargeTimeCounter:int;
      
      private var axeReloadTime:int;
      
      private var axeReloadTimeCounter:int;
      
      public function EnemyTrollAxeThrower(param1:int, param2:Array)
      {
         this.§_-S0§ = new Point();
         addFrameScript(21,this.frame22,43,this.frame44,65,this.frame66,66,this.frame67,81,this.frame82,96,this.frame97,115,this.frame116,119,this.frame120,136,this.frame137,147,this.frame148);
         super(param1,param2);
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.axeOnTarget = false;
         this.level = 1;
         this.attackChargeTime = 15;
         this.isFlying = this.cRoot.gameSettings.enemies.trollAxeThrower.isFlying;
         this.size = this.cRoot.gameSettings.enemies.trollAxeThrower.size;
         this.health = this.initHealth = this.cRoot.gameSettings.enemies.trollAxeThrower.health;
         this.speed = this.cRoot.gameSettings.enemies.trollAxeThrower.speed;
         this.armor = this.cRoot.gameSettings.enemies.trollAxeThrower.armor;
         this.magicArmor = this.cRoot.gameSettings.enemies.trollAxeThrower.magicArmor;
         this.dodge = this.cRoot.gameSettings.enemies.trollAxeThrower.dodge;
         this.gold = this.cRoot.gameSettings.enemies.trollAxeThrower.gold;
         this.cost = this.cRoot.gameSettings.enemies.trollAxeThrower.cost;
         this.minDamage = this.cRoot.gameSettings.enemies.trollAxeThrower.minDamage;
         this.maxDamage = this.cRoot.gameSettings.enemies.trollAxeThrower.maxDamage;
         this.attackReloadTime = this.cRoot.gameSettings.enemies.trollAxeThrower.attackReloadTime - this.attackChargeTime;
         this.xSoldierAdjust = this.cRoot.gameSettings.enemies.trollAxeThrower.xSoldierAdjust;
         this.xAdjust = this.cRoot.gameSettings.enemies.trollAxeThrower.xAdjust;
         this.yAdjust = this.cRoot.gameSettings.enemies.trollAxeThrower.yAdjust;
         this.nodeMarginError = this.cRoot.gameSettings.enemies.trollAxeThrower.speed + 0.1;
         this.§_-KS§ = true;
         this.§_-Lq§ = true;
         this.§_-AD§ = 0;
         this.regenerateTime = this.cRoot.gameSettings.enemies.trollAxeThrower.regenerateTime;
         this.regenerateHealPoints = this.cRoot.gameSettings.enemies.trollAxeThrower.regenerateHealPoints;
         this.axeReloadTime = this.cRoot.gameSettings.enemies.trollAxeThrower.axeCoolDown;
         this.axeRangeWidth = this.cRoot.gameSettings.enemies.trollAxeThrower.axeRange + this.getRandom(-70,30);
         this.axeRangeHeight = this.axeRangeWidth * this.cRoot.gameSettings.rangeRatio;
         this.axeMinRange = this.cRoot.gameSettings.enemies.trollAxeThrower.axeMinRange;
         this.§_-Jc§ = new §_-H8§(new Point(0,-35),this.health,this.initHealth);
         this.addChild(§_-Jc§);
         this.§_-R2§ = "";
         this.getFacing();
         this.§_-NA§ = 24;
         this.§_-C-§ = 31;
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.tIconName = "trollaxethrower";
         param1.eName = Locale.loadStringEx("ENEMY_TROLL_AXE_THROWER_NAME",Locale.getDefaultLang());
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
            case "axeEnd":
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
         this.§_-8b§ = false;
         this.axeOnTarget = false;
      }
      
      override public function specialPower() : Boolean
      {
         var _loc1_:Point = null;
         var _loc2_:AxeEnemy = null;
         if(!this.§_-8b§)
         {
            if(this.isBlocked)
            {
               if(this.axeOnTarget)
               {
                  this.axeOnTarget = false;
               }
               return false;
            }
            if(this.axeReloadTimeCounter < this.axeReloadTime)
            {
               this.axeReloadTimeCounter++;
               return this.axeOnTarget;
            }
            if(!this.getAxeTarget())
            {
               if(this.axeOnTarget == true)
               {
                  this.§_-4Y§ = false;
                  this.§_-R2§ = "";
                  this.getFacing();
               }
               this.axeOnTarget = false;
               return false;
            }
            if(this.axeTarget.x >= this.x)
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
            this.§_-S0§ = new Point(this.axeTarget.x,this.axeTarget.y - 7);
            this.§_-8b§ = true;
            this.§_-4Y§ = true;
            this.axeOnTarget = true;
            this.axeChargeTimeCounter = 0;
            this.gotoAndPlay("axe");
            return true;
         }
         if(this.axeChargeTimeCounter < this.axeChargeTime)
         {
            this.axeChargeTimeCounter++;
            if(this.axeChargeTimeCounter == 7)
            {
               _loc1_ = null;
               if(this.axeTarget == null || !this.axeTarget.isActive)
               {
                  if(!this.getAxeTarget())
                  {
                     _loc1_ = this.§_-S0§;
                  }
               }
               _loc2_ = new AxeEnemy(new Point(this.x,this.y - 12),this.axeTarget,_loc1_,this.tmpAxeRotation);
               this.cRoot.bullets.addChild(_loc2_);
            }
            return true;
         }
         this.§_-8b§ = false;
         this.axeReloadTimeCounter = 0;
         return true;
      }
      
      private function getAxeTarget() : Boolean
      {
         var _loc1_:Soldier = null;
         this.axeTarget = null;
         for each(_loc1_ in this.cRoot.soldiers)
         {
            if(_loc1_.isActive && this.axeOnRange(_loc1_) && this.§_-x§(_loc1_))
            {
               this.axeTarget = _loc1_;
               break;
            }
         }
         if(this.axeTarget != null)
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
      
      private function axeOnRange(param1:Soldier) : Boolean
      {
         var _loc2_:* = new Ellipse(this.x - this.axeRangeWidth / 2,this.y - this.axeRangeHeight / 2,this.axeRangeWidth,this.axeRangeHeight);
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
         if(_loc2_ > this.axeMinRange)
         {
            return true;
         }
         return false;
      }
      
      override public function pause() : void
      {
         this.stop();
         if(MovieClip(this).debuff_Cursed != null)
         {
            MovieClip(this).debuff_Cursed.stop();
            MovieClip(this).debuff_Poison.stop();
            MovieClip(this).effect_TeslaHit.stop();
            MovieClip(this).effect_HolyStrike.stop();
            MovieClip(this).effect_Sniper.stop();
            MovieClip(this).effect_Healing.stop();
            MovieClip(this).debuff_rage.stop();
            MovieClip(this).effect_stun.stop();
            MovieClip(this).effect_burn.stop();
         }
      }
      
      override public function unPauseEffects() : void
      {
         if(MovieClip(this).debuff_Cursed != null)
         {
            if(MovieClip(this).debuff_Cursed.currentFrameLabel != "off")
            {
               MovieClip(this).debuff_Cursed.play();
            }
            else if(MovieClip(this).debuff_Cursed.currentFrameLabel == "onEnd")
            {
               MovieClip(this).debuff_Cursed.gotoAndPlay("on");
            }
            if(MovieClip(this).debuff_Poison.currentFrameLabel != "off")
            {
               MovieClip(this).debuff_Poison.play();
            }
            else if(MovieClip(this).debuff_Poison.currentFrameLabel == "onEnd")
            {
               MovieClip(this).debuff_Poison.gotoAndPlay("on");
            }
            if(MovieClip(this).effect_TeslaHit.currentFrameLabel != "off")
            {
               MovieClip(this).effect_TeslaHit.play();
            }
            if(MovieClip(this).effect_burn.currentFrameLabel != "off")
            {
               MovieClip(this).effect_burn.play();
            }
            if(MovieClip(this).effect_HolyStrike.currentFrameLabel != "off")
            {
               MovieClip(this).effect_HolyStrike.play();
            }
            if(MovieClip(this).effect_Sniper.currentFrameLabel != "off")
            {
               MovieClip(this).effect_Sniper.play();
            }
            if(MovieClip(this).effect_Healing.currentFrameLabel != "off")
            {
               MovieClip(this).effect_Healing.play();
            }
            if(MovieClip(this).debuff_rage.currentFrameLabel != "off")
            {
               MovieClip(this).debuff_rage.play();
            }
            else if(MovieClip(this).debuff_rage.currentFrameLabel == "onEnd")
            {
               MovieClip(this).debuff_rage.gotoAndPlay("on");
            }
            if(MovieClip(this).effect_stun.currentFrameLabel != "off")
            {
               MovieClip(this).effect_stun.play();
            }
            else if(MovieClip(this).effect_stun.currentFrameLabel == "onEnd")
            {
               MovieClip(this).effect_stun.gotoAndPlay("on");
            }
         }
      }
      
      override public function playDeadSound() : void
      {
         this.cRoot.game.gameSounds.playEnemyTrollDeadSound();
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
      
      function frame82() : *
      {
         stop();
      }
      
      function frame97() : *
      {
         stop();
      }
      
      function frame116() : *
      {
         stop();
      }
      
      function frame120() : *
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
