package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class TowerBuildingCloud extends MovieClip
   {
       
      
      private var §_-51§:int = 13;
      
      private var §_-OL§:int;
      
      public function TowerBuildingCloud(param1:Point)
      {
         super();
         addFrameScript(12,this.frame13);
         this.x = param1.x;
         this.y = param1.y;
      }
      
      public function onFrameUpdate() : void
      {
         if(this.§_-OL§ < this.§_-51§)
         {
            this.§_-OL§++;
            return;
         }
         this.destroyThis();
      }
      
      public function pause() : void
      {
         this.stop();
      }
      
      public function unPause() : void
      {
         if(this.currentFrameLabel != "cloudEnd")
         {
            this.play();
         }
      }
      
      private function destroyThis() : void
      {
         this.parent.removeChild(this);
      }
      
      function frame13() : *
      {
         stop();
      }
   }
}
