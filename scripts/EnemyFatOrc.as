package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class EnemyFatOrc extends EnemyCommon
   {
       
      
      public var effect_Healing:MovieClip;
      
      public var effect_HolyStrike:MovieClip;
      
      public var effect_burn:MovieClip;
      
      public var effect_stun:MovieClip;
      
      public var debuff_Cursed:MovieClip;
      
      public var effect_TeslaHit:MovieClip;
      
      public var debuff_Poison:MovieClip;
      
      public var effect_Sniper:MovieClip;
      
      public function EnemyFatOrc(param1:int, param2:Array)
      {
         addFrameScript(21,this.frame22,43,this.frame44,65,this.frame66,66,this.frame67,76,this.frame77,95,this.frame96,99,this.frame100,113,this.frame114,124,this.frame125);
         super(param1,param2);
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.isFlying = this.cRoot.gameSettings.enemies.fatOrc.isFlying;
         this.level = 1;
         this.attackChargeTime = 10;
         this.size = this.cRoot.gameSettings.enemies.fatOrc.size;
         this.health = this.initHealth = this.cRoot.gameSettings.enemies.fatOrc.health;
         this.speed = this.cRoot.gameSettings.enemies.fatOrc.speed;
         this.armor = this.cRoot.gameSettings.enemies.fatOrc.armor;
         this.magicArmor = this.cRoot.gameSettings.enemies.fatOrc.magicArmor;
         this.dodge = this.cRoot.gameSettings.enemies.fatOrc.dodge;
         this.gold = this.cRoot.gameSettings.enemies.fatOrc.gold;
         this.cost = this.cRoot.gameSettings.enemies.fatOrc.cost;
         this.minDamage = this.cRoot.gameSettings.enemies.fatOrc.minDamage;
         this.maxDamage = this.cRoot.gameSettings.enemies.fatOrc.maxDamage;
         this.attackReloadTime = this.cRoot.gameSettings.enemies.fatOrc.attackReloadTime - this.attackChargeTime;
         this.xSoldierAdjust = this.cRoot.gameSettings.enemies.fatOrc.xSoldierAdjust;
         this.xAdjust = this.cRoot.gameSettings.enemies.fatOrc.xAdjust;
         this.yAdjust = this.cRoot.gameSettings.enemies.fatOrc.yAdjust;
         this.nodeMarginError = this.cRoot.gameSettings.enemies.fatOrc.speed + 0.1;
         this.§_-Jc§ = new §_-H8§(new Point(0,-23),this.health,this.initHealth);
         this.addChild(§_-Jc§);
         this.§_-R2§ = "";
         this.getFacing();
         this.§_-NA§ = 21;
         this.§_-C-§ = 24;
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.tIconName = "orc";
         param1.eName = Locale.loadStringEx("ENEMY_FAT_ORC_NAME",Locale.getDefaultLang());
      }
      
      override public function playDeadSound() : void
      {
         this.cRoot.game.gameSounds.playEnemyOrcDeadSound();
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
      
      function frame77() : *
      {
         stop();
      }
      
      function frame96() : *
      {
         stop();
      }
      
      function frame100() : *
      {
         stop();
      }
      
      function frame114() : *
      {
         stop();
      }
      
      function frame125() : *
      {
         stop();
      }
   }
}
