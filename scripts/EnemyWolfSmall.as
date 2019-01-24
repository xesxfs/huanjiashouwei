package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class EnemyWolfSmall extends EnemyCommon
   {
       
      
      public var effect_Healing:MovieClip;
      
      public var effect_HolyStrike:MovieClip;
      
      public var effect_burn:MovieClip;
      
      public var effect_stun:MovieClip;
      
      public var debuff_Cursed:MovieClip;
      
      public var effect_TeslaHit:MovieClip;
      
      public var debuff_Poison:MovieClip;
      
      public var effect_Sniper:MovieClip;
      
      public function EnemyWolfSmall(param1:int, param2:Array)
      {
         addFrameScript(9,this.frame10,19,this.frame20,29,this.frame30,30,this.frame31,44,this.frame45,63,this.frame64,67,this.frame68,85,this.frame86,96,this.frame97);
         super(param1,param2);
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.isFlying = this.cRoot.gameSettings.enemies.wolfSmall.isFlying;
         this.level = 1;
         this.deadTime = 15;
         this.canSkeleton = false;
         this.size = this.cRoot.gameSettings.enemies.wolfSmall.size;
         this.health = this.initHealth = this.cRoot.gameSettings.enemies.wolfSmall.health;
         this.speed = this.cRoot.gameSettings.enemies.wolfSmall.speed;
         this.armor = this.cRoot.gameSettings.enemies.wolfSmall.armor;
         this.magicArmor = this.cRoot.gameSettings.enemies.wolfSmall.magicArmor;
         this.dodge = this.cRoot.gameSettings.enemies.wolfSmall.dodge;
         this.gold = this.cRoot.gameSettings.enemies.wolfSmall.gold;
         this.cost = this.cRoot.gameSettings.enemies.wolfSmall.cost;
         this.minDamage = this.cRoot.gameSettings.enemies.wolfSmall.minDamage;
         this.maxDamage = this.cRoot.gameSettings.enemies.wolfSmall.maxDamage;
         this.attackReloadTime = this.cRoot.gameSettings.enemies.wolfSmall.attackReloadTime;
         this.xSoldierAdjust = this.cRoot.gameSettings.enemies.wolfSmall.xSoldierAdjust;
         this.xAdjust = this.cRoot.gameSettings.enemies.wolfSmall.xAdjust;
         this.yAdjust = this.cRoot.gameSettings.enemies.wolfSmall.yAdjust;
         this.nodeMarginError = this.cRoot.gameSettings.enemies.wolfSmall.speed + 0.1;
         this.§_-Jc§ = new §_-H8§(new Point(0,-20),this.health,this.initHealth);
         this.addChild(§_-Jc§);
         this.§_-R2§ = "";
         this.getFacing();
         this.§_-NA§ = 23;
         this.§_-C-§ = 26;
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.tIconName = "wulf";
         param1.eName = Locale.loadStringEx("ENEMY_WULF_NAME",Locale.getDefaultLang());
      }
      
      override public function explode() : void
      {
         this.setDeadBasicStatus(true);
         this.addBlood();
      }
      
      override public function playAttackSound() : void
      {
         this.cRoot.game.gameSounds.wolfAttack();
      }
      
      override public function playDeadSound() : void
      {
         this.cRoot.game.gameSounds.playEnemyPuffDead();
      }
      
      override public function addBlood() : void
      {
      }
      
      function frame10() : *
      {
         gotoAndPlay("walking");
      }
      
      function frame20() : *
      {
         gotoAndPlay("walkingUp");
      }
      
      function frame30() : *
      {
         gotoAndPlay("walkingDown");
      }
      
      function frame31() : *
      {
         stop();
      }
      
      function frame45() : *
      {
         stop();
      }
      
      function frame64() : *
      {
         stop();
      }
      
      function frame68() : *
      {
         stop();
      }
      
      function frame86() : *
      {
         stop();
      }
      
      function frame97() : *
      {
         stop();
      }
   }
}
