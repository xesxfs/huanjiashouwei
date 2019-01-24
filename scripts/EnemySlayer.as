package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class EnemySlayer extends EnemyCommon
   {
       
      
      public var effect_Healing:MovieClip;
      
      public var effect_HolyStrike:MovieClip;
      
      public var effect_burn:MovieClip;
      
      public var effect_stun:MovieClip;
      
      public var debuff_Cursed:MovieClip;
      
      public var effect_TeslaHit:MovieClip;
      
      public var debuff_Poison:MovieClip;
      
      public var effect_Sniper:MovieClip;
      
      public function EnemySlayer(param1:int, param2:Array)
      {
         addFrameScript(21,this.frame22,43,this.frame44,65,this.frame66,66,this.frame67,85,this.frame86,104,this.frame105,109,this.frame110,127,this.frame128,138,this.frame139);
         super(param1,param2);
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.isFlying = this.cRoot.gameSettings.enemies.slayer.isFlying;
         this.level = 1;
         this.attackChargeTime = 13;
         this.size = this.cRoot.gameSettings.enemies.slayer.size;
         this.health = this.initHealth = this.cRoot.gameSettings.enemies.slayer.health;
         this.speed = this.cRoot.gameSettings.enemies.slayer.speed;
         this.armor = this.cRoot.gameSettings.enemies.slayer.armor;
         this.magicArmor = this.cRoot.gameSettings.enemies.slayer.magicArmor;
         this.dodge = this.cRoot.gameSettings.enemies.slayer.dodge;
         this.gold = this.cRoot.gameSettings.enemies.slayer.gold;
         this.cost = this.cRoot.gameSettings.enemies.slayer.cost;
         this.minDamage = this.cRoot.gameSettings.enemies.slayer.minDamage;
         this.maxDamage = this.cRoot.gameSettings.enemies.slayer.maxDamage;
         this.attackReloadTime = this.cRoot.gameSettings.enemies.slayer.attackReloadTime - this.attackChargeTime;
         this.xSoldierAdjust = this.cRoot.gameSettings.enemies.slayer.xSoldierAdjust;
         this.xAdjust = this.cRoot.gameSettings.enemies.slayer.xAdjust;
         this.yAdjust = this.cRoot.gameSettings.enemies.slayer.yAdjust;
         this.nodeMarginError = this.cRoot.gameSettings.enemies.slayer.speed + 0.1;
         this.§_-Jc§ = new §_-Ov§(new Point(0,-39),this.health,this.initHealth);
         this.addChild(§_-Jc§);
         this.§_-R2§ = "";
         this.getFacing();
         this.§_-NA§ = 23;
         this.§_-C-§ = 41;
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.tIconName = "slayer";
         param1.eName = Locale.loadStringEx("ENEMY_SLAYER_NAME",Locale.getDefaultLang());
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
      
      function frame86() : *
      {
         stop();
      }
      
      function frame105() : *
      {
         stop();
      }
      
      function frame110() : *
      {
         stop();
      }
      
      function frame128() : *
      {
         stop();
      }
      
      function frame139() : *
      {
         stop();
      }
   }
}
