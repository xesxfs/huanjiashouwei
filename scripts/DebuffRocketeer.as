package
{
   import flash.display.MovieClip;
   
   public class DebuffRocketeer extends §_-27§
   {
       
      
      private var §_-P3§:Number;
      
      public function DebuffRocketeer(param1:Level, param2:int, param3:Enemy)
      {
         super(param1,param2,param3);
      }
      
      override public function init() : void
      {
         this.setProperties();
      }
      
      override public function removeDebuff(param1:Boolean) : void
      {
         MovieClip(this.target).stopSpeedUp(this.§_-P3§);
         this.destroyThis();
      }
      
      private function setProperties() : void
      {
         this.durationTime = this.cRoot.gameSettings.enemies.rocketeer.fastSpeedDuration;
         this.§_-P3§ = this.target.speed;
         this.target.speed = this.cRoot.gameSettings.enemies.rocketeer.fastSpeed;
         this.target.nodeMarginError = this.target.speed + 0.1;
         this.showDebuff();
         this.durationTimeCounter = 0;
      }
   }
}
