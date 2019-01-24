package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class EnemyGolemHead extends EnemyCommon
   {
       
      
      public var effect_Healing:MovieClip;
      
      public var effect_HolyStrike:MovieClip;
      
      public var effect_burn:MovieClip;
      
      public var effect_stun:MovieClip;
      
      public var debuff_Cursed:MovieClip;
      
      public var effect_TeslaHit:MovieClip;
      
      public var debuff_Poison:MovieClip;
      
      public var effect_Sniper:MovieClip;
      
      public function EnemyGolemHead(param1:int, param2:Array, param3:int, param4:Point)
      {
         addFrameScript(21,this.frame22,43,this.frame44,44,this.frame45,63,this.frame64,82,this.frame83,87,this.frame88,100,this.frame101,111,this.frame112);
         super(param1,param2);
         this.§_-9I§(param3 + 2);
         this.x = param4.x;
         this.y = param4.y;
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.isActive = true;
         this.isFlying = this.cRoot.gameSettings.enemies.golemHead.isFlying;
         this.level = 1;
         this.§_-4q§ = "BloodGrey";
         this.canPoison = false;
         this.attackChargeTime = 17;
         this.size = this.cRoot.gameSettings.enemies.golemHead.size;
         this.health = this.initHealth = this.cRoot.gameSettings.enemies.golemHead.health;
         this.speed = this.cRoot.gameSettings.enemies.golemHead.speed;
         this.armor = this.cRoot.gameSettings.enemies.golemHead.armor;
         this.magicArmor = this.cRoot.gameSettings.enemies.golemHead.magicArmor;
         this.dodge = this.cRoot.gameSettings.enemies.golemHead.dodge;
         this.gold = this.cRoot.gameSettings.enemies.golemHead.gold;
         this.cost = this.cRoot.gameSettings.enemies.golemHead.cost;
         this.minDamage = this.cRoot.gameSettings.enemies.golemHead.minDamage;
         this.maxDamage = this.cRoot.gameSettings.enemies.golemHead.maxDamage;
         this.attackReloadTime = this.cRoot.gameSettings.enemies.golemHead.attackReloadTime - this.attackChargeTime;
         this.xSoldierAdjust = this.cRoot.gameSettings.enemies.golemHead.xSoldierAdjust;
         this.xAdjust = this.cRoot.gameSettings.enemies.golemHead.xAdjust;
         this.yAdjust = this.cRoot.gameSettings.enemies.golemHead.yAdjust;
         this.nodeMarginError = this.cRoot.gameSettings.enemies.golemHead.speed + 0.1;
         this.§_-Jc§ = new §_-H8§(new Point(0,-17),this.health,this.initHealth);
         this.addChild(§_-Jc§);
         this.§_-R2§ = "";
         this.getFacing();
         this.§_-NA§ = 14;
         this.§_-C-§ = 20;
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.tIconName = "golemhead";
         param1.eName = Locale.loadStringEx("ENEMY_GOLEM_HEAD_NAME",Locale.getDefaultLang());
      }
      
      override public function explode() : void
      {
         this.setDeadBasicStatus(true);
      }
      
      override public function playDeadSound() : void
      {
         this.cRoot.game.gameSounds.playEnemyPuffDead();
      }
      
      override public function addBlood() : void
      {
      }
      
      function frame22() : *
      {
         gotoAndPlay("walking");
      }
      
      function frame44() : *
      {
         gotoAndPlay("walkingUp");
      }
      
      function frame45() : *
      {
         stop();
      }
      
      function frame64() : *
      {
         stop();
      }
      
      function frame83() : *
      {
         stop();
      }
      
      function frame88() : *
      {
         stop();
      }
      
      function frame101() : *
      {
         stop();
      }
      
      function frame112() : *
      {
         stop();
      }
   }
}
