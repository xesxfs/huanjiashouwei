package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class TowerArcherMusketeerSniperParticle extends MovieClip
   {
       
      
      private var durationTime;
      
      private var durationTimeCounter;
      
      public function TowerArcherMusketeerSniperParticle(param1:Point, param2:Number)
      {
         super();
         this.x = param1.x;
         this.y = param1.y;
         this.durationTime = 13;
         this.durationTimeCounter = 0;
         this.rotation = param2;
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
         this.play();
      }
      
      public function destroyThis() : void
      {
         this.parent.removeChild(this);
      }
   }
}
