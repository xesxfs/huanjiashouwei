package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.casalib.math.geom.Ellipse;
   
   public class EnemyThing extends EnemyCommon
   {
       
      
      public var effect_Healing:MovieClip;
      
      public var effect_HolyStrike:MovieClip;
      
      public var effect_burn:MovieClip;
      
      public var effect_stun:MovieClip;
      
      public var debuff_Cursed:MovieClip;
      
      public var effect_TeslaHit:MovieClip;
      
      public var debuff_Poison:MovieClip;
      
      public var effect_Sniper:MovieClip;
      
      private var §_-5Z§:Boolean;
      
      private var §_-S0§:Point;
      
      private var bombTarget:Soldier;
      
      private var bombOnTarget:Boolean;
      
      private var §_-Qn§:Boolean;
      
      private var bombRangeWidth:int;
      
      private var bombRangeHeight:int;
      
      private var bombMinRange:int;
      
      private var bombChargeTime:int = 26;
      
      private var bombChargeTimeCounter:int;
      
      private var bombReloadTime:int;
      
      private var bombReloadTimeCounter:int;
      
      private var §_-NY§:Point;
      
      private var areaAttackRangeWidth:int;
      
      private var §package§:int;
      
      private var §_-GB§:int;
      
      public function EnemyThing(param1:int, param2:Array, param3:int = 0, param4:Point = null, param5:Boolean = false)
      {
         this.§_-S0§ = new Point();
         addFrameScript(23,this.frame24,47,this.frame48,70,this.frame71,71,this.frame72,100,this.frame101,126,this.frame127,145,this.frame146,149,this.frame150,182,this.frame183,209,this.frame210,220,this.frame221);
         super(param1,param2);
         if(param4 != null)
         {
            this.§_-9I§(param3);
            this.x = param4.x;
            this.y = param4.y;
            this.§_-5Z§ = param5;
            this.isActive = false;
            this.isRespawning = true;
            this.respawnTime = 32;
         }
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.isFlying = this.cRoot.gameSettings.enemies.theThing.isFlying;
         this.level = 1;
         this.attackChargeTime = 30;
         this.size = this.cRoot.gameSettings.enemies.theThing.size;
         this.health = this.initHealth = this.cRoot.gameSettings.enemies.theThing.health;
         this.speed = this.cRoot.gameSettings.enemies.theThing.speed;
         this.armor = this.cRoot.gameSettings.enemies.theThing.armor;
         this.magicArmor = this.cRoot.gameSettings.enemies.theThing.magicArmor;
         this.dodge = this.cRoot.gameSettings.enemies.theThing.dodge;
         if(this.§_-5Z§)
         {
            this.gold = 0;
         }
         else
         {
            this.gold = this.cRoot.gameSettings.enemies.theThing.gold;
         }
         this.cost = this.cRoot.gameSettings.enemies.theThing.cost;
         this.minDamage = this.cRoot.gameSettings.enemies.theThing.minDamage;
         this.maxDamage = this.cRoot.gameSettings.enemies.theThing.maxDamage;
         this.attackReloadTime = this.cRoot.gameSettings.enemies.yeti.attackReloadTime - this.attackChargeTime;
         this.xSoldierAdjust = this.cRoot.gameSettings.enemies.theThing.xSoldierAdjust;
         this.xAdjust = this.cRoot.gameSettings.enemies.theThing.xAdjust;
         this.yAdjust = this.cRoot.gameSettings.enemies.theThing.yAdjust;
         this.nodeMarginError = this.cRoot.gameSettings.enemies.theThing.speed + 0.1;
         this.areaAttackRangeWidth = this.cRoot.gameSettings.enemies.theThing.areaAttackRangeWidth;
         this.§package§ = this.cRoot.gameSettings.enemies.theThing.areaAttackRangeWidth * this.cRoot.gameSettings.rangeRatio;
         this.§_-GB§ = this.cRoot.gameSettings.enemies.theThing.areaAttackMaxEnemies;
         this.bombReloadTime = this.cRoot.gameSettings.enemies.theThing.bombCoolDown;
         this.bombRangeWidth = this.cRoot.gameSettings.enemies.theThing.bombRange + this.getRandom(-70,30);
         this.bombRangeHeight = this.bombRangeWidth * this.cRoot.gameSettings.rangeRatio;
         this.bombMinRange = this.cRoot.gameSettings.enemies.theThing.bombMinRange;
         this.§_-Lq§ = true;
         this.§_-AD§ = 0;
         this.regenerateTime = this.cRoot.gameSettings.enemies.theThing.regenerateTime;
         this.regenerateHealPoints = this.cRoot.gameSettings.enemies.theThing.regenerateHealPoints;
         this.§_-Jc§ = new §_-Ov§(new Point(0,-53),this.health,this.initHealth);
         if(this.isRespawning)
         {
            this.§_-HB§();
            this.gotoAndPlay("respawning");
         }
         else
         {
            this.addChild(§_-Jc§);
            this.§_-R2§ = "";
            this.getFacing();
         }
         this.§_-NA§ = 43;
         this.§_-C-§ = 51;
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.tIconName = "thing";
         param1.eName = Locale.loadStringEx("ENEMY_THE_THING_NAME",Locale.getDefaultLang());
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
            case "throwingEnd":
               break;
            case "respawningEnd":
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
         this.bombOnTarget = false;
      }
      
      override public function specialPower() : Boolean
      {
         if(!this.§_-Qn§)
         {
            if(this.isBlocked)
            {
               if(this.bombOnTarget)
               {
                  this.bombOnTarget = false;
               }
               return false;
            }
            if(this.bombReloadTimeCounter < this.bombReloadTime)
            {
               this.bombReloadTimeCounter++;
               return this.bombOnTarget;
            }
            if(!this.getBombTarget())
            {
               if(this.bombOnTarget == true)
               {
                  this.§_-4Y§ = false;
                  this.§_-R2§ = "";
                  this.getFacing();
               }
               this.bombOnTarget = false;
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
            this.bombOnTarget = true;
            this.bombChargeTimeCounter = 0;
            this.gotoAndPlay("throwing");
            return true;
         }
         if(this.bombChargeTimeCounter < this.bombChargeTime)
         {
            this.bombChargeTimeCounter++;
            if(this.bombChargeTimeCounter == 14)
            {
               this.cRoot.bullets.addChild(new BombThing(new Point(this.x + 7,this.y - 38),this.§_-S0§));
            }
            return true;
         }
         this.§_-Qn§ = false;
         this.bombReloadTimeCounter = 0;
         return true;
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
      
      private function getAttackPoint() : Point
      {
         if(this.scaleX == 1)
         {
            return new Point(this.x + 30,this.y);
         }
         return new Point(this.x - 30,this.y);
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
            this.cRoot.decals.addChild(new HitGroundSmokeDecal(new Point(this.x,this.y),this.scaleX));
            this.cRoot.bullets.addChild(new HitGroundSmoke(new Point(this.x,this.y),this.scaleX));
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
         this.cRoot.game.gameSounds.playEnemyBigDead();
      }
      
      function frame24() : *
      {
         gotoAndPlay("walking");
      }
      
      function frame48() : *
      {
         gotoAndPlay("walkingUp");
      }
      
      function frame71() : *
      {
         gotoAndPlay("walkingDown");
      }
      
      function frame72() : *
      {
         stop();
      }
      
      function frame101() : *
      {
         stop();
      }
      
      function frame127() : *
      {
         stop();
      }
      
      function frame146() : *
      {
         stop();
      }
      
      function frame150() : *
      {
         stop();
      }
      
      function frame183() : *
      {
         stop();
      }
      
      function frame210() : *
      {
         stop();
      }
      
      function frame221() : *
      {
         stop();
      }
   }
}
