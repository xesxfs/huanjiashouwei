package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.casalib.math.geom.Ellipse;
   
   public class EnemyPillager extends EnemyCommon
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
      
      public function EnemyPillager(param1:int, param2:Array)
      {
         addFrameScript(25,this.frame26,51,this.frame52,77,this.frame78,78,this.frame79,102,this.frame103,121,this.frame122,125,this.frame126,143,this.frame144,154,this.frame155);
         super(param1,param2);
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.isFlying = this.cRoot.gameSettings.enemies.pillager.isFlying;
         this.level = 1;
         this.attackChargeTime = 23;
         this.size = this.cRoot.gameSettings.enemies.pillager.size;
         this.health = this.initHealth = this.cRoot.gameSettings.enemies.pillager.health;
         this.speed = this.cRoot.gameSettings.enemies.pillager.speed;
         this.armor = this.cRoot.gameSettings.enemies.pillager.armor;
         this.magicArmor = this.cRoot.gameSettings.enemies.pillager.magicArmor;
         this.dodge = this.cRoot.gameSettings.enemies.pillager.dodge;
         this.gold = this.cRoot.gameSettings.enemies.pillager.gold;
         this.cost = this.cRoot.gameSettings.enemies.pillager.cost;
         this.minDamage = this.cRoot.gameSettings.enemies.pillager.minDamage;
         this.maxDamage = this.cRoot.gameSettings.enemies.pillager.maxDamage;
         this.attackReloadTime = this.cRoot.gameSettings.enemies.pillager.attackReloadTime - this.attackChargeTime;
         this.xSoldierAdjust = this.cRoot.gameSettings.enemies.pillager.xSoldierAdjust;
         this.xAdjust = this.cRoot.gameSettings.enemies.pillager.xAdjust;
         this.yAdjust = this.cRoot.gameSettings.enemies.pillager.yAdjust;
         this.nodeMarginError = this.cRoot.gameSettings.enemies.pillager.speed + 0.1;
         this.areaAttackRangeWidth = this.cRoot.gameSettings.enemies.pillager.areaAttackRangeWidth;
         this.§package§ = this.cRoot.gameSettings.enemies.pillager.areaAttackRangeWidth * this.cRoot.gameSettings.rangeRatio;
         this.§_-GB§ = this.cRoot.gameSettings.enemies.pillager.areaAttackMaxEnemies;
         this.§_-Jc§ = new §_-Ov§(new Point(0,-54),this.health,this.initHealth);
         this.addChild(§_-Jc§);
         this.§_-R2§ = "";
         this.getFacing();
         this.§_-NA§ = 120;
         this.§_-C-§ = 92;
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.tIconName = "pillager";
         param1.eName = Locale.loadStringEx("ENEMY_PILLAGER_NAME",Locale.getDefaultLang());
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
            this.cRoot.game.gameSounds.playAxeSound();
         }
         return false;
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
               _loc2_.setDamage(this.getDamage(),true);
               _loc1_++;
               if(_loc1_ != this.§_-GB§)
               {
                  continue;
               }
               break;
            }
         }
      }
      
      private function onRange(param1:Soldier) : Boolean
      {
         var _loc2_:* = new Ellipse(this.§_-NY§.x - this.areaAttackRangeWidth / 2,this.§_-NY§.y - this.§package§ / 2,this.areaAttackRangeWidth,this.§package§);
         return _loc2_.containsPoint(new Point(param1.x,param1.y));
      }
      
      private function getAttackPoint() : Point
      {
         if(this.scaleX == 1)
         {
            return new Point(this.x + 30,this.y);
         }
         return new Point(this.x - 30,this.y);
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
         this.cRoot.game.gameSounds.playEnemyHumanDeadSound();
      }
      
      function frame26() : *
      {
         gotoAndPlay("walking");
      }
      
      function frame52() : *
      {
         gotoAndPlay("walkingUp");
      }
      
      function frame78() : *
      {
         gotoAndPlay("walkingDown");
      }
      
      function frame79() : *
      {
         stop();
      }
      
      function frame103() : *
      {
         stop();
      }
      
      function frame122() : *
      {
         stop();
      }
      
      function frame126() : *
      {
         stop();
      }
      
      function frame144() : *
      {
         stop();
      }
      
      function frame155() : *
      {
         stop();
      }
   }
}
