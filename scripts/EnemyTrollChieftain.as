package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.casalib.math.geom.Ellipse;
   
   public class EnemyTrollChieftain extends EnemyCommon
   {
       
      
      public var effect_Healing:MovieClip;
      
      public var effect_HolyStrike:MovieClip;
      
      public var effect_burn:MovieClip;
      
      public var effect_stun:MovieClip;
      
      public var debuff_Cursed:MovieClip;
      
      public var effect_TeslaHit:MovieClip;
      
      public var debuff_Poison:MovieClip;
      
      public var effect_Sniper:MovieClip;
      
      private var §_-Kw§:Boolean;
      
      private var rageCooldownTime:int = 120;
      
      private var rageCooldownTimeCounter:int;
      
      private var rageAnimationTime:int = 50;
      
      private var rageAnimationTimeCounter:int;
      
      private var rageAnimationOneTime:int = 7;
      
      private var rageAnimationSecondTime:int = 22;
      
      private var rageAnimationThirdTime:int = 38;
      
      private var rageRangeWidth:int;
      
      private var rageRangeHeight:int;
      
      private var rageMaxEnemies:int;
      
      public function EnemyTrollChieftain(param1:int, param2:Array)
      {
         addFrameScript(25,this.frame26,51,this.frame52,77,this.frame78,78,this.frame79,104,this.frame105,154,this.frame155,173,this.frame174,177,this.frame178,197,this.frame198,208,this.frame209);
         super(param1,param2);
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.isFlying = this.cRoot.gameSettings.enemies.trollChieftain.isFlying;
         this.level = 1;
         this.attackChargeTime = 26;
         this.size = this.cRoot.gameSettings.enemies.trollChieftain.size;
         this.health = this.initHealth = this.cRoot.gameSettings.enemies.trollChieftain.health;
         this.speed = this.cRoot.gameSettings.enemies.trollChieftain.speed;
         this.armor = this.cRoot.gameSettings.enemies.trollChieftain.armor;
         this.magicArmor = this.cRoot.gameSettings.enemies.trollChieftain.magicArmor;
         this.dodge = this.cRoot.gameSettings.enemies.trollChieftain.dodge;
         this.gold = this.cRoot.gameSettings.enemies.trollChieftain.gold;
         this.cost = this.cRoot.gameSettings.enemies.trollChieftain.cost;
         this.minDamage = this.cRoot.gameSettings.enemies.trollChieftain.minDamage;
         this.maxDamage = this.cRoot.gameSettings.enemies.trollChieftain.maxDamage;
         this.attackReloadTime = this.cRoot.gameSettings.enemies.trollChieftain.attackReloadTime - this.attackChargeTime;
         this.xSoldierAdjust = this.cRoot.gameSettings.enemies.trollChieftain.xSoldierAdjust;
         this.xAdjust = this.cRoot.gameSettings.enemies.trollChieftain.xAdjust;
         this.yAdjust = this.cRoot.gameSettings.enemies.trollChieftain.yAdjust;
         this.nodeMarginError = this.cRoot.gameSettings.enemies.trollChieftain.speed + 0.1;
         this.§_-Lq§ = true;
         this.§_-AD§ = 0;
         this.regenerateTime = this.cRoot.gameSettings.enemies.trollChieftain.regenerateTime;
         this.regenerateHealPoints = this.cRoot.gameSettings.enemies.trollChieftain.regenerateHealPoints;
         this.rageCooldownTime = this.cRoot.gameSettings.enemies.trollChieftain.rageCoolDown;
         this.rageRangeWidth = this.cRoot.gameSettings.enemies.trollChieftain.rageRange;
         this.rageRangeHeight = this.cRoot.gameSettings.enemies.trollChieftain.rageRange * this.cRoot.gameSettings.rangeRatio;
         this.rageMaxEnemies = this.cRoot.gameSettings.enemies.trollChieftain.rageMaxEnemies;
         this.§_-Jc§ = new §_-Ov§(new Point(0,-39),this.health,this.initHealth);
         this.addChild(§_-Jc§);
         this.§_-R2§ = "";
         this.getFacing();
         this.§_-NA§ = 25;
         this.§_-C-§ = 36;
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.tIconName = "trollchieftain";
         param1.eName = Locale.loadStringEx("ENEMY_TROLL_CHIEFTAIN_NAME",Locale.getDefaultLang());
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
            case "rageEnd":
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
         this.§_-Kw§ = false;
      }
      
      override public function block(param1:Soldier) : void
      {
         this.soldier = param1;
         this.isBlocked = true;
         this.§_-Kw§ = false;
         this.gotoAndStop("idle");
      }
      
      override public function specialPower() : Boolean
      {
         if(this.isBlocked)
         {
            this.rageCooldownTimeCounter = 0;
            return false;
         }
         if(!this.§_-Kw§)
         {
            if(this.rageCooldownTimeCounter < this.rageCooldownTime)
            {
               this.rageCooldownTimeCounter++;
               return false;
            }
            if(!this.§_-0b§())
            {
               return false;
            }
            this.§_-Kw§ = true;
            this.gotoAndPlay("rage");
            this.rageAnimationTimeCounter = 0;
            this.cRoot.game.gameSounds.enemyHealing();
            return true;
         }
         if(this.rageAnimationTimeCounter < this.rageAnimationTime)
         {
            this.rageAnimationTimeCounter++;
            if(this.rageAnimationTimeCounter == this.rageAnimationOneTime || this.rageAnimationTimeCounter == this.rageAnimationSecondTime || this.rageAnimationTimeCounter == this.rageAnimationThirdTime)
            {
               this.rageTargets();
               if(this.rageAnimationTimeCounter == this.rageAnimationOneTime)
               {
                  this.cRoot.game.gameSounds.trollRage();
               }
               if(this.rageAnimationTimeCounter == this.rageAnimationSecondTime)
               {
                  this.cRoot.game.gameSounds.trollRage();
               }
               if(this.rageAnimationTimeCounter == this.rageAnimationThirdTime)
               {
                  this.cRoot.game.gameSounds.trollRage();
               }
            }
            return true;
         }
         this.§_-Kw§ = false;
         this.rageCooldownTimeCounter = 0;
         this.§_-R2§ = "";
         if(!this.isBlocked)
         {
            this.getFacing();
         }
         return false;
      }
      
      private function §_-0b§() : Boolean
      {
         var _loc1_:Enemy = null;
         for each(_loc1_ in this.cRoot.enemies)
         {
            if(_loc1_.isActive && _loc1_.§_-KS§ && this.§_-Ft§(_loc1_) && this.rageOnRange(_loc1_))
            {
               return true;
            }
         }
         return false;
      }
      
      private function rageTargets() : void
      {
         var _loc2_:Enemy = null;
         var _loc1_:int = 0;
         for each(_loc2_ in this.cRoot.enemies)
         {
            if(_loc2_.isActive && _loc2_.§_-KS§ && this.§_-Ft§(_loc2_) && this.rageOnRange(_loc2_))
            {
               _loc2_.addDebuff(new DebuffRage(this.cRoot,1,_loc2_));
               _loc1_++;
               if(_loc1_ != this.rageMaxEnemies)
               {
                  continue;
               }
               break;
            }
         }
      }
      
      private function §_-Ft§(param1:Enemy) : Boolean
      {
         if(!param1.hasDebuff("DebuffRage") && !param1.hasDebuff("DebuffSlow"))
         {
            return true;
         }
         return false;
      }
      
      private function rageOnRange(param1:Enemy) : Boolean
      {
         var _loc2_:* = new Ellipse(this.x - this.rageRangeWidth / 2,this.y - this.rageRangeHeight / 2,this.rageRangeWidth,this.rageRangeHeight);
         return _loc2_.containsPoint(new Point(param1.x,param1.y));
      }
      
      override public function explode() : void
      {
         this.toGraveyard();
         this.setDeadBasicStatus();
         this.addBlood();
      }
      
      override public function desintegrate(param1:Boolean = true) : void
      {
         this.toGraveyard();
         this.setDeadBasicStatus();
         this.cRoot.entities.addChild(new EnemyDesintegrateBig(new Point(this.x,this.y),this.cRoot,param1));
         this.destroyThis();
      }
      
      override public function addPolymorph(param1:Enemy) : void
      {
         this.cRoot.entities.addChild(new EnemyPolymorphBig(new Point(this.x,this.y),this.cRoot,param1));
      }
      
      override public function playDeadSound() : void
      {
         this.cRoot.game.gameSounds.playEnemyBigDead();
      }
      
      function frame26() : *
      {
         gotoAndPlay("walking");
      }
      
      function frame52() : *
      {
         gotoAndPlay("walkingUp");
      }
      
      function frame78() : *
      {
         gotoAndPlay("walkingDown");
      }
      
      function frame79() : *
      {
         stop();
      }
      
      function frame105() : *
      {
         stop();
      }
      
      function frame155() : *
      {
         stop();
      }
      
      function frame174() : *
      {
         stop();
      }
      
      function frame178() : *
      {
         stop();
      }
      
      function frame198() : *
      {
         stop();
      }
      
      function frame209() : *
      {
         stop();
      }
   }
}
