package
{
   import flash.display.MovieClip;
   
   public class §_-NQ§ extends MovieClip
   {
       
      
      public var §_-2o§:MovieClip;
      
      public var loadTime:int;
      
      public var percentPerFrame:Number;
      
      public function §_-NQ§(param1:int, param2:int, param3:int)
      {
         super();
         this.loadTime = param3;
         this.percentPerFrame = 1 / this.loadTime;
         this.x = param1;
         this.y = param2;
      }
      
      public function onFrameUpdate() : void
      {
         this.§_-2o§.scaleX = this.§_-2o§.scaleX + this.percentPerFrame;
      }
      
      public function destroyThis() : void
      {
         this.parent.removeChild(this);
      }
   }
}
