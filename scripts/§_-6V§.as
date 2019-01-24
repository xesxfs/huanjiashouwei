package
{
   import fl.lang.Locale;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class §_-6V§ extends Soldier
   {
       
      
      public function §_-6V§(param1:Point, param2:Point, param3:Tower)
      {
         addFrameScript(0,this.frame1,16,this.frame17,23,this.frame24);
         super(param1,param2,param3);
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      override protected function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.attackChargeTime = 11;
         this.attackChargeDamageTime = 5;
         this.maxSize = this.cRoot.gameSettings.soldiers.level1.maxSize;
         this.maxLevel = this.cRoot.gameSettings.soldiers.level1.maxLevel;
         this.rangeWidth = this.cRoot.gameSettings.soldiers.level1.range;
         this.rangeHeight = this.cRoot.gameSettings.soldiers.level1.range * this.cRoot.gameSettings.rangeRatio;
         this.health = this.initHealth = this.cRoot.gameSettings.soldiers.level1.health;
         this.§_-Rd§ = this.cRoot.gameSettings.soldiers.level1.regen;
         this.regenerateTime = this.cRoot.gameSettings.soldiers.level1.regenReload;
         this.armor = this.cRoot.gameSettings.soldiers.level1.armor;
         this.minDamage = this.cRoot.gameSettings.soldiers.level1.minDamage;
         this.maxDamage = this.cRoot.gameSettings.soldiers.level1.maxDamage;
         this.deadTime = this.cRoot.gameSettings.soldiers.level1.respawn;
         this.attackReloadTime = this.cRoot.gameSettings.soldiers.level1.reload - this.attackChargeTime;
         this.respawnTime = 1;
         this.speed = 2;
         this.idleTime = 30;
         this.§_-Jc§ = new §_-H8§(new Point(0,-20),this.health,this.initHealth);
         this.addChild(§_-Jc§);
         this.visible = false;
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.sIconName = "standard1";
         param1.sName = Locale.loadStringEx("SOLDIER_RANDOM_" + this.nameIndex + "_NAME",Locale.getDefaultLang());
         param1.sRespawn = this.cRoot.gameSettings.soldiers.level1.respawn / this.cRoot.gameSettings.framesRate + "s";
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame17() : *
      {
         stop();
      }
      
      function frame24() : *
      {
         stop();
      }
   }
}
