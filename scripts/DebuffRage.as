package
{
   import flash.display.MovieClip;
   
   public class DebuffRage extends §_-27§
   {
       
      
      public var healingPoints:int;
      
      public var addedMinDamage:int;
      
      public var addedMaxDamage:int;
      
      public var §_-1V§:Number;
      
      public var §_-Tk§:int;
      
      public function DebuffRage(param1:Level, param2:int, param3:Enemy)
      {
         super(param1,param2,param3);
      }
      
      override public function init() : void
      {
         this.setProperties();
         EnemyCommon(this.target).heal(this.healingPoints);
         this.target.minDamage = this.target.minDamage + this.addedMinDamage;
         this.target.maxDamage = this.target.maxDamage + this.addedMaxDamage;
         this.target.speed = this.target.speed + this.§_-1V§;
         this.target.nodeMarginError = this.target.speed + 0.1;
         this.target.armor = this.target.armor + this.§_-Tk§;
      }
      
      override public function removeDebuff(param1:Boolean) : void
      {
         this.target.minDamage = this.target.minDamage - this.addedMinDamage;
         this.target.maxDamage = this.target.maxDamage - this.addedMaxDamage;
         this.target.speed = this.target.speed - this.§_-1V§;
         this.target.nodeMarginError = this.target.speed + 0.1;
         this.target.setDamageArmor(this.§_-Tk§);
         if(param1)
         {
            this.hideDebuff();
         }
         this.destroyThis();
      }
      
      override public function resetToLevel(param1:int) : void
      {
         this.level = param1;
         this.setProperties();
      }
      
      override public function showDebuff() : void
      {
         MovieClip(this.target).debuff_rage.gotoAndPlay("on");
      }
      
      override public function hideDebuff() : void
      {
         MovieClip(this.target).debuff_rage.gotoAndStop("off");
      }
      
      private function setProperties() : void
      {
         this.durationTime = this.cRoot.gameSettings.enemies.trollChieftain.rageDurationTime;
         this.healingPoints = this.cRoot.gameSettings.enemies.trollChieftain.rageHealPoints;
         this.addedMinDamage = this.cRoot.gameSettings.enemies.trollChieftain.rageAddedMinDamage;
         this.addedMaxDamage = this.cRoot.gameSettings.enemies.trollChieftain.rageAddedMaxDamage;
         this.§_-1V§ = this.cRoot.gameSettings.enemies.trollChieftain.rageAddedSpeed;
         this.§_-Tk§ = this.cRoot.gameSettings.enemies.trollChieftain.rageAddedArmor;
         this.showDebuff();
         this.durationTimeCounter = 0;
      }
   }
}
