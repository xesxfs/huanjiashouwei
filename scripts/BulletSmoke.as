package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class BulletSmoke extends MovieClip
   {
       
      
      private var durationTime;
      
      private var durationTimeCounter;
      
      public function BulletSmoke(param1:Point)
      {
         super();
         addFrameScript(12,this.frame13);
         this.x = param1.x;
         this.y = param1.y;
         this.durationTime = 14;
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
         if(this.currentFrameLabel != "smokeEnd")
         {
            this.play();
         }
      }
      
      public function destroyThis() : void
      {
         this.parent.removeChild(this);
      }
      
      function frame13() : *
      {
         stop();
      }
   }
}
