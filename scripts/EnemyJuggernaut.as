package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.getQualifiedClassName;
   import org.casalib.math.geom.Ellipse;
   
   public class EnemyJuggernaut extends EnemyCommon
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
      
      private var §_-S0§:Point;
      
      private var missileTarget:Soldier;
      
      private var §_-Cl§:Boolean;
      
      private var missileMinRange:int;
      
      private var missileChargeTime:int = 49;
      
      private var missileChargeTimeCounter:int;
      
      private var missileReloadTime:int;
      
      private var missileReloadTimeCounter:int;
      
      private var §_-Px§:Boolean;
      
      private var §_-6D§:int = 120;
      
      private var §_-Kz§:int = 0;
      
      private var §_-O6§:int = 49;
      
      private var §_-Jr§:int;
      
      private var §_-JH§:int;
      
      private var §_-BM§:int;
      
      public function EnemyJuggernaut(param1:int, param2:Array)
      {
         this.§_-S0§ = new Point();
         addFrameScript(23,this.frame24,47,this.frame48,48,this.frame49,76,this.frame77,125,this.frame126,151,this.frame152);
         super(param1,param2);
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.cRoot.game.gameSounds.stopAllMusics();
         this.cRoot.game.gameSounds.playMusicBossFight();
         this.cRoot.game.gameEncyclopedia.notificationEnemyJuggernaut = true;
         this.cRoot.game.gameEncyclopedia.notificationEnemyGolemHead = true;
         this.cRoot.game.gameEncyclopedia.saveData();
         this.isBoss = true;
         this.level = 1;
         this.§_-4q§ = "BloodGrey";
         this.canPoison = false;
         this.deadTime = 200;
         this.attackChargeTime = 28;
         this.countNodesActive = 5;
         this.isFlying = this.cRoot.gameSettings.enemies.juggernaut.isFlying;
         this.size = this.cRoot.gameSettings.enemies.juggernaut.size;
         this.health = this.initHealth = this.cRoot.gameSettings.enemies.juggernaut.health;
         this.speed = this.cRoot.gameSettings.enemies.juggernaut.speed;
         this.armor = this.cRoot.gameSettings.enemies.juggernaut.armor;
         this.magicArmor = this.cRoot.gameSettings.enemies.juggernaut.magicArmor;
         this.dodge = this.cRoot.gameSettings.enemies.juggernaut.dodge;
         this.gold = this.cRoot.gameSettings.enemies.juggernaut.gold;
         this.cost = this.cRoot.gameSettings.enemies.juggernaut.cost;
         this.minDamage = this.cRoot.gameSettings.enemies.juggernaut.minDamage;
         this.maxDamage = this.cRoot.gameSettings.enemies.juggernaut.maxDamage;
         this.attackReloadTime = this.cRoot.gameSettings.enemies.juggernaut.attackReloadTime - this.attackChargeTime;
         this.xSoldierAdjust = this.cRoot.gameSettings.enemies.juggernaut.xSoldierAdjust;
         this.xAdjust = this.cRoot.gameSettings.enemies.juggernaut.xAdjust;
         this.yAdjust = this.cRoot.gameSettings.enemies.juggernaut.yAdjust;
         this.nodeMarginError = this.cRoot.gameSettings.enemies.juggernaut.speed + 0.1;
         this.areaAttackRangeWidth = this.cRoot.gameSettings.enemies.juggernaut.areaAttackRangeWidth;
         this.§package§ = this.cRoot.gameSettings.enemies.juggernaut.areaAttackRangeWidth * this.cRoot.gameSettings.rangeRatio;
         this.§_-GB§ = this.cRoot.gameSettings.enemies.juggernaut.areaAttackMaxEnemies;
         this.missileReloadTime = this.cRoot.gameSettings.enemies.juggernaut.missileCoolDown;
         this.missileMinRange = this.cRoot.gameSettings.enemies.juggernaut.missileMinRange;
         this.§_-6D§ = this.cRoot.gameSettings.enemies.juggernaut.spawnCooldownTime;
         this.§_-Jc§ = new §_-Pb§(new Point(0,-90),this.health,this.initHealth);
         this.addChild(§_-Jc§);
         this.§_-R2§ = "";
         this.getFacing();
         this.§_-NA§ = 58;
         this.§_-C-§ = 92;
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.tIconName = "juggernaut";
         param1.eName = Locale.loadStringEx("ENEMY_JUGGERNAUT_NAME",Locale.getDefaultLang());
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
            case "missileEnd":
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
         this.§_-Cl§ = false;
         this.§_-Px§ = false;
      }
      
      override public function block(param1:Soldier) : void
      {
         this.soldier = param1;
         this.isBlocked = true;
         if(!this.§_-Cl§ && !this.§_-Px§)
         {
            this.gotoAndStop("idle");
         }
      }
      
      override public function startFighting() : void
      {
         this.isFighting = true;
         if(!this.§_-Cl§ && !this.§_-Px§)
         {
            this.§_-R2§ = "";
            this.y = this.y + 0.1;
            this.chargeAttack();
         }
      }
      
      override public function specialPower() : Boolean
      {
         this.missileReloadTimeCounter++;
         this.§_-Kz§++;
         if(!this.§_-Px§ && this.§_-5h§())
         {
            return true;
         }
         if(!this.§_-Cl§ && this.specialSpawnEnemies())
         {
            return true;
         }
         return false;
      }
      
      private function §_-5h§() : Boolean
      {
         var _loc1_:Point = null;
         if(!this.§_-Cl§)
         {
            if(this.missileReloadTimeCounter < this.missileReloadTime)
            {
               return false;
            }
            if(!this.getMissileTarget())
            {
               return false;
            }
            this.§_-S0§ = new Point(this.missileTarget.x,this.missileTarget.y - 7);
            this.§_-Cl§ = true;
            this.§_-4Y§ = true;
            this.missileChargeTimeCounter = 0;
            this.gotoAndPlay("missile");
            return true;
         }
         if(this.missileChargeTimeCounter < this.missileChargeTime)
         {
            this.missileChargeTimeCounter++;
            if(this.missileChargeTimeCounter == 24)
            {
               _loc1_ = null;
               if(this.missileTarget == null || !this.missileTarget.isActive)
               {
                  if(!this.getMissileTarget())
                  {
                     _loc1_ = this.§_-S0§;
                  }
               }
               this.cRoot.bullets.addChild(new MissileEnemy(1,this.getSpecialPosition(),this.missileTarget));
            }
            return true;
         }
         this.§_-Cl§ = false;
         this.missileReloadTimeCounter = 0;
         this.§_-R2§ = "";
         if(!this.isBlocked)
         {
            this.getFacing();
         }
         return false;
      }
      
      private function getSpecialPosition() : Point
      {
         if(this.scaleX == 1)
         {
            return new Point(this.x - 25,this.y - 63);
         }
         return new Point(this.x + 25,this.y - 63);
      }
      
      private function getMissileTarget() : Boolean
      {
         var _loc1_:Soldier = null;
         this.missileTarget = null;
         for each(_loc1_ in this.cRoot.soldiers)
         {
            if(_loc1_.isActive && this.§_-x§(_loc1_))
            {
               this.missileTarget = _loc1_;
               break;
            }
         }
         if(this.missileTarget != null)
         {
            return true;
         }
         return false;
      }
      
      private function §_-x§(param1:Soldier) : Boolean
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:Number = NaN;
         _loc3_ = param1.x - this.x;
         _loc4_ = param1.y - this.y;
         _loc2_ = Math.sqrt(_loc3_ * _loc3_ + _loc4_ * _loc4_);
         if(_loc2_ > this.missileMinRange)
         {
            return true;
         }
         return false;
      }
      
      private function specialSpawnEnemies() : Boolean
      {
         if(!this.§_-Px§)
         {
            if(this.§_-Kz§ < this.§_-6D§)
            {
               return false;
            }
            this.§_-Px§ = true;
            this.§_-Jr§ = 0;
            this.gotoAndPlay("missile");
            return true;
         }
         if(this.§_-Jr§ < this.§_-O6§)
         {
            this.§_-Jr§++;
            if(this.§_-Jr§ == 24)
            {
               this.cRoot.bullets.addChild(new §_-OM§(this.getSpecialPosition(),this.getBallDestination(),this.§_-JH§,this.§_-BM§,0,this));
            }
            return true;
         }
         this.§_-Kz§ = 0;
         this.§_-Px§ = false;
         this.§_-R2§ = "";
         if(!this.isBlocked)
         {
            this.getFacing();
         }
         return false;
      }
      
      private function getBallDestination() : Point
      {
         var _loc2_:int = Math.floor(this.getRandom(0,this.cRoot.paths.length - 1));
         this.§_-JH§ = _loc2_;
         var _loc3_:int = Math.floor(this.getRandom(0,this.cRoot.paths[_loc2_].length - 1));
         var _loc4_:int = Math.floor(this.getRandom(0,this.cRoot.paths[_loc2_][_loc3_].length - 50));
         this.§_-BM§ = _loc4_;
         return this.cRoot.paths[_loc2_][_loc3_][_loc4_];
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
         var _loc2_:Enemy = null;
         this.isActive = false;
         this.isDead = true;
         this.§_-Jc§.hide();
         this.cRoot.updateCash(this.gold);
         this.cRoot.data.currentEnemiesDefeated = this.cRoot.data.currentEnemiesDefeated + 1;
         this.cRoot.game.gameAchievement.killEnemie(this.cRoot,getQualifiedClassName(this));
         this.cRoot.game.gameSounds.playJuggernautDeath();
         this.cRoot.game.gameAchievement.defeatJuggernaut(this.cRoot);
         for each(_loc2_ in this.cRoot.enemies)
         {
            if(_loc2_ != this)
            {
               _loc2_.setDeadBasicStatus();
               _loc2_.addBlood();
            }
         }
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
            this.cRoot.bullets.addChild(new JuggernautAttackSmoke(new Point(this.x,this.y),this.scaleX));
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
      
      function frame24() : *
      {
         gotoAndPlay("walking");
      }
      
      function frame48() : *
      {
         gotoAndPlay("walkingUp");
      }
      
      function frame49() : *
      {
         stop();
      }
      
      function frame77() : *
      {
         stop();
      }
      
      function frame126() : *
      {
         stop();
      }
      
      function frame152() : *
      {
         stop();
      }
   }
}
