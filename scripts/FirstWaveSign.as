package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class FirstWaveSign extends MovieClip
   {
       
      
      private var §_-K7§:Boolean = false;
      
      private var initTime:int = 12;
      
      private var initTimeCounter:int = 0;
      
      public function FirstWaveSign(param1:Point)
      {
         super();
         this.x = param1.x;
         this.y = param1.y;
         this.visible = false;
      }
      
      public function onFrameUpdate() : void
      {
         if(this.§_-K7§)
         {
            return;
         }
         if(this.initTimeCounter < this.initTime)
         {
            this.initTimeCounter++;
            return;
         }
         this.visible = true;
         this.§_-K7§ = true;
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
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
   }
}
