package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class BombDecal extends MovieClip
   {
       
      
      private var durationTime:int;
      
      private var durationTimeCounter:int;
      
      public function BombDecal(param1:Point)
      {
         super();
         this.x = param1.x;
         this.y = param1.y;
         this.durationTime = 180;
         this.scaleX = this.scaleY = Math.random() / 2 + 1;
         if(Math.random() * 100 < 50)
         {
            this.scaleX = this.scaleX * -1;
         }
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
