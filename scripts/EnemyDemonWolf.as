package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.casalib.math.geom.Ellipse;
   
   public class EnemyDemonWolf extends EnemyCommon
   {
       
      
      public var effect_Healing:MovieClip;
      
      public var effect_HolyStrike:MovieClip;
      
      public var effect_burn:MovieClip;
      
      public var effect_stun:MovieClip;
      
      public var debuff_shield:MovieClip;
      
      public var debuff_Cursed:MovieClip;
      
      public var effect_TeslaHit:MovieClip;
      
      public var debuff_Poison:MovieClip;
      
      public var effect_Sniper:MovieClip;
      
      private var §_-O1§:Boolean;
      
      private var shieldIgnoreHits:int;
      
      private var §_-5J§:int = 5;
      
      private var §_-3h§:int;
      
      private var §_-LM§:int;
      
      private var explodeMinDamage:int;
      
      private var explodeMaxDamage:int;
      
      public function EnemyDemonWolf(param1:int, param2:Array, param3:int = 0, param4:Point = null, param5:Boolean = false)
      {
         addFrameScript(9,this.frame10,19,this.frame20,29,this.frame30,30,this.frame31,44,this.frame45,63,this.frame64,67,this.frame68,80,this.frame81,91,this.frame92);
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
         this.isFlying = this.cRoot.gameSettings.enemies.demonWolf.isFlying;
         this.level = 1;
         this.attackChargeTime = 13;
         this.canSkeleton = false;
         this.§_-06§ = true;
         this.§_-O1§ = false;
         this.size = this.cRoot.gameSettings.enemies.demonWolf.size;
         this.health = this.initHealth = this.cRoot.gameSettings.enemies.demonWolf.health;
         this.speed = this.cRoot.gameSettings.enemies.demonWolf.speed;
         this.armor = this.cRoot.gameSettings.enemies.demonWolf.armor;
         this.magicArmor = this.cRoot.gameSettings.enemies.demonWolf.magicArmor;
         this.dodge = this.cRoot.gameSettings.enemies.demonWolf.dodge;
         this.gold = this.cRoot.gameSettings.enemies.demonWolf.gold;
         this.cost = this.cRoot.gameSettings.enemies.demonWolf.cost;
         this.minDamage = this.cRoot.gameSettings.enemies.demonWolf.minDamage;
         this.maxDamage = this.cRoot.gameSettings.enemies.demonWolf.maxDamage;
         this.attackReloadTime = this.cRoot.gameSettings.enemies.demonWolf.attackReloadTime - this.attackChargeTime;
         this.xSoldierAdjust = this.cRoot.gameSettings.enemies.demonWolf.xSoldierAdjust;
         this.xAdjust = this.cRoot.gameSettings.enemies.demonWolf.xAdjust;
         this.yAdjust = this.cRoot.gameSettings.enemies.demonWolf.yAdjust;
         this.nodeMarginError = this.cRoot.gameSettings.enemies.demonWolf.speed + 0.1;
         this.§_-3h§ = this.cRoot.gameSettings.enemies.demonWolf.exploteRange;
         this.§_-LM§ = this.cRoot.gameSettings.enemies.demonWolf.exploteRange * this.cRoot.gameSettings.rangeRatio;
         this.explodeMinDamage = this.cRoot.gameSettings.enemies.demonWolf.exploteMinDamage;
         this.explodeMaxDamage = this.cRoot.gameSettings.enemies.demonWolf.exploteMaxDamage;
         this.§_-Jc§ = new §_-H8§(new Point(0,-23),this.health,this.initHealth);
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
         this.§_-NA§ = 23;
         this.§_-C-§ = 25;
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.tIconName = "demonwolf";
         param1.eName = Locale.loadStringEx("ENEMY_DEMON_WOLF_NAME",Locale.getDefaultLang());
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
            MovieClip(this).debuff_shield.stop();
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
            if(MovieClip(this).debuff_shield.currentFrameLabel != "off")
            {
               MovieClip(this).debuff_shield.play();
            }
            else if(MovieClip(this).debuff_shield.currentFrameLabel == "onEnd")
            {
               MovieClip(this).debuff_shield.gotoAndPlay("on");
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
               this.demonWolfExplodeAttack();
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
      
      private function demonWolfExplodeAttack() : void
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
      
      public function shieldMe() : void
      {
         this.§_-O1§ = true;
         this.shieldIgnoreHits = this.cRoot.gameSettings.enemies.demonMage.shieldIgnoreHits;
         this.§_-2y§ = false;
         MovieClip(this).debuff_shield.gotoAndPlay("on");
      }
      
      public function §_-Dt§() : void
      {
         this.§_-O1§ = false;
         this.§_-2y§ = true;
         MovieClip(this).debuff_shield.gotoAndStop("off");
      }
      
      public function hasShield() : Boolean
      {
         return this.§_-O1§;
      }
      
      override public function setDamage(param1:int, param2:int = 3, param3:§_-27§ = null, param4:int = 0, param5:Boolean = false) : void
      {
         if(this.§_-O1§)
         {
            if(!param5)
            {
               this.shieldIgnoreHits--;
               if(this.shieldIgnoreHits <= 0)
               {
                  this.§_-Dt§();
               }
            }
            return;
         }
         if(param2 != this.cRoot.gameSettings.I_ARMOR)
         {
            this.health = this.health - this.getArmorDamage(param2,param1,param4);
         }
         else
         {
            this.health = this.health - param1;
         }
         if(this.health <= 0)
         {
            this.toGraveyard();
            this.setDeadBasicStatus(true);
            this.addBlood();
            return;
         }
         this.§_-Jc§.updateProgress(this.health);
         if(param3 != null)
         {
            this.addDebuff(param3);
         }
      }
      
      override public function explode() : void
      {
         this.setDeadBasicStatus(true);
         this.addBlood();
      }
      
      override public function playAttackSound() : void
      {
         this.cRoot.game.gameSounds.wolfAttack();
      }
      
      override public function playDeadSound() : void
      {
         this.cRoot.game.gameSounds.playEnemyPuffDeadHighest();
      }
      
      override public function addBlood() : void
      {
      }
      
      function frame10() : *
      {
         gotoAndPlay("walking");
      }
      
      function frame20() : *
      {
         gotoAndPlay("walkingUp");
      }
      
      function frame30() : *
      {
         gotoAndPlay("walkingDown");
      }
      
      function frame31() : *
      {
         stop();
      }
      
      function frame45() : *
      {
         stop();
      }
      
      function frame64() : *
      {
         stop();
      }
      
      function frame68() : *
      {
         stop();
      }
      
      function frame81() : *
      {
         stop();
      }
      
      function frame92() : *
      {
         stop();
      }
   }
}
