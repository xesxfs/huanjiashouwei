package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class HolyStrike extends MovieClip
   {
       
      
      private var holyStrikeDurationTime:int;
      
      private var holyStrikeDurationTimeCounter:int;
      
      public function HolyStrike(param1:Point, param2:Level)
      {
         super();
         this.x = param1.x;
         this.y = param1.y;
         this.holyStrikeDurationTime = 12;
         this.holyStrikeDurationTimeCounter = 0;
         param2.game.gameAchievement.holyStrike(param2);
      }
      
      public function onFrameUpdate() : void
      {
         if(this.holyStrikeDurationTimeCounter < this.holyStrikeDurationTime)
         {
            this.holyStrikeDurationTimeCounter++;
            return;
         }
         this.destroyThis();
      }
      
      public function pause() : void
      {
         this.stop();
      }
      
      public function unPause() : void
      {
         if(this.currentFrameLabel != "holyStrikeEnd")
         {
            this.play();
         }
      }
      
      private function destroyThis() : void
      {
         this.parent.removeChild(this);
      }
   }
}
