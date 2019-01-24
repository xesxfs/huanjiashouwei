package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class EnemyOrcArmored extends EnemyCommon
   {
       
      
      public var effect_Healing:MovieClip;
      
      public var effect_HolyStrike:MovieClip;
      
      public var effect_burn:MovieClip;
      
      public var effect_stun:MovieClip;
      
      public var debuff_Cursed:MovieClip;
      
      public var effect_TeslaHit:MovieClip;
      
      public var debuff_Poison:MovieClip;
      
      public var effect_Sniper:MovieClip;
      
      public function EnemyOrcArmored(param1:int, param2:Array, param3:int = 0, param4:Point = null)
      {
         addFrameScript(21,this.frame22,43,this.frame44,65,this.frame66,66,this.frame67,76,this.frame77,95,this.frame96,99,this.frame100,113,this.frame114,124,this.frame125);
         super(param1,param2);
         if(param4 != null)
         {
            this.§_-9I§(param3);
            this.x = param4.x;
            this.y = param4.y;
         }
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.isFlying = this.cRoot.gameSettings.enemies.orcArmored.isFlying;
         this.isActive = true;
         this.level = 1;
         this.attackChargeTime = 10;
         this.size = this.cRoot.gameSettings.enemies.orcArmored.size;
         this.health = this.initHealth = this.cRoot.gameSettings.enemies.orcArmored.health;
         this.speed = this.cRoot.gameSettings.enemies.orcArmored.speed;
         this.armor = this.cRoot.gameSettings.enemies.orcArmored.armor;
         this.magicArmor = this.cRoot.gameSettings.enemies.orcArmored.magicArmor;
         this.dodge = this.cRoot.gameSettings.enemies.orcArmored.dodge;
         this.gold = this.cRoot.gameSettings.enemies.orcArmored.gold;
         this.cost = this.cRoot.gameSettings.enemies.orcArmored.cost;
         this.minDamage = this.cRoot.gameSettings.enemies.orcArmored.minDamage;
         this.maxDamage = this.cRoot.gameSettings.enemies.orcArmored.maxDamage;
         this.attackReloadTime = this.cRoot.gameSettings.enemies.orcArmored.attackReloadTime - this.attackChargeTime;
         this.xSoldierAdjust = this.cRoot.gameSettings.enemies.orcArmored.xSoldierAdjust;
         this.xAdjust = this.cRoot.gameSettings.enemies.orcArmored.xAdjust;
         this.yAdjust = this.cRoot.gameSettings.enemies.orcArmored.yAdjust;
         this.nodeMarginError = this.cRoot.gameSettings.enemies.orcArmored.speed + 0.1;
         this.§_-Jc§ = new §_-H8§(new Point(0,-29),this.health,this.initHealth);
         this.addChild(§_-Jc§);
         this.§_-R2§ = "";
         this.getFacing();
         this.§_-NA§ = 24;
         this.§_-C-§ = 42;
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.tIconName = "orcarmor";
         param1.eName = Locale.loadStringEx("ENEMY_ORC_ARMORED_NAME",Locale.getDefaultLang());
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
