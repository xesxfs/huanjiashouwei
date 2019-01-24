package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class §_-8O§ extends MovieClip
   {
       
      
      public function §_-8O§(param1:Point)
      {
         super();
         addFrameScript(19,this.frame20);
         this.x = param1.x;
         this.y = param1.y;
      }
      
      public function onFrameUpdate() : void
      {
      }
      
      public function pause() : void
      {
         this.stop();
      }
      
      public function unPause() : void
      {
         if(this.currentFrameLabel != "shadownEnd")
         {
            this.play();
         }
      }
      
      public function destroyThis() : void
      {
         this.parent.removeChild(this);
      }
      
      function frame20() : *
      {
         stop();
      }
   }
}
