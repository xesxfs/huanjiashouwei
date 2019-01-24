package
{
   public class DebuffSlowTarBomb extends §_-27§
   {
       
      
      private var §_-P3§:Number;
      
      private var reducedSpeed:Number;
      
      public function DebuffSlowTarBomb(param1:Level, param2:int, param3:Enemy)
      {
         super(param1,param2,param3);
      }
      
      override public function init() : void
      {
         this.setProperties();
      }
      
      override public function removeDebuff(param1:Boolean) : void
      {
         this.target.speed = this.target.speed + this.reducedSpeed;
         this.target.nodeMarginError = this.target.speed + 0.1;
         this.destroyThis();
      }
      
      private function setProperties() : void
      {
         this.durationTime = this.cRoot.gameSettings.heroes.heroDwarf.tarDurationBuffTime * this.cRoot.gameSettings.framesRate;
         this.§_-P3§ = this.target.speed;
         this.reducedSpeed = this.target.speed / 2;
         this.target.speed = this.target.speed - this.reducedSpeed;
         this.target.nodeMarginError = this.target.speed + 0.1;
         this.showDebuff();
         this.durationTimeCounter = 0;
      }
   }
}
