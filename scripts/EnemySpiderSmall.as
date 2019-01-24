package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class EnemySpiderSmall extends EnemyCommon
   {
       
      
      public var effect_Healing:MovieClip;
      
      public var effect_HolyStrike:MovieClip;
      
      public var effect_burn:MovieClip;
      
      public var effect_stun:MovieClip;
      
      public var debuff_Cursed:MovieClip;
      
      public var effect_TeslaHit:MovieClip;
      
      public var debuff_Poison:MovieClip;
      
      public var effect_Sniper:MovieClip;
      
      private var §_-5Z§:Boolean;
      
      public function EnemySpiderSmall(param1:int, param2:Array, param3:int = 0, param4:Point = null, param5:Boolean = false)
      {
         addFrameScript(8,this.frame9,17,this.frame18,26,this.frame27,27,this.frame28,45,this.frame46,64,this.frame65,68,this.frame69,83,this.frame84,94,this.frame95);
         super(param1,param2);
         if(param4 != null)
         {
            this.§_-9I§(param3);
            this.x = param4.x;
            this.y = param4.y;
            this.§_-5Z§ = param5;
            this.isActive = true;
         }
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.isFlying = this.cRoot.gameSettings.enemies.spiderSmall.isFlying;
         this.level = 1;
         this.attackChargeTime = 17;
         this.canPoison = false;
         this.canSkeleton = false;
         this.§_-4q§ = "BloodGreen";
         this.size = this.cRoot.gameSettings.enemies.spiderSmall.size;
         this.health = this.initHealth = this.cRoot.gameSettings.enemies.spiderSmall.health;
         this.speed = this.cRoot.gameSettings.enemies.spiderSmall.speed;
         this.armor = this.cRoot.gameSettings.enemies.spiderSmall.armor;
         this.magicArmor = this.cRoot.gameSettings.enemies.spiderSmall.magicArmor;
         this.dodge = this.cRoot.gameSettings.enemies.spiderSmall.dodge;
         if(this.§_-5Z§)
         {
            this.gold = 0;
         }
         else
         {
            this.gold = this.cRoot.gameSettings.enemies.spiderSmall.gold;
         }
         this.cost = this.cRoot.gameSettings.enemies.spiderSmall.cost;
         this.minDamage = this.cRoot.gameSettings.enemies.spiderSmall.minDamage;
         this.maxDamage = this.cRoot.gameSettings.enemies.spiderSmall.maxDamage;
         this.attackReloadTime = this.cRoot.gameSettings.enemies.spiderSmall.attackReloadTime - this.attackChargeTime;
         this.xSoldierAdjust = this.cRoot.gameSettings.enemies.spiderSmall.xSoldierAdjust;
         this.xAdjust = this.cRoot.gameSettings.enemies.spiderSmall.xAdjust;
         this.yAdjust = this.cRoot.gameSettings.enemies.spiderSmall.yAdjust;
         this.nodeMarginError = this.cRoot.gameSettings.enemies.spiderSmall.speed + 0.1;
         this.§_-Jc§ = new §_-H8§(new Point(0,-18),this.health,this.initHealth);
         this.addChild(§_-Jc§);
         this.§_-R2§ = "";
         this.getFacing();
         this.§_-NA§ = 12;
         this.§_-C-§ = 17;
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.tIconName = "spidersmall";
         param1.eName = Locale.loadStringEx("ENEMY_SPIDERSMALL_NAME",Locale.getDefaultLang());
      }
      
      override public function explode() : void
      {
         this.setDeadBasicStatus();
         this.cRoot.entities.addChild(new EnemyExplodeSpider(new Point(this.x,this.y),this.cRoot));
         this.destroyThis();
      }
      
      override public function playAttackSound() : void
      {
         this.cRoot.game.gameSounds.spiderAttack();
      }
      
      override public function addBlood() : void
      {
         this.cRoot.addToDecal(new §_-Oz§(new Point(this.x,this.y)));
      }
      
      function frame9() : *
      {
         gotoAndPlay("walking");
      }
      
      function frame18() : *
      {
         gotoAndPlay("walkingUp");
      }
      
      function frame27() : *
      {
         gotoAndPlay("walkingDown");
      }
      
      function frame28() : *
      {
         stop();
      }
      
      function frame46() : *
      {
         stop();
      }
      
      function frame65() : *
      {
         stop();
      }
      
      function frame69() : *
      {
         stop();
      }
      
      function frame84() : *
      {
         stop();
      }
      
      function frame95() : *
      {
         stop();
      }
   }
}
