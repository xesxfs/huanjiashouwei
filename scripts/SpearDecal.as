package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class SpearDecal extends MovieClip
   {
       
      
      private var durationTime:int;
      
      private var durationTimeCounter:int;
      
      public function SpearDecal(param1:Point)
      {
         super();
         addFrameScript(0,this.frame1);
         this.x = param1.x;
         this.y = param1.y;
         this.durationTime = 35;
         this.rotation = -80 - Math.random() * 20;
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
      }
      
      public function unPause() : void
      {
      }
      
      private function destroyThis() : void
      {
         this.parent.removeChild(this);
      }
      
      function frame1() : *
      {
         stop();
      }
   }
}
