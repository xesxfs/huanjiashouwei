package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class EnemyRottenSpider extends EnemyCommon
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
      
      public function EnemyRottenSpider(param1:int, param2:Array)
      {
         addFrameScript(12,this.frame13,25,this.frame26,38,this.frame39,39,this.frame40,57,this.frame58,76,this.frame77,80,this.frame81,95,this.frame96,106,this.frame107);
         super(param1,param2);
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.isFlying = this.cRoot.gameSettings.enemies.rottenSpider.isFlying;
         this.level = 1;
         this.attackChargeTime = 17;
         this.canPoison = false;
         this.canSkeleton = false;
         this.§_-4q§ = "BloodGreen";
         this.size = this.cRoot.gameSettings.enemies.rottenSpider.size;
         this.health = this.initHealth = this.cRoot.gameSettings.enemies.rottenSpider.health;
         this.speed = this.cRoot.gameSettings.enemies.rottenSpider.speed;
         this.armor = this.cRoot.gameSettings.enemies.rottenSpider.armor;
         this.magicArmor = this.cRoot.gameSettings.enemies.rottenSpider.magicArmor;
         this.dodge = this.cRoot.gameSettings.enemies.rottenSpider.dodge;
         this.gold = this.cRoot.gameSettings.enemies.rottenSpider.gold;
         this.cost = this.cRoot.gameSettings.enemies.rottenSpider.cost;
         this.minDamage = this.cRoot.gameSettings.enemies.rottenSpider.minDamage;
         this.maxDamage = this.cRoot.gameSettings.enemies.rottenSpider.maxDamage;
         this.attackReloadTime = this.cRoot.gameSettings.enemies.rottenSpider.attackReloadTime - this.attackChargeTime;
         this.xSoldierAdjust = this.cRoot.gameSettings.enemies.rottenSpider.xSoldierAdjust;
         this.xAdjust = this.cRoot.gameSettings.enemies.rottenSpider.xAdjust;
         this.yAdjust = this.cRoot.gameSettings.enemies.rottenSpider.yAdjust;
         this.nodeMarginError = this.cRoot.gameSettings.enemies.rottenSpider.speed + 0.1;
         this.eggsMax = this.cRoot.gameSettings.enemies.rottenSpider.eggsMax;
         this.§_-C§ = this.getRandom(this.cRoot.gameSettings.enemies.rottenSpider.eggsCooldownTimeMin,this.cRoot.gameSettings.enemies.rottenSpider.eggsCooldownTimeMax);
         this.§_-Jc§ = new §_-Ov§(new Point(0,-40),this.health,this.initHealth);
         this.addChild(§_-Jc§);
         this.§_-R2§ = "";
         this.getFacing();
         this.§_-NA§ = 32;
         this.§_-C-§ = 38;
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
         this.cRoot.decals.addChild(new SpiderEggRotten(new Point(this.x,this.y),this.roadIndex,this.currentNode,false));
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
         param1.tIconName = "rottenspider";
         param1.eName = Locale.loadStringEx("ENEMY_ROTTEN_SPIDER_NAME",Locale.getDefaultLang());
      }
      
      override public function playAttackSound() : void
      {
         this.cRoot.game.gameSounds.spiderAttack();
      }
      
      override public function addBlood() : void
      {
         this.cRoot.addToDecal(new §_-Oz§(new Point(this.x,this.y)));
      }
      
      function frame13() : *
      {
         gotoAndPlay("walking");
      }
      
      function frame26() : *
      {
         gotoAndPlay("walkingUp");
      }
      
      function frame39() : *
      {
         gotoAndPlay("walkingDown");
      }
      
      function frame40() : *
      {
         stop();
      }
      
      function frame58() : *
      {
         stop();
      }
      
      function frame77() : *
      {
         stop();
      }
      
      function frame81() : *
      {
         stop();
      }
      
      function frame96() : *
      {
         stop();
      }
      
      function frame107() : *
      {
         stop();
      }
   }
}
