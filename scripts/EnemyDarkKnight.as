package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class EnemyDarkKnight extends EnemyCommon
   {
       
      
      public var effect_Healing:MovieClip;
      
      public var effect_HolyStrike:MovieClip;
      
      public var effect_burn:MovieClip;
      
      public var effect_stun:MovieClip;
      
      public var debuff_Cursed:MovieClip;
      
      public var effect_TeslaHit:MovieClip;
      
      public var debuff_Poison:MovieClip;
      
      public var effect_Sniper:MovieClip;
      
      public function EnemyDarkKnight(param1:int, param2:Array)
      {
         addFrameScript(21,this.frame22,43,this.frame44,65,this.frame66,66,this.frame67,77,this.frame78,96,this.frame97,101,this.frame102,109,this.frame110,120,this.frame121);
         super(param1,param2);
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.isFlying = this.cRoot.gameSettings.enemies.darkKnight.isFlying;
         this.level = 1;
         this.attackChargeTime = 10;
         this.size = this.cRoot.gameSettings.enemies.darkKnight.size;
         this.health = this.initHealth = this.cRoot.gameSettings.enemies.darkKnight.health;
         this.speed = this.cRoot.gameSettings.enemies.darkKnight.speed;
         this.armor = this.cRoot.gameSettings.enemies.darkKnight.armor;
         this.dodge = this.cRoot.gameSettings.enemies.darkKnight.dodge;
         this.gold = this.cRoot.gameSettings.enemies.darkKnight.gold;
         this.cost = this.cRoot.gameSettings.enemies.darkKnight.cost;
         this.minDamage = this.cRoot.gameSettings.enemies.darkKnight.minDamage;
         this.maxDamage = this.cRoot.gameSettings.enemies.darkKnight.maxDamage;
         this.attackReloadTime = this.cRoot.gameSettings.enemies.darkKnight.attackReloadTime;
         this.xSoldierAdjust = this.cRoot.gameSettings.enemies.darkKnight.xSoldierAdjust;
         this.xAdjust = this.cRoot.gameSettings.enemies.darkKnight.xAdjust;
         this.yAdjust = this.cRoot.gameSettings.enemies.darkKnight.yAdjust;
         this.nodeMarginError = this.cRoot.gameSettings.enemies.darkKnight.speed + 0.1;
         this.§_-Jc§ = new §_-H8§(new Point(0,-28),this.health,this.initHealth);
         this.addChild(§_-Jc§);
         this.§_-R2§ = "";
         this.getFacing();
         this.§_-NA§ = 22;
         this.§_-C-§ = 31;
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.tIconName = "darkknight";
         param1.eName = Locale.loadStringEx("ENEMY_DARK_NIGHT_NAME",Locale.getDefaultLang());
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
      
      function frame78() : *
      {
         stop();
      }
      
      function frame97() : *
      {
         stop();
      }
      
      function frame102() : *
      {
         stop();
      }
      
      function frame110() : *
      {
         stop();
      }
      
      function frame121() : *
      {
         stop();
      }
   }
}
