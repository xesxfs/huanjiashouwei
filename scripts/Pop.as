package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class Pop extends MovieClip
   {
       
      
      public var pop:MovieClip;
      
      private var durationTime:int;
      
      private var durationTimeCounter:int = 0;
      
      public function Pop(param1:Point, param2:String = "zap")
      {
         super();
         addFrameScript(19,this.frame20);
         this.x = param1.x;
         this.y = param1.y;
         this.pop.gotoAndStop(param2);
         this.durationTime = this.totalFrames - 1;
         this.rotation = this.getRandom(0,20) * this.getFlip();
      }
      
      public function getFlip() : int
      {
         if(Math.random() > 0.5)
         {
            return 1;
         }
         return -1;
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
      }
      
      public function unPause() : void
      {
         if(this.currentFrame != this.totalFrames)
         {
            this.play();
         }
      }
      
      protected function getRandom(param1:*, param2:*) : Number
      {
         var _loc3_:Number = NaN;
         _loc3_ = Math.round(Math.random() * (param2 - param1)) + param1;
         return _loc3_;
      }
      
      protected function destroyThis() : void
      {
         this.parent.removeChild(this);
      }
      
      function frame20() : *
      {
         stop();
      }
   }
}
