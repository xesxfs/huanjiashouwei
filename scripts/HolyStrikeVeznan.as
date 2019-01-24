package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class HolyStrikeVeznan extends MovieClip
   {
       
      
      private var holyStrikeDurationTime:int;
      
      private var holyStrikeDurationTimeCounter:int;
      
      public function HolyStrikeVeznan(param1:Point, param2:Level)
      {
         super();
         addFrameScript(14,this.frame15);
         this.x = param1.x;
         this.y = param1.y;
         this.holyStrikeDurationTime = 14;
         this.holyStrikeDurationTimeCounter = 0;
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
      
      function frame15() : *
      {
         stop();
      }
   }
}
