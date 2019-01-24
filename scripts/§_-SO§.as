package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class §_-SO§ extends MovieClip
   {
       
      
      public function §_-SO§(param1:Point)
      {
         super();
         this.x = param1.x;
         this.y = param1.y;
      }
      
      public function closeMe() : void
      {
         this.destroyThis();
      }
      
      public function destroyThis() : void
      {
         this.parent.removeChild(this);
      }
   }
}
