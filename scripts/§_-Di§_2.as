package
{
   import flash.geom.Point;
   
   public class §_-Di§ extends §_-Ol§
   {
       
      
      public function §_-Di§(param1:Point, param2:Point, param3:Tower, param4:Point)
      {
         super(param1,param2,param3,param4);
         this.rangePoint = param4;
      }
      
      public function §_-TV§() : void
      {
         this.lifes = 1;
         this.speed = 2;
         this.xAdjust = 5;
         this.attackChargeTime = 11;
         this.attackChargeDamageTime = 5;
         this.respawnTime = 6;
         this.deadTime = 10;
         this.idleTime = 30;
         this.maxSize = this.cRoot.gameSettings.powers.farmers.maxSize;
         this.maxLevel = this.cRoot.gameSettings.powers.farmers.maxLevel;
         this.rangeWidth = this.cRoot.gameSettings.powers.farmers.range;
         this.rangeHeight = this.cRoot.gameSettings.powers.farmers.range * this.cRoot.gameSettings.rangeRatio;
         this.health = this.initHealth = this.cRoot.gameSettings.powers.farmers.health;
         this.§_-Rd§ = this.cRoot.gameSettings.powers.farmers.regen;
         this.regenerateTime = this.cRoot.gameSettings.powers.farmers.regenReload;
         this.armor = this.cRoot.gameSettings.powers.farmers.armor;
         this.minDamage = this.cRoot.gameSettings.powers.farmers.minDamage;
         this.maxDamage = this.cRoot.gameSettings.powers.farmers.maxDamage;
         this.attackReloadTime = this.cRoot.gameSettings.powers.farmers.reload - this.attackChargeTime;
         this.§_-Jc§ = new §_-H8§(new Point(0,-19),this.health,this.initHealth);
         this.§_-Jc§.updateMaxHealth(this.initHealth,this.health);
         this.§_-Jc§.updateProgress(this.health);
         this.addChild(§_-Jc§);
         this.isActive = false;
         this.isDead = true;
         this.§_-E9§ = true;
         this.lifeTime = this.cRoot.gameSettings.powers.farmers.lifeTime;
         this.§_-PB§ = 0;
         this.deadTimeCounter = this.deadTime - 1;
         this.cRoot.addSoldier(this);
      }
   }
}
