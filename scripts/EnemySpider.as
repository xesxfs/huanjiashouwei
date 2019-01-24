package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class EnemySpider extends EnemyCommon
   {
       
      
      public var effect_Healing:MovieClip;
      
      public var effect_HolyStrike:MovieClip;
      
      public var effect_burn:MovieClip;
      
      public var effect_stun:MovieClip;
      
      public var debuff_Cursed:MovieClip;
      
      public var effect_TeslaHit:MovieClip;
      
      public var debuff_Poison:MovieClip;
      
      public var effect_Sniper:MovieClip;
      
      private var eggsMax:int;
      
      private var §_-Kv§:int = 0;
      
      private var §_-C§:int;
      
      private var §_-Ad§:int;
      
      public function EnemySpider(param1:int, param2:Array)
      {
         addFrameScript(8,this.frame9,17,this.frame18,26,this.frame27,27,this.frame28,45,this.frame46,64,this.frame65,68,this.frame69,83,this.frame84,94,this.frame95);
         super(param1,param2);
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.isFlying = this.cRoot.gameSettings.enemies.spider.isFlying;
         this.level = 1;
         this.attackChargeTime = 17;
         this.canPoison = false;
         this.canSkeleton = false;
         this.§_-4q§ = "BloodGreen";
         this.size = this.cRoot.gameSettings.enemies.spider.size;
         this.health = this.initHealth = this.cRoot.gameSettings.enemies.spider.health;
         this.speed = this.cRoot.gameSettings.enemies.spider.speed;
         this.armor = this.cRoot.gameSettings.enemies.spider.armor;
         this.magicArmor = this.cRoot.gameSettings.enemies.spider.magicArmor;
         this.dodge = this.cRoot.gameSettings.enemies.spider.dodge;
         this.gold = this.cRoot.gameSettings.enemies.spider.gold;
         this.cost = this.cRoot.gameSettings.enemies.spider.cost;
         this.minDamage = this.cRoot.gameSettings.enemies.spider.minDamage;
         this.maxDamage = this.cRoot.gameSettings.enemies.spider.maxDamage;
         this.attackReloadTime = this.cRoot.gameSettings.enemies.spider.attackReloadTime - this.attackChargeTime;
         this.xSoldierAdjust = this.cRoot.gameSettings.enemies.spider.xSoldierAdjust;
         this.xAdjust = this.cRoot.gameSettings.enemies.spider.xAdjust;
         this.yAdjust = this.cRoot.gameSettings.enemies.spider.yAdjust;
         this.nodeMarginError = this.cRoot.gameSettings.enemies.spider.speed + 0.1;
         this.eggsMax = this.cRoot.gameSettings.enemies.spider.eggsMax;
         this.§_-C§ = this.getRandom(this.cRoot.gameSettings.enemies.spider.eggsCooldownTimeMin,this.cRoot.gameSettings.enemies.spider.eggsCooldownTimeMax);
         this.§_-Jc§ = new §_-H8§(new Point(0,-25),this.health,this.initHealth);
         this.addChild(§_-Jc§);
         this.§_-R2§ = "";
         this.getFacing();
         this.§_-NA§ = 20;
         this.§_-C-§ = 25;
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function explode() : void
      {
         this.setDeadBasicStatus();
         this.cRoot.entities.addChild(new EnemyExplodeSpider(new Point(this.x,this.y),this.cRoot));
         this.destroyThis();
      }
      
      override public function specialPower() : Boolean
      {
         if(this.eggsMax == this.§_-Kv§)
         {
            return false;
         }
         if(this.§_-Ad§ < this.§_-C§)
         {
            this.§_-Ad§++;
            return false;
         }
         if(this.isBlocked)
         {
            return false;
         }
         this.cRoot.decals.addChild(new SpiderEgg(new Point(this.x,this.y),this.roadIndex,this.currentNode));
         this.§_-Ad§ = 0;
         this.§_-Kv§++;
         return false;
      }
      
      public function getRandom(param1:*, param2:*) : Number
      {
         var _loc3_:Number = NaN;
         _loc3_ = Math.round(Math.random() * (param2 - param1)) + param1;
         return _loc3_;
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.tIconName = "spider";
         param1.eName = Locale.loadStringEx("ENEMY_SPIDER_NAME",Locale.getDefaultLang());
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
