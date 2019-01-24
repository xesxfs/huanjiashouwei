package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class EnemyBandit extends EnemyCommon
   {
       
      
      public var effect_Healing:MovieClip;
      
      public var effect_HolyStrike:MovieClip;
      
      public var effect_burn:MovieClip;
      
      public var effect_stun:MovieClip;
      
      public var debuff_Cursed:MovieClip;
      
      public var effect_TeslaHit:MovieClip;
      
      public var debuff_Poison:MovieClip;
      
      public var effect_Sniper:MovieClip;
      
      public function EnemyBandit(param1:int, param2:Array)
      {
         addFrameScript(21,this.frame22,43,this.frame44,65,this.frame66,66,this.frame67,73,this.frame74,92,this.frame93,97,this.frame98,107,this.frame108,118,this.frame119);
         super(param1,param2);
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.isFlying = this.cRoot.gameSettings.enemies.bandit.isFlying;
         this.level = 1;
         this.size = this.cRoot.gameSettings.enemies.bandit.size;
         this.health = this.initHealth = this.cRoot.gameSettings.enemies.bandit.health;
         this.speed = this.cRoot.gameSettings.enemies.bandit.speed;
         this.armor = this.cRoot.gameSettings.enemies.bandit.armor;
         this.magicArmor = this.cRoot.gameSettings.enemies.bandit.magicArmor;
         this.dodge = this.cRoot.gameSettings.enemies.bandit.dodge;
         this.gold = this.cRoot.gameSettings.enemies.bandit.gold;
         this.cost = this.cRoot.gameSettings.enemies.bandit.cost;
         this.minDamage = this.cRoot.gameSettings.enemies.bandit.minDamage;
         this.maxDamage = this.cRoot.gameSettings.enemies.bandit.maxDamage;
         this.attackReloadTime = this.cRoot.gameSettings.enemies.bandit.attackReloadTime - this.attackChargeTime;
         this.xSoldierAdjust = this.cRoot.gameSettings.enemies.bandit.xSoldierAdjust;
         this.xAdjust = this.cRoot.gameSettings.enemies.bandit.xAdjust;
         this.yAdjust = this.cRoot.gameSettings.enemies.bandit.yAdjust;
         this.nodeMarginError = this.cRoot.gameSettings.enemies.bandit.speed + 0.1;
         this.§_-Jc§ = new §_-H8§(new Point(0,-23),this.health,this.initHealth);
         this.addChild(§_-Jc§);
         this.§_-R2§ = "";
         this.getFacing();
         this.§_-NA§ = 11;
         this.§_-C-§ = 20;
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.tIconName = "bandit";
         param1.eName = Locale.loadStringEx("ENEMY_BANDIT_NAME",Locale.getDefaultLang());
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
      
      function frame74() : *
      {
         stop();
      }
      
      function frame93() : *
      {
         stop();
      }
      
      function frame98() : *
      {
         stop();
      }
      
      function frame108() : *
      {
         stop();
      }
      
      function frame119() : *
      {
         stop();
      }
   }
}
