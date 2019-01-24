package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class §_-H8§ extends LifeBar
   {
       
      
      public var §_-LC§:MovieClip;
      
      public function §_-H8§(param1:Point, param2:int, param3:int)
      {
         super(param1,param3,param2);
      }
      
      override public function updateProgress(param1:int) : void
      {
         this.§_-4t§ = param1;
         this.§_-LC§.scaleX = 1 - (this.§_-PJ§ - this.§_-4t§) / this.§_-PJ§;
      }
   }
}
