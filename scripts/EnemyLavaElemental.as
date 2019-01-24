package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.casalib.math.geom.Ellipse;
   
   public class EnemyLavaElemental extends EnemyCommon
   {
       
      
      public var effect_Healing:MovieClip;
      
      public var effect_HolyStrike:MovieClip;
      
      public var effect_burn:MovieClip;
      
      public var effect_stun:MovieClip;
      
      public var debuff_Cursed:MovieClip;
      
      public var effect_TeslaHit:MovieClip;
      
      public var debuff_Poison:MovieClip;
      
      public var effect_Sniper:MovieClip;
      
      private var §_-NY§:Point;
      
      private var areaAttackRangeWidth:int;
      
      private var §package§:int;
      
      private var §_-GB§:int;
      
      public function EnemyLavaElemental(param1:int, param2:Array, param3:int = 0, param4:Point = null)
      {
         addFrameScript(24,this.frame25,48,this.frame49,71,this.frame72,72,this.frame73,101,this.frame102,120,this.frame121,125,this.frame126,152,this.frame153,181,this.frame182,192,this.frame193);
         super(param1,param2);
         if(param4 != null)
         {
            this.§_-9I§(param3 + 2);
            this.x = param4.x;
            this.y = param4.y;
            this.isActive = false;
            this.isRespawning = true;
            this.respawnTime = 40;
         }
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.isFlying = this.cRoot.gameSettings.enemies.lavaElemental.isFlying;
         this.level = 1;
         this.attackChargeTime = 28;
         this.canPoison = false;
         this.attackChargeTime = 20;
         this.§_-4q§ = "BloodGrey";
         this.size = this.cRoot.gameSettings.enemies.lavaElemental.size;
         this.health = this.initHealth = this.cRoot.gameSettings.enemies.lavaElemental.health;
         this.speed = this.cRoot.gameSettings.enemies.lavaElemental.speed;
         this.armor = this.cRoot.gameSettings.enemies.lavaElemental.armor;
         this.magicArmor = this.cRoot.gameSettings.enemies.lavaElemental.magicArmor;
         this.dodge = this.cRoot.gameSettings.enemies.lavaElemental.dodge;
         this.gold = this.cRoot.gameSettings.enemies.lavaElemental.gold;
         this.cost = this.cRoot.gameSettings.enemies.lavaElemental.cost;
         this.attackReloadTime = this.cRoot.gameSettings.enemies.lavaElemental.attackReloadTime - this.attackChargeTime;
         this.xSoldierAdjust = this.cRoot.gameSettings.enemies.lavaElemental.xSoldierAdjust;
         this.xAdjust = this.cRoot.gameSettings.enemies.lavaElemental.xAdjust;
         this.yAdjust = this.cRoot.gameSettings.enemies.lavaElemental.yAdjust;
         this.nodeMarginError = this.cRoot.gameSettings.enemies.lavaElemental.speed + 0.1;
         this.minDamage = this.cRoot.gameSettings.enemies.lavaElemental.minDamage;
         this.maxDamage = this.cRoot.gameSettings.enemies.lavaElemental.maxDamage;
         this.areaAttackRangeWidth = this.cRoot.gameSettings.enemies.lavaElemental.areaAttackRangeWidth;
         this.§package§ = this.cRoot.gameSettings.enemies.lavaElemental.areaAttackRangeWidth * this.cRoot.gameSettings.rangeRatio;
         this.§_-GB§ = this.cRoot.gameSettings.enemies.lavaElemental.areaAttackMaxEnemies;
         this.§_-Jc§ = new §_-Ov§(new Point(0,-45),this.health,this.initHealth);
         if(!this.isRespawning)
         {
            this.addChild(§_-Jc§);
            this.§_-R2§ = "";
            this.getFacing();
         }
         else
         {
            this.gotoAndPlay("respawning");
            this.cRoot.game.gameSounds.playElementalDead();
         }
         this.§_-NA§ = 37;
         this.§_-C-§ = 51;
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.tIconName = "lavaelemental";
         param1.eName = Locale.loadStringEx("ENEMY_LAVA_ELEMENTAL_NAME",Locale.getDefaultLang());
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
         this.setDeadBasicStatus();
         this.addBlood();
      }
      
      override public function playDeadSound() : void
      {
         this.cRoot.game.gameSounds.playElementalDead();
      }
      
      function frame25() : *
      {
         gotoAndPlay("walking");
      }
      
      function frame49() : *
      {
         gotoAndPlay("walkingUp");
      }
      
      function frame72() : *
      {
         gotoAndPlay("walkingDown");
      }
      
      function frame73() : *
      {
         stop();
      }
      
      function frame102() : *
      {
         stop();
      }
      
      function frame121() : *
      {
         stop();
      }
      
      function frame126() : *
      {
         stop();
      }
      
      function frame153() : *
      {
         stop();
      }
      
      function frame182() : *
      {
         stop();
      }
      
      function frame193() : *
      {
         stop();
      }
   }
}
