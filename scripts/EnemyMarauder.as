package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class EnemyMarauder extends EnemyCommon
   {
       
      
      public var effect_Healing:MovieClip;
      
      public var effect_HolyStrike:MovieClip;
      
      public var effect_burn:MovieClip;
      
      public var effect_stun:MovieClip;
      
      public var debuff_Cursed:MovieClip;
      
      public var effect_TeslaHit:MovieClip;
      
      public var debuff_Poison:MovieClip;
      
      public var effect_Sniper:MovieClip;
      
      public function EnemyMarauder(param1:int, param2:Array)
      {
         addFrameScript(21,this.frame22,43,this.frame44,65,this.frame66,66,this.frame67,79,this.frame80,98,this.frame99,103,this.frame104,121,this.frame122,132,this.frame133);
         super(param1,param2);
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.isFlying = this.cRoot.gameSettings.enemies.marauder.isFlying;
         this.level = 1;
         this.attackChargeTime = 13;
         this.size = this.cRoot.gameSettings.enemies.marauder.size;
         this.health = this.initHealth = this.cRoot.gameSettings.enemies.marauder.health;
         this.speed = this.cRoot.gameSettings.enemies.marauder.speed;
         this.armor = this.cRoot.gameSettings.enemies.marauder.armor;
         this.magicArmor = this.cRoot.gameSettings.enemies.marauder.magicArmor;
         this.dodge = this.cRoot.gameSettings.enemies.marauder.dodge;
         this.gold = this.cRoot.gameSettings.enemies.marauder.gold;
         this.cost = this.cRoot.gameSettings.enemies.marauder.cost;
         this.minDamage = this.cRoot.gameSettings.enemies.marauder.minDamage;
         this.maxDamage = this.cRoot.gameSettings.enemies.marauder.maxDamage;
         this.attackReloadTime = this.cRoot.gameSettings.enemies.marauder.attackReloadTime - this.attackChargeTime;
         this.xSoldierAdjust = this.cRoot.gameSettings.enemies.marauder.xSoldierAdjust;
         this.xAdjust = this.cRoot.gameSettings.enemies.marauder.xAdjust;
         this.yAdjust = this.cRoot.gameSettings.enemies.marauder.yAdjust;
         this.nodeMarginError = this.cRoot.gameSettings.enemies.marauder.speed + 0.1;
         this.§_-Jc§ = new §_-Ov§(new Point(0,-39),this.health,this.initHealth);
         this.addChild(§_-Jc§);
         this.§_-R2§ = "";
         this.getFacing();
         this.§_-NA§ = 22;
         this.§_-C-§ = 35;
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.tIconName = "marauder";
         param1.eName = Locale.loadStringEx("ENEMY_MARAUDER_NAME",Locale.getDefaultLang());
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
      
      function frame80() : *
      {
         stop();
      }
      
      function frame99() : *
      {
         stop();
      }
      
      function frame104() : *
      {
         stop();
      }
      
      function frame122() : *
      {
         stop();
      }
      
      function frame133() : *
      {
         stop();
      }
   }
}
