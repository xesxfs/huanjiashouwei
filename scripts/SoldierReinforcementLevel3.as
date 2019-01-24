package
{
   import flash.geom.Point;
   
   public class SoldierReinforcementLevel3 extends §_-Ol§
   {
       
      
      public function SoldierReinforcementLevel3(param1:Point, param2:Point, param3:Tower, param4:Point)
      {
         super(param1,param2,param3,param4);
         this.rangePoint = param4;
      }
      
      public function §_-9k§() : void
      {
         this.lifes = 1;
         this.speed = 2;
         this.xAdjust = 5;
         this.attackChargeTime = 11;
         this.attackChargeDamageTime = 5;
         this.respawnTime = 6;
         this.deadTime = 10;
         this.idleTime = 30;
         this.maxSize = this.cRoot.gameSettings.powers.reinforcementLevel3.maxSize;
         this.maxLevel = this.cRoot.gameSettings.powers.reinforcementLevel3.maxLevel;
         this.rangeWidth = this.cRoot.gameSettings.powers.reinforcementLevel3.range;
         this.rangeHeight = this.cRoot.gameSettings.powers.reinforcementLevel3.range * this.cRoot.gameSettings.rangeRatio;
         this.health = this.initHealth = this.cRoot.gameSettings.powers.reinforcementLevel3.health;
         this.§_-Rd§ = this.cRoot.gameSettings.powers.reinforcementLevel3.regen;
         this.regenerateTime = this.cRoot.gameSettings.powers.reinforcementLevel3.regenReload;
         this.armor = this.cRoot.gameSettings.powers.reinforcementLevel3.armor;
         this.minDamage = this.cRoot.gameSettings.powers.reinforcementLevel3.minDamage;
         this.maxDamage = this.cRoot.gameSettings.powers.reinforcementLevel3.maxDamage;
         this.attackReloadTime = this.cRoot.gameSettings.powers.reinforcementLevel3.reload - this.attackChargeTime;
         this.§_-Jc§ = new §_-H8§(new Point(0,-20),this.health,this.initHealth);
         this.§_-Jc§.updateMaxHealth(this.initHealth,this.health);
         this.§_-Jc§.updateProgress(this.health);
         this.addChild(§_-Jc§);
         this.isActive = false;
         this.isDead = true;
         this.§_-E9§ = true;
         this.lifeTime = this.cRoot.gameSettings.powers.reinforcementLevel3.lifeTime;
         this.§_-PB§ = 0;
         this.deadTimeCounter = this.deadTime - 1;
         this.cRoot.addSoldier(this);
      }
   }
}
