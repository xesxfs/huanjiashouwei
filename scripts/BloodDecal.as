package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class BloodDecal extends MovieClip
   {
       
      
      private var durationTime:int;
      
      private var durationTimeCounter:int;
      
      public function BloodDecal(param1:Point)
      {
         super();
         this.x = param1.x;
         this.y = param1.y;
         this.durationTime = 180;
      }
      
      public function onFrameUpdate() : void
      {
         this.alpha = (this.durationTime - this.durationTimeCounter) / this.durationTime;
         if(this.durationTimeCounter < this.durationTime)
         {
            this.durationTimeCounter++;
            return;
         }
         this.destroyThis();
      }
      
      public function pause() : void
      {
      }
      
      public function unPause() : void
      {
      }
      
      private function destroyThis() : void
      {
         this.parent.removeChild(this);
      }
   }
}
