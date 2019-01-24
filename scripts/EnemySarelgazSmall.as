package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class EnemySarelgazSmall extends EnemyCommon
   {
       
      
      public var effect_Healing:MovieClip;
      
      public var effect_HolyStrike:MovieClip;
      
      public var effect_burn:MovieClip;
      
      public var effect_stun:MovieClip;
      
      public var debuff_Cursed:MovieClip;
      
      public var effect_TeslaHit:MovieClip;
      
      public var debuff_Poison:MovieClip;
      
      public var effect_Sniper:MovieClip;
      
      public function EnemySarelgazSmall(param1:int, param2:Array)
      {
         addFrameScript(12,this.frame13,25,this.frame26,38,this.frame39,39,this.frame40,63,this.frame64,82,this.frame83,86,this.frame87,101,this.frame102,112,this.frame113);
         super(param1,param2);
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.isFlying = this.cRoot.gameSettings.enemies.sarelgazSmall.isFlying;
         this.level = 1;
         this.attackChargeTime = 17;
         this.canPoison = false;
         this.canSkeleton = false;
         this.§_-4q§ = "BloodGreen";
         this.size = this.cRoot.gameSettings.enemies.sarelgazSmall.size;
         this.health = this.initHealth = this.cRoot.gameSettings.enemies.sarelgazSmall.health;
         this.speed = this.cRoot.gameSettings.enemies.sarelgazSmall.speed;
         this.armor = this.cRoot.gameSettings.enemies.sarelgazSmall.armor;
         this.magicArmor = this.cRoot.gameSettings.enemies.sarelgazSmall.magicArmor;
         this.dodge = this.cRoot.gameSettings.enemies.sarelgazSmall.dodge;
         this.gold = this.cRoot.gameSettings.enemies.sarelgazSmall.gold;
         this.cost = this.cRoot.gameSettings.enemies.sarelgazSmall.cost;
         this.minDamage = this.cRoot.gameSettings.enemies.sarelgazSmall.minDamage;
         this.maxDamage = this.cRoot.gameSettings.enemies.sarelgazSmall.maxDamage;
         this.attackReloadTime = this.cRoot.gameSettings.enemies.sarelgazSmall.attackReloadTime - this.attackChargeTime;
         this.xSoldierAdjust = this.cRoot.gameSettings.enemies.sarelgazSmall.xSoldierAdjust;
         this.xAdjust = this.cRoot.gameSettings.enemies.sarelgazSmall.xAdjust;
         this.yAdjust = this.cRoot.gameSettings.enemies.sarelgazSmall.yAdjust;
         this.nodeMarginError = this.cRoot.gameSettings.enemies.sarelgazSmall.speed + 0.1;
         this.§_-Jc§ = new §_-Ov§(new Point(0,-44),this.health,this.initHealth);
         this.addChild(§_-Jc§);
         this.§_-R2§ = "";
         this.getFacing();
         this.§_-NA§ = 33;
         this.§_-C-§ = 43;
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.tIconName = "sonofsarelgaz";
         param1.eName = Locale.loadStringEx("ENEMY_SARELGAZ_SMALL_NAME",Locale.getDefaultLang());
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
      
      function frame64() : *
      {
         stop();
      }
      
      function frame83() : *
      {
         stop();
      }
      
      function frame87() : *
      {
         stop();
      }
      
      function frame102() : *
      {
         stop();
      }
      
      function frame113() : *
      {
         stop();
      }
   }
}
