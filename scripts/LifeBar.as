package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class LifeBar extends MovieClip
   {
       
      
      protected var §_-PJ§:int;
      
      protected var §_-4t§:int;
      
      public function LifeBar(param1:Point, param2:int, param3:int)
      {
         super();
         this.x = param1.x;
         this.y = param1.y;
         this.§_-PJ§ = param2;
         this.§_-4t§ = param3;
      }
      
      public function updateMaxHealth(param1:int, param2:int) : void
      {
         this.§_-PJ§ = param1;
         this.§_-4t§ = param2;
      }
      
      public function updateProgress(param1:int) : void
      {
      }
      
      public function flip(param1:int) : void
      {
         this.scaleX = param1;
      }
      
      public function show() : void
      {
         this.visible = true;
      }
      
      public function hide() : void
      {
         this.visible = false;
      }
   }
}
