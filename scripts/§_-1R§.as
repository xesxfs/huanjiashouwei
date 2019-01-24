package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class §_-1R§ extends MovieClip
   {
       
      
      public function §_-1R§(param1:Point, param2:Boolean = false)
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
         this.scaleY = 1 - (param1 - param2) / param1;
      }
   }
}
