package
{
   import fl.lang.Locale;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class §_-CV§ extends §_-Ol§
   {
       
      
      public function §_-CV§(param1:Point, param2:Point, param3:Tower, param4:Point)
      {
         addFrameScript(0,this.frame1,5,this.frame6,24,this.frame25,43,this.frame44,65,this.frame66);
         super(param1,param2,param3,param4);
         this.rangePoint = param4;
      }
      
      override protected function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.lifes = 1;
         this.speed = 2;
         this.xAdjust = 10;
         this.attackChargeTime = 18;
         this.attackChargeDamageTime = 8;
         this.respawnTime = 18;
         this.idleTime = 30;
         this.deadTime = 23;
         this.maxSize = this.cRoot.gameSettings.powers.warriors.maxSize;
         this.maxLevel = this.cRoot.gameSettings.powers.warriors.maxLevel;
         this.rangeWidth = this.cRoot.gameSettings.powers.warriors.range;
         this.rangeHeight = this.cRoot.gameSettings.powers.warriors.range * this.cRoot.gameSettings.rangeRatio;
         this.health = this.initHealth = this.cRoot.gameSettings.powers.warriors.health;
         this.§_-Rd§ = this.cRoot.gameSettings.powers.warriors.regen;
         this.regenerateTime = this.cRoot.gameSettings.powers.warriors.regenReload;
         this.armor = this.cRoot.gameSettings.powers.warriors.armor;
         this.minDamage = this.cRoot.gameSettings.powers.warriors.minDamage;
         this.maxDamage = this.cRoot.gameSettings.powers.warriors.maxDamage;
         this.attackReloadTime = this.cRoot.gameSettings.powers.warriors.reload - this.attackChargeTime;
         this.§_-Jc§ = new §_-H8§(new Point(3.3,-39.5),this.health,this.initHealth);
         this.§_-Jc§.updateMaxHealth(this.initHealth,this.health);
         this.§_-Jc§.updateProgress(this.health);
         this.addChild(§_-Jc§);
         this.isActive = false;
         this.isDead = true;
         this.§_-E9§ = true;
         this.lifeTime = this.cRoot.gameSettings.powers.warriors.lifeTime;
         this.§_-PB§ = 0;
         this.deadTimeCounter = this.deadTime - 1;
         this.cRoot.addSoldier(this);
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.sIconName = "warrior";
         param1.sName = Locale.loadStringEx("SOLDIER_WARRIOR_NAME",Locale.getDefaultLang());
         param1.sRespawn = "-";
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame6() : *
      {
         gotoAndPlay("running");
      }
      
      function frame25() : *
      {
         stop();
      }
      
      function frame44() : *
      {
         stop();
      }
      
      function frame66() : *
      {
         stop();
      }
   }
}
