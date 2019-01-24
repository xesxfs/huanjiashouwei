package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class BloodGrey extends MovieClip
   {
       
      
      private var durationTime:int;
      
      private var durationTimeCounter:int;
      
      private var level:Level;
      
      public function BloodGrey(param1:Point, param2:Number, param3:Level)
      {
         super();
         addFrameScript(10,this.frame11);
         this.x = param1.x;
         this.y = param1.y;
         this.rotation = param2;
         this.durationTime = 10;
         this.level = param3;
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
      
      private function destroyThis() : void
      {
         this.level = null;
         this.parent.removeChild(this);
      }
      
      function frame11() : *
      {
         stop();
      }
   }
}
