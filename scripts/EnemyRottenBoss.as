package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   import org.casalib.math.geom.Ellipse;
   
   public class EnemyRottenBoss extends EnemyCommon
   {
       
      
      public var effect_Healing:MovieClip;
      
      public var effect_HolyStrike:MovieClip;
      
      public var debuff_Cursed:MovieClip;
      
      public var effect_TeslaHit:MovieClip;
      
      public var debuff_Poison:MovieClip;
      
      private var §_-NY§:Point;
      
      private var areaAttackRangeWidth:int;
      
      private var §package§:int;
      
      private var §_-GB§:int;
      
      private var §_-Qn§:Boolean;
      
      private var bombReloadTime:int = 120;
      
      private var bombReloadTimeCounter:int = 0;
      
      private var bombChargeTime:int = 49;
      
      private var bombChargeTimeCounter:int;
      
      private var bombMaxBalls:int;
      
      public function EnemyRottenBoss(param1:int, param2:Array)
      {
         addFrameScript(15,this.frame16,32,this.frame33,33,this.frame34,55,this.frame56,85,this.frame86,96,this.frame97);
         super(param1,param2);
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.cRoot.game.gameSounds.stopAllMusics();
         this.cRoot.game.gameSounds.playMusicBossFight();
         this.cRoot.game.gameEncyclopedia.notificationEnemyBossGreenmuck = true;
         this.cRoot.game.gameEncyclopedia.saveData();
         this.isBoss = true;
         this.level = 1;
         this.§_-4q§ = "BloodGrey";
         this.canPoison = false;
         this.deadTime = 200;
         this.attackChargeTime = 28;
         this.countNodesActive = 5;
         this.isFlying = this.cRoot.gameSettings.enemies.rottenBoss.isFlying;
         this.size = this.cRoot.gameSettings.enemies.rottenBoss.size;
         this.health = this.initHealth = this.cRoot.gameSettings.enemies.rottenBoss.health;
         this.speed = this.cRoot.gameSettings.enemies.rottenBoss.speed;
         this.armor = this.cRoot.gameSettings.enemies.rottenBoss.armor;
         this.magicArmor = this.cRoot.gameSettings.enemies.rottenBoss.magicArmor;
         this.dodge = this.cRoot.gameSettings.enemies.rottenBoss.dodge;
         this.gold = this.cRoot.gameSettings.enemies.rottenBoss.gold;
         this.cost = this.cRoot.gameSettings.enemies.rottenBoss.cost;
         this.minDamage = this.cRoot.gameSettings.enemies.rottenBoss.minDamage;
         this.maxDamage = this.cRoot.gameSettings.enemies.rottenBoss.maxDamage;
         this.attackReloadTime = this.cRoot.gameSettings.enemies.rottenBoss.attackReloadTime - this.attackChargeTime;
         this.xSoldierAdjust = this.cRoot.gameSettings.enemies.rottenBoss.xSoldierAdjust;
         this.xAdjust = this.cRoot.gameSettings.enemies.rottenBoss.xAdjust;
         this.yAdjust = this.cRoot.gameSettings.enemies.rottenBoss.yAdjust;
         this.nodeMarginError = this.cRoot.gameSettings.enemies.rottenBoss.speed + 0.1;
         this.areaAttackRangeWidth = this.cRoot.gameSettings.enemies.rottenBoss.areaAttackRangeWidth;
         this.§package§ = this.cRoot.gameSettings.enemies.rottenBoss.areaAttackRangeWidth * this.cRoot.gameSettings.rangeRatio;
         this.§_-GB§ = this.cRoot.gameSettings.enemies.rottenBoss.areaAttackMaxEnemies;
         this.bombMaxBalls = this.cRoot.gameSettings.enemies.rottenBoss.bombMaxBalls;
         this.bombReloadTime = this.cRoot.gameSettings.enemies.rottenBoss.bombCooldownTime;
         this.§_-Jc§ = new §_-Pb§(new Point(0,-110),this.health,this.initHealth);
         this.addChild(§_-Jc§);
         this.§_-R2§ = "";
         this.getFacing();
         this.§_-NA§ = 69;
         this.§_-C-§ = 113;
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.tIconName = "greenmuck";
         param1.eName = Locale.loadStringEx("ENEMY_ROTTEN_TREE_BOSS_NAME",Locale.getDefaultLang());
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
            case "fightingEnd":
               break;
            case "bombEnd":
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
            MovieClip(this).effect_Healing.stop();
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
            if(MovieClip(this).effect_Healing.currentFrameLabel != "off")
            {
               MovieClip(this).effect_Healing.play();
            }
         }
      }
      
      override protected function stopSpecialPower() : void
      {
         this.§_-Qn§ = false;
      }
      
      override public function block(param1:Soldier) : void
      {
         this.soldier = param1;
         this.isBlocked = true;
         if(!this.§_-Qn§)
         {
            this.gotoAndStop("idle");
         }
      }
      
      override public function startFighting() : void
      {
         this.isFighting = true;
         if(!this.§_-Qn§)
         {
            this.§_-R2§ = "";
            this.y = this.y + 0.1;
            this.chargeAttack();
         }
      }
      
      override public function specialPower() : Boolean
      {
         this.bombReloadTimeCounter++;
         if(this.§_-5V§())
         {
            return true;
         }
         return false;
      }
      
      private function §_-5V§() : Boolean
      {
         if(!this.§_-Qn§)
         {
            if(this.bombReloadTimeCounter < this.bombReloadTime)
            {
               return false;
            }
            if(!this.§_-F4§())
            {
               return false;
            }
            this.§_-Qn§ = true;
            this.bombChargeTimeCounter = 0;
            this.gotoAndPlay("bomb");
            return true;
         }
         if(this.bombChargeTimeCounter < this.bombChargeTime)
         {
            this.bombChargeTimeCounter++;
            if(this.bombChargeTimeCounter == 11)
            {
               this.§_-Im§();
            }
            return true;
         }
         this.bombReloadTimeCounter = 0;
         this.§_-Qn§ = false;
         this.§_-R2§ = "";
         if(!this.isBlocked)
         {
            this.getFacing();
         }
         return false;
      }
      
      private function §_-F4§() : Boolean
      {
         var _loc1_:Soldier = null;
         for each(_loc1_ in this.cRoot.soldiers)
         {
            if(_loc1_.isActive)
            {
               return true;
            }
         }
         return false;
      }
      
      private function §_-Im§() : void
      {
         var _loc3_:Soldier = null;
         var _loc4_:Soldier = null;
         var _loc5_:int = 0;
         var _loc1_:int = 0;
         var _loc2_:Dictionary = new Dictionary(true);
         for each(_loc3_ in this.cRoot.soldiers)
         {
            if(_loc3_.isActive)
            {
               _loc2_[_loc3_] = _loc3_;
               _loc1_++;
            }
         }
         if(_loc1_ == 0)
         {
            return;
         }
         if(_loc1_ < this.bombMaxBalls)
         {
            for each(_loc4_ in _loc2_)
            {
               this.cRoot.bullets.addChild(new RottenTreeBossBall(this.getSpecialPosition(),new Point(_loc4_.x,_loc4_.y)));
            }
         }
         else
         {
            _loc5_ = 0;
            while(_loc5_ < this.bombMaxBalls)
            {
               this.shootRandomSoldier(_loc2_,_loc1_);
               _loc1_--;
               _loc5_++;
            }
         }
         _loc2_ = null;
      }
      
      function shootRandomSoldier(param1:Dictionary, param2:int) : void
      {
         var _loc5_:Soldier = null;
         var _loc3_:int = 0;
         var _loc4_:int = this.getRandom(0,param2 - 1);
         for each(_loc5_ in param1)
         {
            if(_loc3_ == _loc4_)
            {
               this.cRoot.bullets.addChild(new RottenTreeBossBall(this.getSpecialPosition(),new Point(_loc5_.x,_loc5_.y)));
               delete param1[_loc5_];
               return;
            }
            _loc3_++;
         }
      }
      
      private function getSpecialPosition() : Point
      {
         return new Point(this.x,this.y - 88);
      }
      
      private function getRandom(param1:*, param2:*) : Number
      {
         var _loc3_:Number = NaN;
         _loc3_ = Math.round(Math.random() * (param2 - param1)) + param1;
         return _loc3_;
      }
      
      private function getAttackPoint() : Point
      {
         if(this.scaleX == 1)
         {
            return new Point(this.x + 45,this.y);
         }
         return new Point(this.x - 45,this.y);
      }
      
      override public function attack() : void
      {
         var _loc2_:Soldier = null;
         this.§_-NY§ = this.getAttackPoint();
         var _loc1_:int = 0;
         for each(_loc2_ in this.cRoot.soldiers)
         {
            if(_loc2_.isActive && this.onRange(_loc2_))
            {
               _loc2_.setDamage(this.getDamage(),false);
               _loc1_++;
               if(_loc1_ != this.§_-GB§)
               {
                  continue;
               }
               break;
            }
         }
      }
      
      override public function setDeadBasicStatus(param1:Boolean = false) : void
      {
         this.isActive = false;
         this.isDead = true;
         this.§_-Jc§.hide();
         this.cRoot.updateCash(this.gold);
         this.cRoot.data.currentEnemiesDefeated = this.cRoot.data.currentEnemiesDefeated + 1;
         this.cRoot.game.gameAchievement.killEnemie(this.cRoot,getQualifiedClassName(this));
         Level15(this.cRoot).rottemSpawn.§_-Ti§();
      }
      
      override protected function readyToDamage() : Boolean
      {
         this.attackChargeTimeCounter++;
         if(this.attackChargeTimeCounter >= this.attackChargeTime)
         {
            this.attackChargeTimeCounter = 0;
            return true;
         }
         if(this.attackChargeTimeCounter == 15)
         {
         }
         return false;
      }
      
      private function onRange(param1:Soldier) : Boolean
      {
         var _loc2_:* = new Ellipse(this.§_-NY§.x - this.areaAttackRangeWidth / 2,this.§_-NY§.y - this.§package§ / 2,this.areaAttackRangeWidth,this.§package§);
         return _loc2_.containsPoint(new Point(param1.x,param1.y));
      }
      
      override public function explode() : void
      {
         this.setDeadBasicStatus();
      }
      
      override public function addBlood() : void
      {
      }
      
      function frame16() : *
      {
         gotoAndPlay("walking");
      }
      
      function frame33() : *
      {
         gotoAndPlay("walkingDown");
      }
      
      function frame34() : *
      {
         stop();
      }
      
      function frame56() : *
      {
         stop();
      }
      
      function frame86() : *
      {
         stop();
      }
      
      function frame97() : *
      {
         stop();
      }
   }
}
