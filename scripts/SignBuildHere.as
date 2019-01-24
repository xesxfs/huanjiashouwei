package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class SignBuildHere extends MovieClip
   {
       
      
      private var level:Level1;
      
      public function SignBuildHere(param1:Point, param2:Level1)
      {
         super();
         this.x = param1.x;
         this.y = param1.y;
         this.level = param2;
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
         this.play();
      }
      
      public function closeMe() : void
      {
         this.destroyThis();
      }
      
      public function destroyThis() : void
      {
         this.level.§_-FP§ = null;
         this.level = null;
         this.parent.removeChild(this);
      }
   }
}
