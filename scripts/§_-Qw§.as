package
{
   import fl.lang.Locale;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.casalib.math.geom.Ellipse;
   
   public class §_-Qw§ extends §_-2A§
   {
       
      
      protected var blockCounterLevel:int;
      
      protected var §_-5f§:Boolean;
      
      protected var blockCounterMinDamage:int;
      
      protected var blockCounterMaxDamage:int;
      
      protected var blockCounterDamageReturn:int;
      
      protected var blockCounterChance:Number;
      
      protected var blockCounterChargeTime:int;
      
      protected var blockCounterChargeTimeCounter:int;
      
      protected var courageLevel:int;
      
      protected var isCourage:Boolean;
      
      protected var courageRangeWidth:int;
      
      protected var courageRangeHeight:int;
      
      protected var courageReloadTime:int;
      
      protected var courageReloadTimeCounter:int;
      
      protected var courageChargeTime:int;
      
      protected var courageChargeTimeCounter:int;
      
      public function §_-Qw§(param1:Point, param2:Point, param3:Tower, param4:Point)
      {
         addFrameScript(0,this.frame1,16,this.frame17,29,this.frame30,56,this.frame57,75,this.frame76,99,this.frame100,152,this.frame153,161,this.frame162);
         super(param1,param2,param3,param4,0);
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      override protected function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.lifes = 1;
         this.speed = 1.65;
         this.xAdjust = 5;
         this.attackChargeTime = 12;
         this.attackChargeDamageTime = 6;
         this.respawnTime = 19;
         this.deadTime = this.cRoot.gameSettings.heroes.heroGeneral.respawn;
         this.idleTime = 30;
         this.§_-EZ§ = 27;
         this.§_-Hk§ = 0;
         this.§_-L3§ = 5;
         this.maxSize = this.cRoot.gameSettings.heroes.heroGeneral.maxSize;
         this.maxLevel = this.cRoot.gameSettings.heroes.heroGeneral.maxLevel;
         this.rangeWidth = this.cRoot.gameSettings.heroes.heroGeneral.range;
         this.rangeHeight = this.cRoot.gameSettings.heroes.heroGeneral.range * this.cRoot.gameSettings.rangeRatio;
         this.regenerateTime = this.cRoot.gameSettings.heroes.heroGeneral.regenReload;
         this.attackReloadTime = this.cRoot.gameSettings.heroes.heroGeneral.reload - this.attackChargeTime;
         this.xpMultiplier = this.cRoot.gameSettings.heroes.heroGeneral.xpMultiplier;
         this.§_-9h§ = this.cRoot.gameSettings.heroes.heroGeneral.courageModifier;
         this.§_-LI§ = this.cRoot.gameSettings.heroes.heroGeneral.blockCounterModifier;
         this.§_-Jc§ = new §_-Ov§(new Point(0,-32),this.health,this.initHealth);
         this.§_-Jc§.updateMaxHealth(this.initHealth,this.health);
         this.§_-Jc§.updateProgress(this.health);
         this.addChild(§_-Jc§);
         this.§_-Gv§ = this.cRoot.gameSettings.heroes.heroGeneral.portrait;
         this.§_-DH§();
         this.level = 1;
         this.levelUpWithAnimation(false);
         this.courageChargeTime = 52;
         this.blockCounterChargeTime = 24;
         this.isActive = false;
         this.isDead = true;
         this.deadTimeCounter = this.deadTime - 1;
         this.cRoot.addSoldier(this);
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.sIconName = "gerald";
         param1.sName = Locale.loadStringEx("HERO_PALADIN_NAME",Locale.getDefaultLang());
         param1.sRespawn = this.cRoot.gameSettings.heroes.heroGeneral.respawn / this.cRoot.gameSettings.framesRate + "s";
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
            case "fighting2End":
               break;
            case "respawningEnd":
               break;
            case "lvlUp":
               break;
            case "blockEnd":
               break;
            case "courageEnd":
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
      
      override protected function levelUpWithAnimation(param1:Boolean) : void
      {
         if(param1)
         {
            super.levelUpWithAnimation(param1);
         }
         this.health = this.initHealth = this.cRoot.gameSettings.heroes.heroGeneral.health[this.level - 1];
         this.§_-Rd§ = this.cRoot.gameSettings.heroes.heroGeneral.regen[this.level - 1];
         this.armor = this.cRoot.gameSettings.heroes.heroGeneral.armor[this.level - 1];
         this.minDamage = this.cRoot.gameSettings.heroes.heroGeneral.minDamage[this.level - 1];
         this.maxDamage = this.cRoot.gameSettings.heroes.heroGeneral.maxDamage[this.level - 1];
         this.§_-Jc§.updateMaxHealth(this.initHealth,this.health);
         this.§_-Jc§.updateProgress(this.health);
         this.portrait.updateHealth();
         this.portrait.updateXp();
         this.upgradeBlockCounterAttack();
         this.upgradeCourage();
      }
      
      override protected function runSpecial() : Boolean
      {
         this.courageReloadTimeCounter++;
         if(super.runSpecial())
         {
            return true;
         }
         if(this.§_-5f§)
         {
            this.§_-Es§();
            return true;
         }
         if(this.courageLevel != 0 && this.evalCourage())
         {
            return true;
         }
         return false;
      }
      
      override protected function stopSpecial() : void
      {
         this.isCourage = false;
         this.§_-5f§ = false;
         this.§_-La§ = false;
      }
      
      protected function upgradeCourage() : void
      {
         if(this.level != 2 && this.level != 5 && this.level != 8)
         {
            return;
         }
         if(this.level == 2)
         {
            this.courageLevel = 1;
         }
         if(this.level == 5)
         {
            this.courageLevel = 2;
         }
         if(this.level == 8)
         {
            this.courageLevel = 3;
         }
         this.courageRangeWidth = this.cRoot.gameSettings.heroes.heroGeneral.courageRangeWidth;
         this.courageRangeHeight = this.courageRangeWidth * this.cRoot.gameSettings.rangeRatio;
         this.courageReloadTime = this.cRoot.gameSettings.heroes.heroGeneral.courageReloadTime * this.cRoot.gameSettings.framesRate;
      }
      
      protected function evalCourage() : Boolean
      {
         if(this.§_-La§ || this.isCharging || this.§_-5f§ || this.isWalking)
         {
            return false;
         }
         if(!this.isCourage)
         {
            if(this.courageReloadTimeCounter < this.courageReloadTime)
            {
               return false;
            }
            if(!this.canCourage())
            {
               return false;
            }
            this.isCourage = true;
            this.courageChargeTimeCounter = 0;
            this.gotoAndPlay("courage");
            this.§_-7U§(1,this.courageLevel);
            return true;
         }
         if(this.courageChargeTimeCounter < this.courageChargeTime)
         {
            this.courageChargeTimeCounter++;
            if(this.courageChargeTimeCounter == 17)
            {
               this.doCourage();
            }
            if(this.courageChargeTimeCounter == 3)
            {
               this.cRoot.game.gameSounds.playHeroGeraldCourage();
            }
            return true;
         }
         this.isCourage = false;
         this.isCharging = false;
         this.attackReloadTimeCounter = 0;
         this.attackChargeTimeCounter = 0;
         this.courageChargeTimeCounter = 0;
         this.courageReloadTimeCounter = 0;
         this.§_-J9§();
         return false;
      }
      
      protected function canCourage() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:Soldier = null;
         for each(_loc2_ in this.cRoot.soldiers)
         {
            if(_loc2_.isActive && _loc2_.canBeCourage && _loc2_.isFighting && this.onRangeCourage(_loc2_))
            {
               _loc1_++;
               if(_loc1_ == 2)
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      protected function doCourage() : void
      {
         var _loc1_:Soldier = null;
         for each(_loc1_ in this.cRoot.soldiers)
         {
            if(_loc1_.isActive && _loc1_.canBeCourage && this.onRangeCourage(_loc1_))
            {
               _loc1_.addDebuff(new DebuffSoldierCourage(this.cRoot,this.courageLevel,_loc1_));
            }
         }
      }
      
      protected function onRangeCourage(param1:Soldier) : Boolean
      {
         var _loc2_:* = new Ellipse(this.x - this.courageRangeWidth / 2,this.y - this.courageRangeHeight / 2,this.courageRangeWidth,this.courageRangeHeight);
         return _loc2_.containsPoint(new Point(param1.x,param1.y));
      }
      
      override public function dodgeHit() : Boolean
      {
         if(this.blockCounterLevel == 0)
         {
            return false;
         }
         if(this.§_-5f§ || this.§_-La§ || this.isCourage)
         {
            return false;
         }
         if(this.getRandom(1,100) > this.blockCounterChance)
         {
            return false;
         }
         this.stopSpecial();
         this.§_-5f§ = true;
         this.blockCounterChargeTimeCounter = 0;
         this.gotoAndPlay("block");
         this.cRoot.game.gameSounds.playHeroGeraldDeflect();
         this.§_-7U§(2,this.blockCounterLevel);
         return true;
      }
      
      protected function upgradeBlockCounterAttack() : void
      {
         if(this.level != 4 && this.level != 7 && this.level != 10)
         {
            return;
         }
         if(this.level == 4)
         {
            this.blockCounterLevel = 1;
         }
         if(this.level == 7)
         {
            this.blockCounterLevel = 2;
         }
         if(this.level == 10)
         {
            this.blockCounterLevel = 3;
         }
         this.blockCounterMinDamage = this.cRoot.gameSettings.heroes.heroGeneral.blockCounterMinDamage;
         this.blockCounterMaxDamage = this.cRoot.gameSettings.heroes.heroGeneral.blockCounterMaxDamage;
         this.blockCounterDamageReturn = this.cRoot.gameSettings.heroes.heroGeneral.blockCounterDamageReturn + this.cRoot.gameSettings.heroes.heroGeneral.blockCounterDamageReturn * this.blockCounterLevel;
         this.blockCounterChance = this.cRoot.gameSettings.heroes.heroGeneral.blockCounterChance + this.cRoot.gameSettings.heroes.heroGeneral.blockCounterChanceIncrement * this.blockCounterLevel;
      }
      
      protected function §_-Es§() : Boolean
      {
         if(this.blockCounterChargeTimeCounter < this.blockCounterChargeTime)
         {
            this.blockCounterChargeTimeCounter++;
            if(this.blockCounterChargeTimeCounter == 5)
            {
               if(this.enemy != null && this.enemy.isActive)
               {
                  this.enemy.setDamage(this.getDamageCounterAttack(),this.cRoot.gameSettings.I_ARMOR,null,0,false);
               }
            }
            return true;
         }
         this.§_-5f§ = false;
         this.blockCounterChargeTimeCounter = 0;
         this.§_-J9§();
         return false;
      }
      
      protected function getDamageCounterAttack() : int
      {
         return this.dodgeDamage * this.blockCounterDamageReturn / 100;
      }
      
      override protected function chargeAttack() : void
      {
         if(Math.random() > 0.5)
         {
            this.gotoAndPlay("fighting");
         }
         else
         {
            this.gotoAndPlay("fighting2");
         }
         this.isCharging = true;
      }
      
      override protected function playTaunt() : void
      {
         this.cRoot.game.gameSounds.playPaladinTaunt();
      }
      
      override public function playDeadSound() : void
      {
         this.cRoot.game.gameSounds.playHeroGeraldDeath();
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame17() : *
      {
         stop();
      }
      
      function frame30() : *
      {
         stop();
      }
      
      function frame57() : *
      {
         stop();
      }
      
      function frame76() : *
      {
         stop();
      }
      
      function frame100() : *
      {
         stop();
      }
      
      function frame153() : *
      {
         stop();
      }
      
      function frame162() : *
      {
         stop();
      }
   }
}
