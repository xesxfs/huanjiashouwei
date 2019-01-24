package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class §_-CX§ extends MovieClip
   {
       
      
      public function §_-CX§(param1:Point, param2:Boolean = false)
      {
         super();
         this.x = param1.x;
         this.y = param1.y;
         if(param2)
         {
            this.updateLoadingBar(5,0);
         }
      }
      
      public function updateLoadingBar(param1:int, param2:int) : void
      {
         this.scaleY = 1 - param2 / param1;
      }
      
      public function reset() : void
      {
         this.scaleY = 1;
      }
   }
}
