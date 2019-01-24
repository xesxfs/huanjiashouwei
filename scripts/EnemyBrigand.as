package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class EnemyBrigand extends EnemyCommon
   {
       
      
      public var effect_Healing:MovieClip;
      
      public var effect_HolyStrike:MovieClip;
      
      public var effect_burn:MovieClip;
      
      public var effect_stun:MovieClip;
      
      public var debuff_Cursed:MovieClip;
      
      public var effect_TeslaHit:MovieClip;
      
      public var debuff_Poison:MovieClip;
      
      public var effect_Sniper:MovieClip;
      
      public function EnemyBrigand(param1:int, param2:Array)
      {
         addFrameScript(21,this.frame22,43,this.frame44,65,this.frame66,66,this.frame67,78,this.frame79,97,this.frame98,101,this.frame102,111,this.frame112,122,this.frame123);
         super(param1,param2);
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.isFlying = this.cRoot.gameSettings.enemies.brigand.isFlying;
         this.level = 1;
         this.attackChargeTime = 13;
         this.size = this.cRoot.gameSettings.enemies.brigand.size;
         this.health = this.initHealth = this.cRoot.gameSettings.enemies.brigand.health;
         this.speed = this.cRoot.gameSettings.enemies.brigand.speed;
         this.armor = this.cRoot.gameSettings.enemies.brigand.armor;
         this.magicArmor = this.cRoot.gameSettings.enemies.brigand.magicArmor;
         this.dodge = this.cRoot.gameSettings.enemies.brigand.dodge;
         this.gold = this.cRoot.gameSettings.enemies.brigand.gold;
         this.cost = this.cRoot.gameSettings.enemies.brigand.cost;
         this.minDamage = this.cRoot.gameSettings.enemies.brigand.minDamage;
         this.maxDamage = this.cRoot.gameSettings.enemies.brigand.maxDamage;
         this.attackReloadTime = this.cRoot.gameSettings.enemies.brigand.attackReloadTime - this.attackChargeTime;
         this.xSoldierAdjust = this.cRoot.gameSettings.enemies.brigand.xSoldierAdjust;
         this.xAdjust = this.cRoot.gameSettings.enemies.brigand.xAdjust;
         this.yAdjust = this.cRoot.gameSettings.enemies.brigand.yAdjust;
         this.nodeMarginError = this.cRoot.gameSettings.enemies.brigand.speed + 0.1;
         this.§_-Jc§ = new §_-H8§(new Point(0,-25),this.health,this.initHealth);
         this.addChild(§_-Jc§);
         this.§_-R2§ = "";
         this.getFacing();
         this.§_-NA§ = 12;
         this.§_-C-§ = 24;
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.tIconName = "brigand";
         param1.eName = Locale.loadStringEx("ENEMY_BRIGAND_NAME",Locale.getDefaultLang());
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
      
      function frame79() : *
      {
         stop();
      }
      
      function frame98() : *
      {
         stop();
      }
      
      function frame102() : *
      {
         stop();
      }
      
      function frame112() : *
      {
         stop();
      }
      
      function frame123() : *
      {
         stop();
      }
   }
}
