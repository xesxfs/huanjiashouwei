package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.casalib.math.geom.Ellipse;
   
   public class EnemyDemonMage extends EnemyCommon
   {
       
      
      public var effect_Healing:MovieClip;
      
      public var effect_HolyStrike:MovieClip;
      
      public var effect_burn:MovieClip;
      
      public var effect_stun:MovieClip;
      
      public var debuff_Cursed:MovieClip;
      
      public var effect_TeslaHit:MovieClip;
      
      public var debuff_Poison:MovieClip;
      
      public var effect_Sniper:MovieClip;
      
      private var §_-O1§:Boolean;
      
      private var shieldCooldownTime:int;
      
      private var shieldCooldownTimeCounter:int;
      
      private var shieldAnimationTime:int = 24;
      
      private var shieldAnimationTimeFire:int = 15;
      
      private var shieldAnimationTimeCounter:int;
      
      private var shieldRangeWidth:int;
      
      private var shieldRangeHeight:int;
      
      private var shieldMaxEnemies:int;
      
      private var §_-5J§:int = 5;
      
      private var §_-3h§:int;
      
      private var §_-LM§:int;
      
      private var explodeMinDamage:int;
      
      private var explodeMaxDamage:int;
      
      public function EnemyDemonMage(param1:int, param2:Array, param3:int = 0, param4:Point = null, param5:Boolean = false)
      {
         addFrameScript(21,this.frame22,43,this.frame44,65,this.frame66,66,this.frame67,85,this.frame86,110,this.frame111,129,this.frame130,134,this.frame135,147,this.frame148,158,this.frame159);
         super(param1,param2);
         param5 = true;
         if(param4 == null)
         {
            param4 = param2[0];
            param3 = 0;
         }
         if(param4 != null)
         {
            this.§_-6c§ = param5;
            this.§_-9I§(param3 + 2);
            this.x = param4.x;
            this.y = param4.y;
         }
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.isFlying = this.cRoot.gameSettings.enemies.demonMage.isFlying;
         this.level = 1;
         this.attackChargeTime = 18;
         this.size = this.cRoot.gameSettings.enemies.demonMage.size;
         this.health = this.initHealth = this.cRoot.gameSettings.enemies.demonMage.health;
         this.speed = this.cRoot.gameSettings.enemies.demonMage.speed;
         this.armor = this.cRoot.gameSettings.enemies.demonMage.armor;
         this.magicArmor = this.cRoot.gameSettings.enemies.demonMage.magicArmor;
         this.dodge = this.cRoot.gameSettings.enemies.demonMage.dodge;
         this.gold = this.cRoot.gameSettings.enemies.demonMage.gold;
         this.cost = this.cRoot.gameSettings.enemies.demonMage.cost;
         this.minDamage = this.cRoot.gameSettings.enemies.demonMage.minDamage;
         this.maxDamage = this.cRoot.gameSettings.enemies.demonMage.maxDamage;
         this.attackReloadTime = this.cRoot.gameSettings.enemies.demonMage.attackReloadTime - this.attackChargeTime;
         this.xSoldierAdjust = this.cRoot.gameSettings.enemies.demonMage.xSoldierAdjust;
         this.xAdjust = this.cRoot.gameSettings.enemies.demonMage.xAdjust;
         this.yAdjust = this.cRoot.gameSettings.enemies.demonMage.yAdjust;
         this.nodeMarginError = this.cRoot.gameSettings.enemies.demonMage.speed + 0.1;
         this.shieldCooldownTime = this.cRoot.gameSettings.enemies.demonMage.shieldCoolDown;
         this.shieldRangeWidth = this.cRoot.gameSettings.enemies.demonMage.shieldRange;
         this.shieldRangeHeight = this.cRoot.gameSettings.enemies.demonMage.shieldRange * this.cRoot.gameSettings.rangeRatio;
         this.shieldMaxEnemies = this.cRoot.gameSettings.enemies.demonMage.shieldMaxEnemies;
         this.§_-3h§ = this.cRoot.gameSettings.enemies.demonMage.exploteRange;
         this.§_-LM§ = this.cRoot.gameSettings.enemies.demonMage.exploteRange * this.cRoot.gameSettings.rangeRatio;
         this.explodeMinDamage = this.cRoot.gameSettings.enemies.demonMage.exploteMinDamage;
         this.explodeMaxDamage = this.cRoot.gameSettings.enemies.demonMage.exploteMaxDamage;
         this.§_-Jc§ = new §_-Ov§(new Point(0,-39),this.health,this.initHealth);
         this.addChild(§_-Jc§);
         this.§_-R2§ = "";
         if(!this.§_-6c§)
         {
            this.getFacing();
         }
         else
         {
            this.§_-Jc§.hide();
            this.isActive = false;
            this.§_-An§ = true;
            this.teleportingTimeCounter = 0;
            this.gotoAndPlay("teleport");
            this.cRoot.game.gameSounds.playVeznanPortalTeleportIn();
         }
         this.§_-NA§ = 20;
         this.§_-C-§ = 37;
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.tIconName = "demonmage";
         param1.eName = Locale.loadStringEx("ENEMY_DEMON_MAGE_NAME",Locale.getDefaultLang());
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
            case "shieldEnd":
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
               this.demonExplodeAttack();
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
         else
         {
            this.walk();
         }
      }
      
      private function demonExplodeAttack() : void
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
      
      override protected function stopSpecialPower() : void
      {
         this.§_-O1§ = false;
      }
      
      override public function block(param1:Soldier) : void
      {
         this.soldier = param1;
         this.isBlocked = true;
         if(!this.§_-O1§)
         {
            this.gotoAndStop("idle");
         }
      }
      
      override public function startFighting() : void
      {
         this.isFighting = true;
         if(!this.§_-O1§)
         {
            this.§_-R2§ = "";
            this.y = this.y + 0.1;
            this.chargeAttack();
         }
      }
      
      override public function specialPower() : Boolean
      {
         if(!this.§_-O1§)
         {
            if(this.shieldCooldownTimeCounter < this.shieldCooldownTime)
            {
               this.shieldCooldownTimeCounter++;
               return false;
            }
            if(!this.§_-3b§())
            {
               return false;
            }
            this.§_-O1§ = true;
            this.gotoAndPlay("shield");
            this.shieldAnimationTimeCounter = 0;
            this.cRoot.game.gameSounds.enemyHealing();
            return true;
         }
         if(this.shieldAnimationTimeCounter < this.shieldAnimationTime)
         {
            this.shieldAnimationTimeCounter++;
            if(this.shieldAnimationTimeCounter == this.shieldAnimationTimeFire)
            {
               this.shieldTargets();
            }
            return true;
         }
         this.§_-O1§ = false;
         this.shieldCooldownTimeCounter = 0;
         this.attackChargeTimeCounter = 0;
         this.§_-R2§ = "";
         if(!this.isBlocked)
         {
            this.getFacing();
         }
         return false;
      }
      
      private function §_-3b§() : Boolean
      {
         var _loc1_:Enemy = null;
         for each(_loc1_ in this.cRoot.enemies)
         {
            if(_loc1_.isActive && _loc1_.§_-06§ && this.§_-1u§(_loc1_) && this.shieldOnRange(_loc1_))
            {
               return true;
            }
         }
         return false;
      }
      
      private function shieldTargets() : void
      {
         var _loc2_:Enemy = null;
         var _loc1_:int = 0;
         for each(_loc2_ in this.cRoot.enemies)
         {
            if(_loc2_.isActive && _loc2_.§_-06§ && this.§_-1u§(_loc2_) && this.shieldOnRange(_loc2_))
            {
               MovieClip(_loc2_).shieldMe();
               _loc1_++;
               if(_loc1_ != this.shieldMaxEnemies)
               {
                  continue;
               }
               break;
            }
         }
      }
      
      private function §_-1u§(param1:Enemy) : Boolean
      {
         if(!MovieClip(param1).hasShield())
         {
            return true;
         }
         return false;
      }
      
      private function shieldOnRange(param1:Enemy) : Boolean
      {
         var _loc2_:* = new Ellipse(this.x - this.shieldRangeWidth / 2,this.y - this.shieldRangeHeight / 2,this.shieldRangeWidth,this.shieldRangeHeight);
         return _loc2_.containsPoint(new Point(param1.x,param1.y));
      }
      
      override public function explode() : void
      {
         this.toGraveyard();
         this.setDeadBasicStatus(true);
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
         this.cRoot.game.gameSounds.playEnemyPuffDeadHighest();
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
      
      function frame111() : *
      {
         stop();
      }
      
      function frame130() : *
      {
         stop();
      }
      
      function frame135() : *
      {
         stop();
      }
      
      function frame148() : *
      {
         stop();
      }
      
      function frame159() : *
      {
         stop();
      }
   }
}
