package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.casalib.math.geom.Ellipse;
   
   public class EnemyShaman extends EnemyCommon
   {
       
      
      public var effect_Healing:MovieClip;
      
      public var effect_HolyStrike:MovieClip;
      
      public var effect_burn:MovieClip;
      
      public var effect_stun:MovieClip;
      
      public var debuff_Cursed:MovieClip;
      
      public var effect_TeslaHit:MovieClip;
      
      public var debuff_Poison:MovieClip;
      
      public var effect_Sniper:MovieClip;
      
      private var §_-Iy§:Boolean;
      
      private var healingCooldownTime:int = 120;
      
      private var healingCooldownTimeCounter:int;
      
      private var healingAnimationTime:int = 28;
      
      private var healingAnimationTimeCounter:int;
      
      private var healingAnimationStartTime:int = 14;
      
      private var healingRangeWidth:int;
      
      private var healingRangeHeight:int;
      
      private var healingPoints:int;
      
      private var healMaxEnemies:int;
      
      public function EnemyShaman(param1:int, param2:Array)
      {
         addFrameScript(21,this.frame22,43,this.frame44,65,this.frame66,66,this.frame67,82,this.frame83,110,this.frame111,129,this.frame130,133,this.frame134,148,this.frame149,159,this.frame160);
         super(param1,param2);
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.isFlying = this.cRoot.gameSettings.enemies.shaman.isFlying;
         this.level = 1;
         this.attackChargeTime = 17;
         this.size = this.cRoot.gameSettings.enemies.shaman.size;
         this.health = this.initHealth = this.cRoot.gameSettings.enemies.shaman.health;
         this.speed = this.cRoot.gameSettings.enemies.shaman.speed;
         this.armor = this.cRoot.gameSettings.enemies.shaman.armor;
         this.magicArmor = this.cRoot.gameSettings.enemies.shaman.magicArmor;
         this.dodge = this.cRoot.gameSettings.enemies.shaman.dodge;
         this.gold = this.cRoot.gameSettings.enemies.shaman.gold;
         this.cost = this.cRoot.gameSettings.enemies.shaman.cost;
         this.minDamage = this.cRoot.gameSettings.enemies.shaman.minDamage;
         this.maxDamage = this.cRoot.gameSettings.enemies.shaman.maxDamage;
         this.attackReloadTime = this.cRoot.gameSettings.enemies.shaman.attackReloadTime - this.attackChargeTime;
         this.xSoldierAdjust = this.cRoot.gameSettings.enemies.shaman.xSoldierAdjust;
         this.xAdjust = this.cRoot.gameSettings.enemies.shaman.xAdjust;
         this.yAdjust = this.cRoot.gameSettings.enemies.shaman.yAdjust;
         this.nodeMarginError = this.cRoot.gameSettings.enemies.shaman.speed + 0.1;
         this.healingCooldownTime = this.cRoot.gameSettings.enemies.shaman.healCoolDown;
         this.healingRangeWidth = this.cRoot.gameSettings.enemies.shaman.healRange;
         this.healingRangeHeight = this.cRoot.gameSettings.enemies.shaman.healRange * this.cRoot.gameSettings.rangeRatio;
         this.healingPoints = this.cRoot.gameSettings.enemies.shaman.healPoints;
         this.healMaxEnemies = this.cRoot.gameSettings.enemies.shaman.healMaxEnemies;
         this.§_-Jc§ = new §_-H8§(new Point(0,-25),this.health,this.initHealth);
         this.addChild(§_-Jc§);
         this.§_-R2§ = "";
         this.getFacing();
         this.§_-NA§ = 26;
         this.§_-C-§ = 41;
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.tIconName = "shaman";
         param1.eName = Locale.loadStringEx("ENEMY_SHAMAN_NAME",Locale.getDefaultLang());
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
            if(_loc1_.isActive && this.§_-LD§(_loc1_) && this.healingOnRange(_loc1_))
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
            if(_loc2_.isActive && this.§_-LD§(_loc2_) && this.healingOnRange(_loc2_))
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
      
      override public function playDeadSound() : void
      {
         this.cRoot.game.gameSounds.playEnemyGoblinDeadSound();
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
      
      function frame83() : *
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
      
      function frame134() : *
      {
         stop();
      }
      
      function frame149() : *
      {
         stop();
      }
      
      function frame160() : *
      {
         stop();
      }
   }
}
