package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class §_-b§ extends MovieClip
   {
       
      
      private var durationTime:int = 16;
      
      private var durationTimeCounter:int = 0;
      
      private var cRoot:Level;
      
      public function §_-b§(param1:Point, param2:Level)
      {
         super();
         addFrameScript(16,this.frame17);
         this.cRoot = param2;
         this.x = param1.x;
         this.y = param1.y;
      }
      
      public function onFrameUpdate() : void
      {
         if(this.durationTimeCounter < this.durationTime)
         {
            this.durationTimeCounter++;
            return;
         }
         this.cRoot.addToDecal(new §_-6H§(new Point(this.x,this.y)));
         this.destroyThis();
      }
      
      public function pause() : void
      {
         this.stop();
      }
      
      public function unPause() : void
      {
         if(this.currentFrameLabel != "desintegrateEnd")
         {
            this.play();
         }
      }
      
      private function destroyThis() : void
      {
         this.cRoot = null;
         this.parent.removeChild(this);
      }
      
      function frame17() : *
      {
         stop();
      }
   }
}
