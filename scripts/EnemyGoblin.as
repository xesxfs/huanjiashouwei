package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class EnemyGoblin extends EnemyCommon
   {
       
      
      public var effect_Healing:MovieClip;
      
      public var effect_HolyStrike:MovieClip;
      
      public var effect_burn:MovieClip;
      
      public var effect_stun:MovieClip;
      
      public var debuff_Cursed:MovieClip;
      
      public var effect_TeslaHit:MovieClip;
      
      public var debuff_Poison:MovieClip;
      
      public var effect_Sniper:MovieClip;
      
      public function EnemyGoblin(param1:int, param2:Array)
      {
         addFrameScript(21,this.frame22,43,this.frame44,65,this.frame66,66,this.frame67,81,this.frame82,100,this.frame101,104,this.frame105,119,this.frame120,130,this.frame131);
         super(param1,param2);
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.isFlying = this.cRoot.gameSettings.enemies.goblin.isFlying;
         this.level = 1;
         this.attackChargeTime = 14;
         this.size = this.cRoot.gameSettings.enemies.goblin.size;
         this.health = this.initHealth = this.cRoot.gameSettings.enemies.goblin.health;
         this.speed = this.cRoot.gameSettings.enemies.goblin.speed;
         this.armor = this.cRoot.gameSettings.enemies.goblin.armor;
         this.magicArmor = this.cRoot.gameSettings.enemies.goblin.magicArmor;
         this.dodge = this.cRoot.gameSettings.enemies.goblin.dodge;
         this.gold = this.cRoot.gameSettings.enemies.goblin.gold;
         this.cost = this.cRoot.gameSettings.enemies.goblin.cost;
         this.minDamage = this.cRoot.gameSettings.enemies.goblin.minDamage;
         this.maxDamage = this.cRoot.gameSettings.enemies.goblin.maxDamage;
         this.attackReloadTime = this.cRoot.gameSettings.enemies.goblin.attackReloadTime - this.attackChargeTime;
         this.xSoldierAdjust = this.cRoot.gameSettings.enemies.goblin.xSoldierAdjust;
         this.xAdjust = this.cRoot.gameSettings.enemies.goblin.xAdjust;
         this.yAdjust = this.cRoot.gameSettings.enemies.goblin.yAdjust;
         this.nodeMarginError = this.cRoot.gameSettings.enemies.goblin.speed + 0.1;
         this.§_-Jc§ = new §_-H8§(new Point(0,-20),this.health,this.initHealth);
         this.addChild(§_-Jc§);
         this.§_-R2§ = "";
         this.getFacing();
         this.§_-NA§ = 18;
         this.§_-C-§ = 24;
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.tIconName = "goblin";
         param1.eName = Locale.loadStringEx("ENEMY_GOBLIN_NAME",Locale.getDefaultLang());
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
      
      function frame82() : *
      {
         stop();
      }
      
      function frame101() : *
      {
         stop();
      }
      
      function frame105() : *
      {
         stop();
      }
      
      function frame120() : *
      {
         stop();
      }
      
      function frame131() : *
      {
         stop();
      }
   }
}
