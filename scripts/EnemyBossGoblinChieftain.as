package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.casalib.math.geom.Ellipse;
   
   public class EnemyBossGoblinChieftain extends EnemyCommon
   {
       
      
      public var effect_Healing:MovieClip;
      
      public var effect_HolyStrike:MovieClip;
      
      public var debuff_Cursed:MovieClip;
      
      public var effect_TeslaHit:MovieClip;
      
      public var debuff_Poison:MovieClip;
      
      public var effect_Sniper:MovieClip;
      
      private var §_-Iy§:Boolean;
      
      private var healingCooldownTime:int = 120;
      
      private var healingCooldownTimeCounter:int;
      
      private var healingAnimationTime:int = 28;
      
      private var healingAnimationTimeCounter:int;
      
      private var healingAnimationStartTime:int = 13;
      
      private var healingRangeWidth:int;
      
      private var healingRangeHeight:int;
      
      private var healingPoints:int;
      
      private var healMaxEnemies:int;
      
      public function EnemyBossGoblinChieftain(param1:int, param2:Array)
      {
         addFrameScript(16,this.frame17,33,this.frame34,34,this.frame35,54,this.frame55,86,this.frame87,115,this.frame116);
         super(param1,param2);
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.cRoot.game.gameSounds.stopAllMusics();
         this.cRoot.game.gameSounds.playMusicBossFight();
         this.cRoot.game.gameEncyclopedia.notificationEnemyBossGoblinChieftain = true;
         this.cRoot.game.gameEncyclopedia.saveData();
         this.isBoss = true;
         this.level = 1;
         this.canPoison = true;
         this.deadTime = 90;
         this.countNodesActive = 5;
         this.isFlying = this.cRoot.gameSettings.enemies.goblinChieftain.isFlying;
         this.attackChargeTime = 20;
         this.size = this.cRoot.gameSettings.enemies.goblinChieftain.size;
         this.health = this.initHealth = this.cRoot.gameSettings.enemies.goblinChieftain.health;
         this.speed = this.cRoot.gameSettings.enemies.goblinChieftain.speed;
         this.armor = this.cRoot.gameSettings.enemies.goblinChieftain.armor;
         this.magicArmor = this.cRoot.gameSettings.enemies.goblinChieftain.magicArmor;
         this.dodge = this.cRoot.gameSettings.enemies.goblinChieftain.dodge;
         this.gold = this.cRoot.gameSettings.enemies.goblinChieftain.gold;
         this.cost = this.cRoot.gameSettings.enemies.goblinChieftain.cost;
         this.minDamage = this.cRoot.gameSettings.enemies.goblinChieftain.minDamage;
         this.maxDamage = this.cRoot.gameSettings.enemies.goblinChieftain.maxDamage;
         this.attackReloadTime = this.cRoot.gameSettings.enemies.goblinChieftain.attackReloadTime - this.attackChargeTime;
         this.xSoldierAdjust = this.cRoot.gameSettings.enemies.goblinChieftain.xSoldierAdjust;
         this.xAdjust = this.cRoot.gameSettings.enemies.goblinChieftain.xAdjust;
         this.yAdjust = this.cRoot.gameSettings.enemies.goblinChieftain.yAdjust;
         this.nodeMarginError = this.cRoot.gameSettings.enemies.goblinChieftain.speed + 0.1;
         this.healingCooldownTime = this.cRoot.gameSettings.enemies.goblinChieftain.healCoolDown;
         this.healingRangeWidth = this.cRoot.gameSettings.enemies.goblinChieftain.healRange;
         this.healingRangeHeight = this.cRoot.gameSettings.enemies.goblinChieftain.healRange * this.cRoot.gameSettings.rangeRatio;
         this.healingPoints = this.cRoot.gameSettings.enemies.goblinChieftain.healPoints;
         this.healMaxEnemies = this.cRoot.gameSettings.enemies.goblinChieftain.healMaxEnemies;
         this.§_-Jc§ = new §_-Pb§(new Point(0,-80),this.health,this.initHealth);
         this.addChild(§_-Jc§);
         this.§_-R2§ = "";
         this.getFacing();
         this.§_-NA§ = 63;
         this.§_-C-§ = 92;
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.tIconName = "gulthak";
         param1.eName = Locale.loadStringEx("ENEMY_BOSS_GOBLIN_CHIEFTAIN_NAME",Locale.getDefaultLang());
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
            case "healingEnd":
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
      
      override protected function stopSpecialPower() : void
      {
         this.§_-Iy§ = false;
      }
      
      override public function specialPower() : Boolean
      {
         if(!this.§_-Iy§)
         {
            if(this.healingCooldownTimeCounter < this.healingCooldownTime)
            {
               this.healingCooldownTimeCounter++;
               return false;
            }
            if(!this.§_-7e§())
            {
               return false;
            }
            this.§_-Iy§ = true;
            this.gotoAndPlay("healing");
            this.healingAnimationTimeCounter = 0;
            this.cRoot.game.gameSounds.enemyHealing();
            return true;
         }
         if(this.healingAnimationTimeCounter < this.healingAnimationTime)
         {
            this.healingAnimationTimeCounter++;
            if(this.healingAnimationTimeCounter == this.healingAnimationStartTime)
            {
               this.healTargets();
            }
            return true;
         }
         this.§_-Iy§ = false;
         this.healingCooldownTimeCounter = 0;
         this.§_-R2§ = "";
         if(!this.isBlocked)
         {
            this.getFacing();
         }
         return false;
      }
      
      private function §_-7e§() : Boolean
      {
         var _loc1_:Enemy = null;
         for each(_loc1_ in this.cRoot.enemies)
         {
            if(_loc1_.isActive && _loc1_ != this && this.§_-LD§(_loc1_) && this.healingOnRange(_loc1_))
            {
               return true;
            }
         }
         return false;
      }
      
      private function healTargets() : void
      {
         var _loc2_:Enemy = null;
         var _loc1_:int = 0;
         for each(_loc2_ in this.cRoot.enemies)
         {
            if(_loc2_.isActive && _loc2_ != this && this.§_-LD§(_loc2_) && this.healingOnRange(_loc2_))
            {
               EnemyCommon(_loc2_).heal(this.healingPoints);
               _loc1_++;
               if(_loc1_ != this.healMaxEnemies)
               {
                  continue;
               }
               break;
            }
         }
      }
      
      private function §_-LD§(param1:Enemy) : Boolean
      {
         if(param1.health < param1.initHealth)
         {
            return true;
         }
         return false;
      }
      
      private function healingOnRange(param1:Enemy) : Boolean
      {
         var _loc2_:* = new Ellipse(this.x - this.healingRangeWidth / 2,this.y - this.healingRangeHeight / 2,this.healingRangeWidth,this.healingRangeHeight);
         return _loc2_.containsPoint(new Point(param1.x,param1.y));
      }
      
      override public function explode() : void
      {
         this.toGraveyard();
         this.setDeadBasicStatus();
         this.addBlood();
      }
      
      override public function playDeadSound() : void
      {
         this.cRoot.game.gameSounds.playEnemyBigDead();
      }
      
      function frame17() : *
      {
         gotoAndPlay("walking");
      }
      
      function frame34() : *
      {
         gotoAndPlay("walkingDown");
      }
      
      function frame35() : *
      {
         stop();
      }
      
      function frame55() : *
      {
         stop();
      }
      
      function frame87() : *
      {
         stop();
      }
      
      function frame116() : *
      {
         stop();
      }
   }
}
