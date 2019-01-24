package
{
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class SasquashDoor extends EnemyCommon
   {
       
      
      private var tower:TowerSoldierSasquashFrozen;
      
      public function SasquashDoor(param1:int, param2:Array, param3:Point, param4:TowerSoldierSasquashFrozen)
      {
         super(param1,param2);
         this.tower = param4;
         this.x = param3.x;
         this.y = param3.y;
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.isFlying = false;
         this.level = 1;
         this.isActive = true;
         this.isDead = false;
         this.attackChargeTime = 30;
         this.size = 0;
         this.health = 1;
         this.speed = 1;
         this.armor = 0;
         this.magicArmor = 0;
         this.dodge = 0;
         this.gold = 0;
         this.cost = 0;
         this.minDamage = 0;
         this.maxDamage = 0;
         this.attackReloadTime = 0;
         this.xSoldierAdjust = 0;
         this.xAdjust = 0;
         this.yAdjust = 0;
         this.nodeMarginError = 0;
         this.§_-Jc§ = new §_-Ov§(new Point(0,-45),this.health,this.initHealth);
         this.cRoot.staticEnemies[this] = this;
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function onFrameUpdate() : void
      {
      }
      
      override public function pause() : void
      {
      }
      
      override public function unPause() : void
      {
      }
      
      override public function unPauseEffects() : void
      {
      }
      
      override public function setDeadBasicStatus(param1:Boolean = false) : void
      {
         this.isActive = false;
         this.isDead = true;
         this.tower.upgradeTower("free");
         this.destroyThis();
      }
      
      override public function explode() : void
      {
         this.setDeadBasicStatus();
      }
      
      override public function addBlood() : void
      {
      }
      
      override protected function removeFromList() : void
      {
         this.cRoot.removeEnemyStatic(this);
      }
   }
}
