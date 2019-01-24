package
{
   import flash.display.MovieClip;
   
   public class DebuffNet extends §_-27§
   {
       
      
      private var §_-P3§:Number;
      
      public function DebuffNet(param1:Level, param2:int, param3:Enemy)
      {
         super(param1,param2,param3);
      }
      
      override public function init() : void
      {
         this.setProperties();
      }
      
      override public function removeDebuff(param1:Boolean) : void
      {
         this.target.speed = this.§_-P3§;
         this.target.nodeMarginError = this.target.speed + 0.1;
         if(param1)
         {
            this.hideDebuff();
         }
         this.destroyThis();
      }
      
      override public function showDebuff() : void
      {
         MovieClip(this.target).effect_Net.gotoAndStop("on");
      }
      
      override public function hideDebuff() : void
      {
         MovieClip(this.target).effect_Net.gotoAndStop("off");
      }
      
      private function setProperties() : void
      {
         this.durationTime = this.cRoot.gameSettings.soldiers.barbarian.huntingNetsDuration;
         this.§_-P3§ = this.target.speed;
         this.target.speed = this.target.speed - this.target.speed * (this.cRoot.gameSettings.soldiers.barbarian.huntingNetsNewSpeed + this.cRoot.gameSettings.soldiers.barbarian.huntingNetsNewSpeedIncrement * this.level) / 100;
         this.target.nodeMarginError = this.target.speed + 0.1;
         this.showDebuff();
         this.durationTimeCounter = 0;
      }
   }
}
