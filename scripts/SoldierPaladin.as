package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.casalib.math.geom.Ellipse;
   
   public class SoldierPaladin extends Soldier
   {
       
      
      public var respawnOnInit:Boolean;
      
      private var healingLevel:int;
      
      private var §_-Iy§:Boolean = false;
      
      private var healingMin:int;
      
      private var healingMax:int;
      
      private var healingReloadTime:int;
      
      private var healingReloadTimeCounter:int;
      
      private var healingChargeTime:int;
      
      private var healingChargeTimeCounter:int;
      
      private var healingSound:String;
      
      private var holyStrikeLevel:int;
      
      private var §_-0q§:Boolean;
      
      private var holyStrikeRangeWidth:int;
      
      private var holyStrikeRangeHeight:int;
      
      private var holyStrikeMinEnemies:int;
      
      private var holyStrikeMinDamage:int;
      
      private var holyStrikeMaxDamage:int;
      
      private var holyStrikeChance:int;
      
      private var holyStrikeChargeTime:int;
      
      private var holyStrikeChargeTimeCounter:int;
      
      private var §_-EP§:String;
      
      public function SoldierPaladin(param1:Point, param2:Point, param3:Tower, param4:Boolean)
      {
         addFrameScript(0,this.frame1,16,this.frame17,27,this.frame28,58,this.frame59,88,this.frame89,95,this.frame96);
         super(param1,param2,param3,20);
         this.respawnOnInit = param4;
         this.healingSound = Math.random().toString();
         this.§_-EP§ = Math.random().toString();
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      override protected function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.maxSize = this.cRoot.gameSettings.soldiers.paladin.maxSize;
         this.rangeWidth = this.cRoot.gameSettings.soldiers.paladin.range;
         this.rangeHeight = this.cRoot.gameSettings.soldiers.paladin.range * this.cRoot.gameSettings.rangeRatio;
         this.health = this.initHealth = this.cRoot.gameSettings.soldiers.paladin.health;
         this.§_-Rd§ = this.cRoot.gameSettings.soldiers.paladin.regen;
         this.regenerateTime = this.cRoot.gameSettings.soldiers.paladin.regenReload;
         this.armor = this.cRoot.gameSettings.soldiers.paladin.armor;
         this.armor = this.cRoot.gameSettings.soldiers.paladin.armor;
         this.minDamage = this.cRoot.gameSettings.soldiers.paladin.minDamage;
         this.maxDamage = this.cRoot.gameSettings.soldiers.paladin.maxDamage;
         this.deadTime = this.cRoot.gameSettings.soldiers.paladin.respawn;
         this.attackReloadTime = this.cRoot.gameSettings.soldiers.paladin.reload;
         this.healingChargeTime = 20;
         this.healingChargeTimeCounter = 0;
         this.healingReloadTimeCounter = 0;
         this.healingReloadTime = this.cRoot.gameSettings.soldiers.paladin.healingCoolDown;
         this.holyStrikeChargeTime = 31;
         this.holyStrikeChance = this.cRoot.gameSettings.soldiers.paladin.holyStrikeChance;
         this.holyStrikeRangeWidth = this.cRoot.gameSettings.soldiers.paladin.holyStrikeRange;
         this.holyStrikeRangeHeight = this.cRoot.gameSettings.soldiers.paladin.holyStrikeRange * this.cRoot.gameSettings.rangeRatio;
         this.holyStrikeMinEnemies = this.cRoot.gameSettings.soldiers.paladin.holyStrikeMinEnemies;
         this.respawnTime = 1;
         this.attackChargeTime = 20;
         this.attackChargeDamageTime = 5;
         this.speed = 2;
         this.idleTime = 30;
         this.xAdjust = 2;
         this.§_-Jc§ = new §_-H8§(new Point(0,-25),this.health,this.initHealth);
         this.addChild(§_-Jc§);
         if(this.respawnOnInit)
         {
            this.visible = false;
         }
         else if(this.isFighting)
         {
            this.§_-8v§();
         }
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.sIconName = "paladin";
         param1.sName = Locale.loadStringEx("SOLDIER_PALADIN_RANDOM_" + this.nameIndex + "_NAME",Locale.getDefaultLang());
         param1.sRespawn = this.cRoot.gameSettings.soldiers.paladin.respawn / this.cRoot.gameSettings.framesRate + "s";
      }
      
      override public function pause() : void
      {
         this.stop();
         this.§_-f§();
      }
      
      override public function unPause() : void
      {
         switch(this.currentFrameLabel)
         {
            case "runningEnd":
               this.gotoAndPlay("running");
               break;
            case "healEnd":
               break;
            case "holyStrikeEnd":
               break;
            case "attack1End":
               break;
            case "attack2End":
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
      
      override protected function runSpecial() : Boolean
      {
         if(this.healingLevel != 0 && this.§_-Dk§())
         {
            return true;
         }
         if(this.§_-0q§ && this.§_-7Y§())
         {
            return true;
         }
         return false;
      }
      
      public function upgradeHealing(param1:int) : void
      {
         this.healingLevel = param1;
         this.healingMin = this.cRoot.gameSettings.soldiers.paladin.healingMin * this.healingLevel;
         this.healingMax = this.cRoot.gameSettings.soldiers.paladin.healingMax * this.healingLevel;
      }
      
      public function upgradeHolyStrike(param1:int) : void
      {
         this.holyStrikeLevel = param1;
         this.holyStrikeMinDamage = this.cRoot.gameSettings.soldiers.paladin.holyStrikeMinDamage * this.holyStrikeLevel;
         this.holyStrikeMaxDamage = this.cRoot.gameSettings.soldiers.paladin.holyStrikeMaxDamage * this.holyStrikeLevel;
      }
      
      public function upgradeShiledOfValor() : void
      {
         this.armor = this.armor + this.cRoot.gameSettings.soldiers.paladin.shieldArmor;
         this.maxSize = this.cRoot.gameSettings.soldiers.paladin.shieldMaxSize;
      }
      
      override protected function readyToAttack() : Boolean
      {
         this.attackReloadTimeCounter++;
         if(this.attackReloadTimeCounter == this.attackReloadTime)
         {
            if(!(this.holyStrikeLevel != 0 && !this.§_-Iy§ && this.§_-7Y§()))
            {
               this.chargeAttack();
            }
            this.attackReloadTimeCounter = 0;
            return true;
         }
         return false;
      }
      
      override public function stopOnDead() : void
      {
         this.§_-0q§ = false;
         this.§_-Iy§ = false;
      }
      
      override protected function chargeAttack() : void
      {
         this.isCharging = true;
         if(Math.random() > 0.5)
         {
            this.gotoAndPlay("attack1");
         }
         else
         {
            this.gotoAndPlay("attack2");
         }
      }
      
      private function §_-Dk§() : Boolean
      {
         if(this.§_-0q§)
         {
            return false;
         }
         if(!this.§_-Iy§)
         {
            if(this.healingReloadTimeCounter < this.healingReloadTime)
            {
               this.healingReloadTimeCounter++;
               return false;
            }
            if(!this.§_-LD§())
            {
               return false;
            }
            this.§_-Iy§ = true;
            this.healingChargeTimeCounter = 0;
            this.gotoAndPlay("heal");
            this.cRoot.game.gameSounds.playPaladinHealingEffect(this.healingSound);
            return true;
         }
         if(this.healingChargeTimeCounter < this.healingChargeTime)
         {
            this.healingChargeTimeCounter++;
            return true;
         }
         this.heal(this.getHealPoints());
         this.§_-Iy§ = false;
         this.healingReloadTimeCounter = 0;
         this.§_-J9§();
         this.cRoot.game.gameSounds.removeSound(this.healingSound);
         return false;
      }
      
      private function getHealPoints() : int
      {
         var _loc1_:int = this.healingMin + Math.ceil(Math.random() * (this.healingMax - this.healingMin));
         this.cRoot.game.gameAchievement.healMe(_loc1_,this.cRoot);
         return _loc1_;
      }
      
      private function §_-7Y§() : Boolean
      {
         if(this.§_-Iy§)
         {
            return false;
         }
         if(!this.§_-0q§)
         {
            if(Math.random() * 100 > this.holyStrikeChance)
            {
               return false;
            }
            if(!this.§_-PV§())
            {
               return false;
            }
            this.§_-0q§ = true;
            this.holyStrikeChargeTimeCounter = 0;
            this.gotoAndPlay("holyStrike");
            return true;
         }
         if(this.holyStrikeChargeTimeCounter < this.holyStrikeChargeTime)
         {
            this.holyStrikeChargeTimeCounter++;
            if(this.holyStrikeChargeTimeCounter == 15)
            {
               this.cRoot.decals.addChild(new HolyStrike(new Point(this.x,this.y),this.cRoot));
               this.holyStrike();
            }
            return true;
         }
         this.§_-0q§ = false;
         this.§_-J9§();
         return false;
      }
      
      private function §_-PV§() : Boolean
      {
         var _loc2_:Enemy = null;
         var _loc1_:int = 0;
         for each(_loc2_ in this.cRoot.enemies)
         {
            if(_loc2_.isActive && !_loc2_.isFlying && this.onRange(_loc2_))
            {
               _loc1_++;
               if(_loc1_ == this.holyStrikeMinEnemies)
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      private function holyStrike() : void
      {
         var _loc1_:Enemy = null;
         for each(_loc1_ in this.cRoot.enemies)
         {
            if(_loc1_.isActive && !_loc1_.isFlying && this.onRange(_loc1_))
            {
               MovieClip(_loc1_).holyStrike(this.getHolyStrikePoints());
            }
         }
      }
      
      private function getHolyStrikePoints() : int
      {
         return this.holyStrikeMinDamage + Math.ceil(Math.random() * (this.holyStrikeMaxDamage - this.holyStrikeMinDamage));
      }
      
      private function holyStrikeOnRange(param1:Enemy) : Boolean
      {
         var _loc2_:* = new Ellipse(this.x - this.holyStrikeRangeWidth / 2,this.y - this.holyStrikeRangeHeight / 2,this.holyStrikeRangeWidth,this.holyStrikeRangeHeight);
         return _loc2_.containsPoint(new Point(param1.x,param1.y));
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame17() : *
      {
         stop();
      }
      
      function frame28() : *
      {
         stop();
      }
      
      function frame59() : *
      {
         stop();
      }
      
      function frame89() : *
      {
         gotoAndStop(1);
      }
      
      function frame96() : *
      {
         stop();
      }
   }
}
