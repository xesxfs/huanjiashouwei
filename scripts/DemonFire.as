package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class DemonFire extends MovieClip
   {
       
      
      private var durationTime:int;
      
      private var durationTimeCounter:int;
      
      public function DemonFire(param1:Point, param2:int)
      {
         super();
         addFrameScript(26,this.frame27);
         this.x = param1.x;
         this.y = param1.y;
         this.durationTime = 27;
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
      
      public function destroyThis() : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      function frame27() : *
      {
         stop();
      }
   }
}
