package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class PowerFeedback extends MovieClip
   {
       
      
      public var clip:MovieClip;
      
      private var durationTime:int = 22;
      
      private var durationTimeCounter:int = 0;
      
      public function PowerFeedback(param1:Point, param2:int)
      {
         super();
         addFrameScript(21,this.frame22);
         this.x = param1.x;
         this.y = param1.y;
         this.clip.txt.text = "-" + param2.toString() + "s";
      }
      
      public function onFrameUpdate() : void
      {
         this.durationTimeCounter++;
         if(this.durationTimeCounter <= this.durationTime)
         {
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
      
      protected function destroyThis() : void
      {
         this.parent.removeChild(this);
      }
      
      function frame22() : *
      {
         stop();
      }
   }
}
