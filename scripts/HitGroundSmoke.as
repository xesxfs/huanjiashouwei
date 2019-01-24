package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class HitGroundSmoke extends MovieClip
   {
       
      
      private var durationTime:int;
      
      private var durationTimeCounter:int;
      
      public function HitGroundSmoke(param1:Point, param2:int)
      {
         super();
         addFrameScript(14,this.frame15);
         this.x = param1.x;
         this.y = param1.y;
         this.durationTime = 14;
         this.scaleX = param2;
      }
      
      public function onFrameUpdate() : void
      {
         if(this.durationTimeCounter < this.durationTime)
         {
            this.durationTimeCounter++;
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
         if(this.currentFrame != this.totalFrames)
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
