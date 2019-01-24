package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.casalib.math.geom.Ellipse;
   
   public class EnemyNecromancer extends EnemyCommon
   {
       
      
      public var effect_Healing:MovieClip;
      
      public var effect_HolyStrike:MovieClip;
      
      public var effect_burn:MovieClip;
      
      public var effect_stun:MovieClip;
      
      public var debuff_Cursed:MovieClip;
      
      public var effect_TeslaHit:MovieClip;
      
      public var debuff_Poison:MovieClip;
      
      public var effect_Sniper:MovieClip;
      
      private var isSummon:Boolean;
      
      private var summonCooldownTime:int;
      
      private var summonCooldownTimeCounter:int;
      
      private var summonAnimationTime:int = 47;
      
      private var summonAnimationTimeFire:int = 12;
      
      private var summonAnimationTimeCounter:int = 0;
      
      private var summonMaxEnemies:int;
      
      private var summonIndex:int;
      
      private var summonOneTime:int = 4;
      
      private var summonOneTimeCounter:int = 0;
      
      private var §_-S0§:Point;
      
      private var spellTarget:Soldier;
      
      private var spellOnTarget:Boolean;
      
      private var §_-He§:Boolean;
      
      private var spellRangeWidth:int;
      
      private var spellRangeHeight:int;
      
      private var spellMinRange:int;
      
      private var spellChargeTime:int = 23;
      
      private var spellChargeTimeCounter:int;
      
      private var spellReloadTime:int;
      
      private var spellReloadTimeCounter:int;
      
      public function EnemyNecromancer(param1:int, param2:Array)
      {
         this.§_-S0§ = new Point();
         addFrameScript(23,this.frame24,47,this.frame48,69,this.frame70,70,this.frame71,89,this.frame90,115,this.frame116,161,this.frame162,180,this.frame181,185,this.frame186,199,this.frame200,210,this.frame211);
         super(param1,param2);
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.isFlying = this.cRoot.gameSettings.enemies.necromancer.isFlying;
         this.level = 1;
         this.attackChargeTime = 19;
         this.size = this.cRoot.gameSettings.enemies.necromancer.size;
         this.health = this.initHealth = this.cRoot.gameSettings.enemies.necromancer.health;
         this.speed = this.cRoot.gameSettings.enemies.necromancer.speed;
         this.armor = this.cRoot.gameSettings.enemies.necromancer.armor;
         this.magicArmor = this.cRoot.gameSettings.enemies.necromancer.magicArmor;
         this.dodge = this.cRoot.gameSettings.enemies.necromancer.dodge;
         this.gold = this.cRoot.gameSettings.enemies.necromancer.gold;
         this.cost = this.cRoot.gameSettings.enemies.necromancer.cost;
         this.minDamage = this.cRoot.gameSettings.enemies.necromancer.minDamage;
         this.maxDamage = this.cRoot.gameSettings.enemies.necromancer.maxDamage;
         this.attackReloadTime = this.cRoot.gameSettings.enemies.necromancer.attackReloadTime - this.attackChargeTime;
         this.xSoldierAdjust = this.cRoot.gameSettings.enemies.necromancer.xSoldierAdjust;
         this.xAdjust = this.cRoot.gameSettings.enemies.necromancer.xAdjust;
         this.yAdjust = this.cRoot.gameSettings.enemies.necromancer.yAdjust;
         this.nodeMarginError = this.cRoot.gameSettings.enemies.necromancer.speed + 0.1;
         this.summonCooldownTime = this.cRoot.gameSettings.enemies.necromancer.summonCoolDown;
         this.summonMaxEnemies = this.cRoot.gameSettings.enemies.necromancer.summonMaxEnemies;
         this.spellReloadTime = this.cRoot.gameSettings.enemies.necromancer.spellCoolDown;
         this.spellRangeWidth = this.cRoot.gameSettings.enemies.necromancer.spellRange + this.getRandom(-70,30);
         this.spellRangeHeight = this.spellRangeWidth * this.cRoot.gameSettings.rangeRatio;
         this.spellMinRange = this.cRoot.gameSettings.enemies.necromancer.spellMinRange;
         this.§_-Jc§ = new §_-H8§(new Point(0,-25),this.health,this.initHealth);
         this.addChild(§_-Jc§);
         this.§_-R2§ = "";
         this.getFacing();
         this.§_-NA§ = 16;
         this.§_-C-§ = 24;
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.tIconName = "necromancer";
         param1.eName = Locale.loadStringEx("ENEMY_NECROMANCER_NAME",Locale.getDefaultLang());
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
            case "summonEnd":
               break;
            case "spell":
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
         this.isSummon = false;
         this.§_-He§ = false;
      }
      
      override public function block(param1:Soldier) : void
      {
         this.soldier = param1;
         this.isBlocked = true;
         this.isSummon = false;
         this.§_-He§ = false;
         this.gotoAndStop("idle");
      }
      
      override public function specialPower() : Boolean
      {
         this.summonCooldownTimeCounter++;
         this.spellReloadTimeCounter++;
         if(!this.§_-He§ && this.specialSummon())
         {
            return true;
         }
         if(!this.isSummon && this.§_-Qj§())
         {
            return true;
         }
         return false;
      }
      
      public function §_-Qj§() : Boolean
      {
         var _loc1_:Point = null;
         if(!this.§_-He§)
         {
            if(this.isBlocked)
            {
               if(this.spellOnTarget)
               {
                  this.spellOnTarget = false;
               }
               return false;
            }
            if(this.spellReloadTimeCounter < this.spellReloadTime)
            {
               return this.spellOnTarget;
            }
            if(!this.getSpellTarget())
            {
               if(this.spellOnTarget == true)
               {
                  this.§_-4Y§ = false;
                  this.§_-R2§ = "";
                  this.getFacing();
               }
               this.spellOnTarget = false;
               return false;
            }
            if(this.spellTarget.x >= this.x)
            {
               this.scaleX = 1;
               this.§_-Jc§.flip(1);
            }
            else
            {
               this.scaleX = -1;
               this.§_-Jc§.flip(-1);
            }
            this.§_-S0§ = new Point(this.spellTarget.x,this.spellTarget.y - 7);
            this.§_-He§ = true;
            this.§_-4Y§ = true;
            this.spellOnTarget = true;
            this.spellChargeTimeCounter = 0;
            this.gotoAndPlay("spell");
            return true;
         }
         if(this.spellChargeTimeCounter < this.spellChargeTime)
         {
            this.spellChargeTimeCounter++;
            if(this.spellChargeTimeCounter == 13)
            {
               _loc1_ = null;
               if(this.spellTarget == null || !this.spellTarget.isActive)
               {
                  if(!this.getSpellTarget())
                  {
                     _loc1_ = this.§_-S0§;
                  }
               }
               if(this.scaleX == -1)
               {
                  this.cRoot.bullets.addChild(new BoltNecromancer(new Point(this.x + 4,this.y - 17),this.spellTarget,_loc1_));
               }
               else
               {
                  this.cRoot.bullets.addChild(new BoltNecromancer(new Point(this.x - 4,this.y - 17),this.spellTarget,_loc1_));
               }
            }
            return true;
         }
         this.§_-He§ = false;
         this.spellReloadTimeCounter = 0;
         return true;
      }
      
      private function getSpellTarget() : Boolean
      {
         var _loc1_:Soldier = null;
         this.spellTarget = null;
         for each(_loc1_ in this.cRoot.soldiers)
         {
            if(_loc1_.isActive && this.spellOnRange(_loc1_) && this.§_-x§(_loc1_))
            {
               this.spellTarget = _loc1_;
               break;
            }
         }
         if(this.spellTarget != null)
         {
            return true;
         }
         return false;
      }
      
      private function spellOnRange(param1:Soldier) : Boolean
      {
         var _loc2_:* = new Ellipse(this.x - this.spellRangeWidth / 2,this.y - this.spellRangeHeight / 2,this.spellRangeWidth,this.spellRangeHeight);
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
         if(_loc2_ > this.spellMinRange)
         {
            return true;
         }
         return false;
      }
      
      public function specialSummon() : Boolean
      {
         if(this.isBlocked)
         {
            this.summonCooldownTimeCounter = 0;
            return false;
         }
         if(!this.isSummon)
         {
            if(this.summonCooldownTimeCounter < this.summonCooldownTime)
            {
               return false;
            }
            if(this.cRoot.currentSkeletons >= this.cRoot.gameSettings.enemies.necromancer.summonMaxSkeletons)
            {
               return false;
            }
            this.isSummon = true;
            this.gotoAndPlay("summon");
            this.summonAnimationTimeCounter = 0;
            this.summonIndex = 0;
            return true;
         }
         if(this.summonAnimationTimeCounter < this.summonAnimationTime)
         {
            this.summonAnimationTimeCounter++;
            if(this.summonAnimationTimeCounter > this.summonAnimationTimeFire)
            {
               if(this.summonIndex <= this.summonMaxEnemies)
               {
                  if(this.summonOneTimeCounter < this.summonOneTime)
                  {
                     this.summonOneTimeCounter++;
                  }
                  else if(this.cRoot.currentSkeletons < this.cRoot.gameSettings.enemies.necromancer.summonMaxSkeletons)
                  {
                     this.summonSkeleton(this.summonIndex);
                     this.summonIndex++;
                     this.summonOneTimeCounter = 0;
                  }
                  else if(this.summonIndex == 0)
                  {
                     this.summonSkeleton(this.summonIndex);
                     this.summonIndex = this.summonMaxEnemies;
                     this.summonOneTimeCounter = 0;
                  }
               }
            }
            return true;
         }
         this.isSummon = false;
         this.summonCooldownTimeCounter = 0;
         this.§_-R2§ = "";
         if(!this.isBlocked)
         {
            this.getFacing();
         }
         return false;
      }
      
      private function summonSkeleton(param1:int) : void
      {
         switch(param1)
         {
            case 0:
               this.summonIt(this.roadIndex,1,this.currentNode);
               break;
            case 1:
               this.summonIt(this.roadIndex,2,this.currentNode);
               break;
            case 2:
               this.summonIt(this.roadIndex,0,this.currentNode + this.getRandom(3,7));
               break;
            case 3:
               this.summonIt(this.roadIndex,1,this.currentNode + this.getRandom(3,7));
               break;
            case 4:
               this.summonIt(this.roadIndex,2,this.currentNode + this.getRandom(3,7));
               break;
            case 5:
               this.summonIt(this.roadIndex,0,this.currentNode - this.getRandom(3,7));
               break;
            case 6:
               this.summonIt(this.roadIndex,1,this.currentNode - this.getRandom(3,7));
               break;
            case 7:
               this.summonIt(this.roadIndex,2,this.currentNode - this.getRandom(3,7));
         }
      }
      
      private function summonIt(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:Enemy = null;
         if(param3 < 0 || param3 >= this.cRoot.paths[param1][param2].length)
         {
            return;
         }
         if(Math.random() < 0.05)
         {
            _loc4_ = new EnemySkeletonBig(param1,this.cRoot.paths[param1][param2],param3,this.cRoot.paths[param1][param2][param3],true);
         }
         else
         {
            _loc4_ = new EnemySkeleton(param1,this.cRoot.paths[param1][param2],param3,this.cRoot.paths[param1][param2][param3],true);
         }
         this.cRoot.entities.addChild(_loc4_);
         this.cRoot.enemies[_loc4_] = _loc4_;
      }
      
      public function getRandom(param1:*, param2:*) : Number
      {
         var _loc3_:Number = NaN;
         _loc3_ = Math.round(Math.random() * (param2 - param1)) + param1;
         return _loc3_;
      }
      
      function frame24() : *
      {
         gotoAndPlay("walking");
      }
      
      function frame48() : *
      {
         gotoAndPlay("walkingUp");
      }
      
      function frame70() : *
      {
         gotoAndPlay("walkingDown");
      }
      
      function frame71() : *
      {
         stop();
      }
      
      function frame90() : *
      {
         stop();
      }
      
      function frame116() : *
      {
         stop();
      }
      
      function frame162() : *
      {
         stop();
      }
      
      function frame181() : *
      {
         stop();
      }
      
      function frame186() : *
      {
         stop();
      }
      
      function frame200() : *
      {
         stop();
      }
      
      function frame211() : *
      {
         stop();
      }
   }
}
