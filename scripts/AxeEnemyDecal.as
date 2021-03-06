package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class AxeEnemyDecal extends MovieClip
   {
       
      
      private var durationTime:int;
      
      private var durationTimeCounter:int;
      
      public function AxeEnemyDecal(param1:Point, param2:int)
      {
         super();
         addFrameScript(0,this.frame1,11,this.frame12);
         this.x = param1.x;
         this.y = param1.y;
         this.durationTime = 15;
         if(param2 == -1)
         {
            this.scaleX = -1;
         }
      }
      
      public function onFrameUpdate() : void
      {
         if(this.durationTimeCounter < this.durationTime)
         {
            this.durationTimeCounter++;
            this.alpha = this.alpha - 0.02;
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
      
      function frame12() : *
      {
         stop();
      }
   }
}
