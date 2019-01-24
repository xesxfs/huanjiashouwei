package
{
   public class §_-AA§ extends §_-Sr§
   {
       
      
      protected var §_-HM§:int;
      
      protected var §_-PZ§:int;
      
      public function §_-AA§(param1:Level, param2:int, param3:Tower)
      {
         super(param1,param2,param3);
         this.setProperties();
      }
      
      override public function init() : void
      {
         this.target.addReloadModifier(this.§_-PZ§);
         this.target.addRangeModifier(this.§_-HM§);
         this.showDebuff();
      }
      
      override public function showDebuff() : void
      {
         this.x = 0;
         this.y = 0;
         this.target.addChild(this);
      }
      
      override public function removeDebuff() : void
      {
         this.target.removeReloadModifier(this.§_-PZ§);
         this.target.removeRangeModifier(this.§_-HM§);
         this.target.removeChild(this);
         this.destroyThis();
      }
      
      override public function resetToLevel(param1:int) : void
      {
         this.level = param1;
         this.durationTime = (this.cRoot.gameSettings.heroes.heroKing.buffDurationTime + this.cRoot.gameSettings.heroes.heroKing.buffDurationTimeIncrement * this.level) * this.cRoot.gameSettings.framesRate;
         this.durationTimeCounter = 0;
      }
      
      override public function hideDebuff() : void
      {
         this.destroyThis();
      }
      
      private function setProperties() : void
      {
         this.§_-PZ§ = this.target.getReloadModifier(this.cRoot.gameSettings.heroes.heroKing.buffLessReloadPercent);
         this.§_-HM§ = this.target.getRangeModifier(this.cRoot.gameSettings.heroes.heroKing.buffMoreRangePercent);
         this.durationTime = (this.cRoot.gameSettings.heroes.heroKing.buffDurationTime + this.cRoot.gameSettings.heroes.heroKing.buffDurationTimeIncrement * this.level) * this.cRoot.gameSettings.framesRate;
         this.durationTimeCounter = 0;
      }
   }
}
