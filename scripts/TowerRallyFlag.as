package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class TowerRallyFlag extends MovieClip
   {
       
      
      public var §_-2J§:MovieClip;
      
      private var durationTime:int;
      
      private var durationTimeCounter:int;
      
      public function TowerRallyFlag(param1:Point)
      {
         super();
         addFrameScript(30,this.frame31);
         this.x = param1.x;
         this.y = param1.y;
         this.durationTime = 31;
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
         this.§_-2J§.stop();
      }
      
      public function unPause() : void
      {
         if(this.currentFrame != this.totalFrames)
         {
            this.§_-2J§.play();
            this.play();
         }
      }
      
      private function destroyThis() : void
      {
         this.parent.removeChild(this);
      }
      
      function frame31() : *
      {
         stop();
      }
   }
}
