package
{
   public class DebuffSoldierCourage extends §_-BC§
   {
       
      
      private var healingPoints:int;
      
      private var addedMinDamage:int;
      
      private var addedMaxDamage:int;
      
      private var §_-Tk§:int;
      
      public function DebuffSoldierCourage(param1:Level, param2:int, param3:Soldier)
      {
         super(param1,param2,param3);
         this.x = this.x + param3.§_-HW§.x;
         this.y = this.y + param3.§_-HW§.y;
         this.setProperties();
      }
      
      override public function init() : void
      {
         this.target.heal(this.target.getInitHealth() * this.healingPoints / 100);
         this.target.armor = this.target.armor + this.§_-Tk§;
         this.target.minDamage = this.target.minDamage + this.addedMinDamage;
         this.target.maxDamage = this.target.maxDamage + this.addedMaxDamage;
      }
      
      override public function showDebuff() : void
      {
         this.gotoAndPlay(1);
      }
      
      override public function removeDebuff() : void
      {
         this.target.armor = this.target.armor - this.§_-Tk§;
         this.target.minDamage = this.target.minDamage - this.addedMinDamage;
         this.target.maxDamage = this.target.maxDamage - this.addedMaxDamage;
         this.destroyThis();
      }
      
      override public function resetToLevel(param1:int) : void
      {
         this.level = param1;
         this.setProperties();
      }
      
      override public function hideDebuff() : void
      {
         this.destroyThis();
      }
      
      private function setProperties() : void
      {
         this.durationTime = this.cRoot.gameSettings.heroes.heroGeneral.courageDurationTime * this.cRoot.gameSettings.framesRate;
         this.healingPoints = this.cRoot.gameSettings.heroes.heroGeneral.courageHealPercent;
         this.addedMinDamage = this.cRoot.gameSettings.heroes.heroGeneral.courageDamage + this.cRoot.gameSettings.heroes.heroGeneral.courageDamageIncrement * this.level;
         this.addedMaxDamage = this.addedMinDamage;
         this.§_-Tk§ = this.cRoot.gameSettings.heroes.heroGeneral.courageArmor + this.cRoot.gameSettings.heroes.heroGeneral.courageArmorIncrement * this.level;
         this.showDebuff();
         this.durationTimeCounter = 0;
      }
   }
}
