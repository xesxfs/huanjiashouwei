package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class WaveFlagReward extends MovieClip
   {
       
      
      public var money:MovieClip;
      
      private var durationTime:int = 40;
      
      private var durationTimeCounter:int = 0;
      
      public function WaveFlagReward(param1:Point, param2:int)
      {
         super();
         addFrameScript(39,this.frame40);
         this.x = param1.x;
         this.y = param1.y;
         this.money.gfx.txt.text = "+" + param2.toString();
      }
      
      public function onFrameUpdate() : void
      {
         this.durationTimeCounter++;
         if(this.durationTimeCounter <= this.durationTime)
         {
            return;
         }
         this.destroyThis();
      }
      
      public function pause() : void
      {
         this.stop();
         this.money.stop();
      }
      
      public function unPause() : void
      {
         if(this.currentFrame != this.totalFrames)
         {
            this.play();
         }
         if(this.money.currentFrame != this.money.totalFrames)
         {
            this.money.play();
         }
      }
      
      protected function destroyThis() : void
      {
         this.parent.removeChild(this);
      }
      
      function frame40() : *
      {
         stop();
      }
   }
}
