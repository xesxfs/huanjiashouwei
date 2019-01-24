package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.casalib.math.geom.Ellipse;
   
   public class EnemyYeti extends EnemyCommon
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
      
      public function EnemyYeti(param1:int, param2:Array, param3:int = 0, param4:Point = null)
      {
         addFrameScript(24,this.frame25,48,this.frame49,71,this.frame72,72,this.frame73,101,this.frame102,120,this.frame121,124,this.frame125,154,this.frame155,165,this.frame166);
         super(param1,param2);
         if(param4 != null)
         {
            this.§_-9I§(param3 + 2);
            this.x = param4.x;
            this.y = param4.y;
         }
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.isFlying = this.cRoot.gameSettings.enemies.yeti.isFlying;
         this.level = 1;
         this.attackChargeTime = 30;
         this.size = this.cRoot.gameSettings.enemies.yeti.size;
         this.health = this.initHealth = this.cRoot.gameSettings.enemies.yeti.health;
         this.speed = this.cRoot.gameSettings.enemies.yeti.speed;
         this.armor = this.cRoot.gameSettings.enemies.yeti.armor;
         this.magicArmor = this.cRoot.gameSettings.enemies.yeti.magicArmor;
         this.dodge = this.cRoot.gameSettings.enemies.yeti.dodge;
         this.gold = this.cRoot.gameSettings.enemies.yeti.gold;
         this.cost = this.cRoot.gameSettings.enemies.yeti.cost;
         this.minDamage = this.cRoot.gameSettings.enemies.yeti.minDamage;
         this.maxDamage = this.cRoot.gameSettings.enemies.yeti.maxDamage;
         this.attackReloadTime = this.cRoot.gameSettings.enemies.yeti.attackReloadTime - this.attackChargeTime;
         this.xSoldierAdjust = this.cRoot.gameSettings.enemies.yeti.xSoldierAdjust;
         this.xAdjust = this.cRoot.gameSettings.enemies.yeti.xAdjust;
         this.yAdjust = this.cRoot.gameSettings.enemies.yeti.yAdjust;
         this.nodeMarginError = this.cRoot.gameSettings.enemies.yeti.speed + 0.1;
         this.areaAttackRangeWidth = this.cRoot.gameSettings.enemies.yeti.areaAttackRangeWidth;
         this.§package§ = this.cRoot.gameSettings.enemies.yeti.areaAttackRangeWidth * this.cRoot.gameSettings.rangeRatio;
         this.§_-GB§ = this.cRoot.gameSettings.enemies.yeti.areaAttackMaxEnemies;
         this.§_-Jc§ = new §_-Ov§(new Point(0,-45),this.health,this.initHealth);
         this.addChild(§_-Jc§);
         this.§_-R2§ = "";
         this.getFacing();
         this.§_-NA§ = 33;
         this.§_-C-§ = 51;
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.tIconName = "yeti";
         param1.eName = Locale.loadStringEx("ENEMY_YETI_NAME",Locale.getDefaultLang());
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
      
      function frame125() : *
      {
         stop();
      }
      
      function frame155() : *
      {
         stop();
      }
      
      function frame166() : *
      {
         stop();
      }
   }
}
