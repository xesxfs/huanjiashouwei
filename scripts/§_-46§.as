package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class §_-46§ extends MovieClip
   {
       
      
      private var fadeSpeed:Number;
      
      private var fadeTime:int;
      
      private var fadeTimeCounter:int;
      
      public function §_-46§(param1:Point, param2:Number)
      {
         super();
         addFrameScript(0,this.frame1);
         this.x = param1.x;
         this.y = param1.y;
         this.rotation = param2;
         this.fadeTime = 5;
         this.fadeTimeCounter = 0;
         this.fadeSpeed = 0.25;
      }
      
      public function onFrameUpdate() : void
      {
         this.fadeTimeCounter++;
         if(this.fadeTime == this.fadeTimeCounter)
         {
            this.destroyThis();
            return;
         }
         this.alpha = this.alpha - this.fadeSpeed;
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
