package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.getQualifiedClassName;
   import org.casalib.math.geom.Ellipse;
   
   public class EnemyYetiBoss extends EnemyCommon
   {
       
      
      public var effect_HolyStrike:MovieClip;
      
      public var debuff_Cursed:MovieClip;
      
      public var §_-Gu§:MovieClip;
      
      public var effect_TeslaHit:MovieClip;
      
      public var debuff_Poison:MovieClip;
      
      private var §_-Qh§:Boolean = false;
      
      private var §_-O0§:Boolean = false;
      
      private var §_-Kx§:int = 45;
      
      private var §_-Ef§:int = 0;
      
      private var isBreathing:Boolean = false;
      
      private var breathDuration:int;
      
      private var breathDurationTimeCounter:int = 0;
      
      private var breathSoundTime:int = 34;
      
      private var breathSoundTimeCounter:int = 0;
      
      private var §_-Mv§:int;
      
      private var §_-Tt§:int;
      
      private var §_-I4§:int;
      
      private var §_-NY§:Point;
      
      private var areaAttackRangeWidth:int;
      
      private var §package§:int;
      
      private var §_-GB§:int;
      
      private var §_-Gp§:Boolean;
      
      private var frozeMaxTowers:int;
      
      private var frozeReloadTime:int;
      
      private var frozeReloadTimeCounter:int;
      
      private var frozeChargeTime:int = 27;
      
      private var frozeChargeTimeCounter:int;
      
      private var frozeRangeWidth:int;
      
      private var frozeRangeHeight:int;
      
      private var eating:Boolean;
      
      private var yetisSpawnCooldownTime:int;
      
      private var yetisSpawnCooldownTimeCounter:int = 0;
      
      private var wolfSpawnCooldownTime:int;
      
      private var §_-6z§:int = 0;
      
      public function EnemyYetiBoss(param1:int, param2:Array)
      {
         addFrameScript(31,this.frame32,63,this.frame64,64,this.frame65,105,this.frame106,134,this.frame135,164,this.frame165,210,this.frame211,235,this.frame236);
         super(param1,param2);
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.cRoot.game.gameSounds.stopAllMusics();
         this.cRoot.game.gameSounds.playMusicBossFight();
         this.cRoot.game.gameEncyclopedia.notificationEnemyYetiBoss = true;
         this.cRoot.game.gameEncyclopedia.saveData();
         this.isBoss = true;
         this.level = 1;
         this.canPoison = true;
         this.deadTime = 90;
         this.attackChargeTime = 40;
         this.countNodesActive = 5;
         this.isFlying = this.cRoot.gameSettings.enemies.yetiBoss.isFlying;
         this.size = this.cRoot.gameSettings.enemies.yetiBoss.size;
         this.health = this.initHealth = this.cRoot.gameSettings.enemies.yetiBoss.health;
         this.speed = this.cRoot.gameSettings.enemies.yetiBoss.speed;
         this.armor = this.cRoot.gameSettings.enemies.yetiBoss.armor;
         this.magicArmor = this.cRoot.gameSettings.enemies.yetiBoss.magicArmor;
         this.dodge = this.cRoot.gameSettings.enemies.yetiBoss.dodge;
         this.gold = this.cRoot.gameSettings.enemies.yetiBoss.gold;
         this.cost = this.cRoot.gameSettings.enemies.yetiBoss.cost;
         this.attackReloadTime = this.cRoot.gameSettings.enemies.yetiBoss.attackReloadTime - this.attackChargeTime;
         this.xSoldierAdjust = this.cRoot.gameSettings.enemies.yetiBoss.xSoldierAdjust;
         this.xAdjust = this.cRoot.gameSettings.enemies.yetiBoss.xAdjust;
         this.yAdjust = this.cRoot.gameSettings.enemies.yetiBoss.yAdjust;
         this.nodeMarginError = this.cRoot.gameSettings.enemies.yetiBoss.speed + 0.1;
         this.breathDuration = this.cRoot.gameSettings.enemies.yetiBoss.breathDuration;
         this.minDamage = this.cRoot.gameSettings.enemies.yetiBoss.minDamage;
         this.maxDamage = this.cRoot.gameSettings.enemies.yetiBoss.maxDamage;
         this.§_-Mv§ = this.cRoot.gameSettings.enemies.yetiBoss.areaDamageAttackRangeWidth;
         this.§_-Tt§ = this.cRoot.gameSettings.enemies.yetiBoss.areaDamageAttackRangeWidth * this.cRoot.gameSettings.rangeRatio;
         this.§_-I4§ = this.cRoot.gameSettings.enemies.yetiBoss.areaDamageAttackMaxEnemies;
         this.areaAttackRangeWidth = this.cRoot.gameSettings.enemies.yetiBoss.areaAttackRangeWidth;
         this.§package§ = this.cRoot.gameSettings.enemies.yetiBoss.areaAttackRangeWidth * this.cRoot.gameSettings.rangeRatio;
         this.§_-GB§ = this.cRoot.gameSettings.enemies.yetiBoss.areaAttackMaxEnemies;
         this.frozeMaxTowers = this.cRoot.gameSettings.enemies.yetiBoss.frozeMaxTowers;
         this.frozeRangeWidth = this.cRoot.gameSettings.enemies.yetiBoss.frozeRangeWidth;
         this.frozeRangeHeight = this.cRoot.gameSettings.enemies.yetiBoss.frozeRangeWidth * this.cRoot.gameSettings.rangeRatio;
         this.frozeReloadTime = this.cRoot.gameSettings.enemies.yetiBoss.frozeReloadTime;
         this.yetisSpawnCooldownTime = this.cRoot.gameSettings.enemies.yetiBoss.yetisSpawnCooldownTime;
         this.wolfSpawnCooldownTime = this.cRoot.gameSettings.enemies.yetiBoss.wolfSpawnCooldownTime;
         this.§_-Jc§ = new §_-Pb§(new Point(0,-110),this.health,this.initHealth);
         this.addChild(§_-Jc§);
         this.§_-R2§ = "";
         this.getFacing();
         this.§_-NA§ = 72;
         this.§_-C-§ = 115;
         this.addEventListener(MouseEvent.CLICK,this.clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.tIconName = "yetiboss";
         param1.eName = Locale.loadStringEx("ENEMY_YETI_BOSS_NAME",Locale.getDefaultLang());
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
            case "breathEnd":
               this.gotoAndPlay("breath");
               break;
            case "fightingEnd":
               break;
            case "frozeEnd":
               break;
            case "preDeadEnd":
               break;
            case "deadEnd":
               break;
            case "idle":
               break;
            default:
               this.play();
         }
         this.unPauseEffects();
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
            if(MovieClip(this).effect_HolyStrike.currentFrameLabel != "off")
            {
               MovieClip(this).effect_HolyStrike.play();
            }
         }
      }
      
      override public function onFrameUpdate() : void
      {
         if(this.§_-Qh§)
         {
            if(!this.§_-O0§)
            {
               if(this.§_-Ef§ < this.§_-Kx§)
               {
                  this.§_-Ef§++;
               }
               else
               {
                  if(this.scaleX == -1)
                  {
                     MovieClip(this.§_-Gu§).scaleX = -1;
                  }
                  this.§_-O0§ = true;
               }
            }
            return;
         }
         if(this.isDead)
         {
            if(this.deadTimeCounter == 0)
            {
               this.gotoAndPlay("dead");
            }
            this.deadTimeCounter++;
            if(this.deadTime == this.deadTimeCounter)
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
            if(!this.eating && (this.soldier == null || !this.soldier.isActive || !this.soldier.isFighting))
            {
               this.stopFighting();
            }
         }
         if(this.isFighting)
         {
            if(this.isCharging)
            {
               if(!this.readyToDamage())
               {
                  return;
               }
               this.attack();
               this.gotoAndStop("idle");
               if(this.soldier != null && this.soldier.isDead)
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
      
      override public function clickEvents(param1:MouseEvent) : void
      {
         this.cRoot.freeMenues();
         this.cRoot.enemySelection.setEnemy(this);
         this.cRoot.menu.showEnemyInfo(this);
         if(this.§_-O0§)
         {
            this.cRoot.game.gameSounds.playSoundBreakIce();
            this.§_-O0§ = false;
            this.§_-Qh§ = false;
            this.setDeadBasicStatus();
         }
      }
      
      override protected function stopSpecialPower() : void
      {
         this.§_-Gp§ = false;
         this.isBreathing = false;
      }
      
      override public function block(param1:Soldier) : void
      {
         this.soldier = param1;
         this.isBlocked = true;
         if(!this.§_-Gp§ && !this.isBreathing)
         {
            this.gotoAndStop("idle");
         }
      }
      
      override public function startFighting() : void
      {
         this.isFighting = true;
         if(!this.§_-Gp§ && !this.isBreathing)
         {
            this.§_-R2§ = "";
            this.y = this.y + 0.1;
            this.chargeAttack();
         }
      }
      
      override public function specialPower() : Boolean
      {
         this.frozeReloadTimeCounter++;
         this.yetisSpawnCooldownTimeCounter++;
         this.§_-6z§++;
         this.checkSpawnEnemies();
         if(this.§_-6d§())
         {
            return true;
         }
         if(this.§_-OR§())
         {
            return true;
         }
         return false;
      }
      
      private function checkSpawnEnemies() : void
      {
         if(this.§_-6z§ >= this.wolfSpawnCooldownTime)
         {
            this.cRoot.addToDecal(new YetiEgg(this.cRoot.paths[1][0][0],1,0,this,"WOLF"));
            this.§_-6z§ = 0;
         }
         if(this.yetisSpawnCooldownTimeCounter >= this.yetisSpawnCooldownTime)
         {
            this.cRoot.addToDecal(new YetiEgg(this.cRoot.paths[2][0][0],2,0,this,"YETI"));
            this.yetisSpawnCooldownTimeCounter = 0;
         }
      }
      
      private function §_-OR§() : Boolean
      {
         if(!this.§_-Gp§)
         {
            if(this.frozeReloadTimeCounter < this.frozeReloadTime)
            {
               return false;
            }
            if(!this.§_-N-§())
            {
               return false;
            }
            this.§_-Gp§ = true;
            this.§_-4Y§ = true;
            this.frozeChargeTimeCounter = 0;
            this.gotoAndPlay("froze");
            this.cRoot.game.gameSounds.playJtAttack();
            return true;
         }
         if(this.frozeChargeTimeCounter < this.frozeChargeTime)
         {
            this.frozeChargeTimeCounter++;
            if(this.frozeChargeTimeCounter == 13)
            {
               this.cRoot.decals.addChild(new HitGroundSmokeDecalBig(new Point(this.x,this.y),this.scaleX));
               this.cRoot.bullets.addChild(new HitGroundSmokeBig(new Point(this.x,this.y),this.scaleX));
               this.froze();
            }
            return true;
         }
         this.§_-Gp§ = false;
         this.frozeReloadTimeCounter = 0;
         this.§_-Jl§();
         return true;
      }
      
      private function §_-Jl§() : void
      {
         this.isBreathing = true;
         this.breathDurationTimeCounter = 0;
         this.breathSoundTimeCounter = 0;
         this.cRoot.game.gameSounds.playJtRest();
         this.gotoAndPlay("breath");
      }
      
      private function §_-6d§() : Boolean
      {
         if(!this.isBreathing)
         {
            return false;
         }
         if(this.breathDurationTimeCounter < this.breathDuration)
         {
            this.breathDurationTimeCounter++;
            this.breathSoundTimeCounter++;
            if(this.breathSoundTimeCounter == this.breathSoundTime)
            {
               this.breathSoundTimeCounter = 0;
               this.cRoot.game.gameSounds.playJtRest();
            }
            return true;
         }
         this.isBreathing = false;
         this.§_-R2§ = "";
         if(!this.isBlocked)
         {
            this.getFacing();
         }
         return false;
      }
      
      private function frozeAttack() : void
      {
         var _loc2_:Soldier = null;
         this.§_-NY§ = this.getAttackPoint();
         var _loc1_:int = 0;
         for each(_loc2_ in this.cRoot.soldiers)
         {
            if(_loc2_.isActive && this.onRangeFrozeAttack(_loc2_))
            {
               _loc2_.setDamage(this.getDamage(),false);
               _loc1_++;
               if(_loc1_ != this.§_-I4§)
               {
                  continue;
               }
               break;
            }
         }
      }
      
      private function onRangeFrozeAttack(param1:Soldier) : Boolean
      {
         var _loc2_:* = new Ellipse(this.§_-NY§.x - this.§_-Mv§ / 2,this.§_-NY§.y - this.§_-Tt§ / 2,this.§_-Mv§,this.§_-Tt§);
         return _loc2_.containsPoint(new Point(param1.x,param1.y));
      }
      
      private function getAttackPoint() : Point
      {
         if(this.scaleX == 1)
         {
            return new Point(this.x + 40,this.y);
         }
         return new Point(this.x - 40,this.y);
      }
      
      private function §_-N-§() : Boolean
      {
         var _loc1_:Tower = null;
         for each(_loc1_ in this.cRoot.towers)
         {
            if(!_loc1_.building && !_loc1_.isDisabled && this.onRangeFroze(_loc1_))
            {
               return true;
            }
         }
         return false;
      }
      
      private function froze() : void
      {
         var _loc2_:Tower = null;
         var _loc1_:int = 0;
         for each(_loc2_ in this.cRoot.towers)
         {
            if(!_loc2_.building && !_loc2_.isDisabled && this.onRangeFroze(_loc2_))
            {
               _loc2_.frozeTower();
               _loc1_++;
               if(this.frozeMaxTowers == _loc1_)
               {
                  return;
               }
            }
         }
      }
      
      private function onRangeFroze(param1:Tower) : Boolean
      {
         if(getQualifiedClassName(param1) == "TowerHolder")
         {
            return false;
         }
         var _loc2_:* = new Ellipse(this.x - this.frozeRangeWidth / 2,this.y - this.frozeRangeHeight / 2,this.frozeRangeWidth,this.frozeRangeHeight);
         return _loc2_.containsPoint(new Point(param1.x,param1.y));
      }
      
      override public function attack() : void
      {
         this.eating = false;
         this.soldier = null;
      }
      
      override public function chargeAttack() : void
      {
         this.cRoot.game.gameSounds.playJtEat();
         this.gotoAndPlay("fighting");
         this.isCharging = true;
         this.eating = true;
      }
      
      private function §_-1g§() : void
      {
         var _loc2_:Soldier = null;
         this.§_-NY§ = this.getEatPoint();
         var _loc1_:int = 0;
         for each(_loc2_ in this.cRoot.soldiers)
         {
            if(_loc2_.isActive && this.onRange(_loc2_))
            {
               _loc2_.eat();
               _loc1_++;
               if(_loc1_ != this.§_-GB§)
               {
                  continue;
               }
               break;
            }
         }
      }
      
      private function getEatPoint() : Point
      {
         if(this.scaleX == 1)
         {
            return new Point(this.x + 50,this.y);
         }
         return new Point(this.x - 50,this.y);
      }
      
      override protected function readyToDamage() : Boolean
      {
         this.attackChargeTimeCounter++;
         if(this.attackChargeTimeCounter >= this.attackChargeTime)
         {
            this.attackChargeTimeCounter = 0;
            return true;
         }
         if(this.attackChargeTimeCounter == 13)
         {
            this.§_-1g§();
         }
         return false;
      }
      
      private function onRange(param1:Soldier) : Boolean
      {
         var _loc2_:* = new Ellipse(this.§_-NY§.x - this.areaAttackRangeWidth / 2,this.§_-NY§.y - this.§package§ / 2,this.areaAttackRangeWidth,this.§package§);
         return _loc2_.containsPoint(new Point(param1.x,param1.y));
      }
      
      override public function setDamage(param1:int, param2:int = 3, param3:§_-27§ = null, param4:int = 0, param5:Boolean = false) : void
      {
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
            this.health = 0;
            this.isActive = false;
            this.§_-Jc§.hide();
            this.§_-Qh§ = true;
            this.gotoAndPlay("preDead");
            this.cRoot.game.gameSounds.playJtDeath();
            this.cRoot.cancelAllOnKeyPress();
            return;
         }
         this.§_-Jc§.updateProgress(this.health);
         if(param3 != null)
         {
            this.addDebuff(param3);
         }
      }
      
      override public function setDeadBasicStatus(param1:Boolean = false) : void
      {
         var _loc2_:Enemy = null;
         this.isActive = false;
         this.isDead = true;
         this.§_-Jc§.hide();
         this.cRoot.updateCash(this.gold);
         this.cRoot.data.currentEnemiesDefeated = this.cRoot.data.currentEnemiesDefeated + 1;
         this.cRoot.game.gameAchievement.killEnemie(this.cRoot,getQualifiedClassName(this));
         this.cRoot.game.gameAchievement.defeatYetiBoss(this.cRoot);
         for each(_loc2_ in this.cRoot.enemies)
         {
            if(_loc2_ != this)
            {
               _loc2_.setDeadBasicStatus();
               _loc2_.addBlood();
            }
         }
      }
      
      override public function explode() : void
      {
         this.setDeadBasicStatus();
      }
      
      override public function desintegrate(param1:Boolean = true) : void
      {
         this.setDeadBasicStatus();
      }
      
      override public function addBlood() : void
      {
      }
      
      function frame32() : *
      {
         gotoAndPlay("walking");
      }
      
      function frame64() : *
      {
         gotoAndPlay("walkingDown");
      }
      
      function frame65() : *
      {
         stop();
      }
      
      function frame106() : *
      {
         stop();
      }
      
      function frame135() : *
      {
         stop();
      }
      
      function frame165() : *
      {
         gotoAndPlay("breath");
      }
      
      function frame211() : *
      {
         stop();
      }
      
      function frame236() : *
      {
         stop();
      }
   }
}
