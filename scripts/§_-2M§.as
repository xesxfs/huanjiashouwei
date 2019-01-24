package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class §_-2M§ extends MovieClip
   {
       
      
      private var durationTime:int;
      
      private var durationTimeCounter:int;
      
      public function §_-2M§(param1:Point, param2:Level)
      {
         super();
         addFrameScript(13,this.frame14);
         this.x = param1.x;
         this.y = param1.y;
         this.durationTime = 16;
         this.durationTimeCounter = 0;
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
         if(this.currentFrameLabel != "effectEnd")
         {
            this.play();
         }
      }
      
      private function destroyThis() : void
      {
         this.parent.removeChild(this);
      }
      
      function frame14() : *
      {
         stop();
      }
   }
}
