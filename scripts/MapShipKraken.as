package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class MapShipKraken extends MovieClip
   {
       
      
      protected var §_-Q-§:int;
      
      protected var §_-FN§:int = 500;
      
      protected var §_-2s§:int = 255;
      
      protected var §_-5Y§:int;
      
      protected const §_-Mf§:int = 0;
      
      protected const §_-1q§:int = 1;
      
      public function MapShipKraken(param1:Point)
      {
         super();
         addFrameScript(254,this.frame255);
         this.x = param1.x;
         this.y = param1.y;
         this.§_-Q-§ = this.§_-Mf§;
         this.§_-5Y§ = 0;
         this.gotoAndStop("waiting");
      }
      
      public function onFrameUpdate() : void
      {
         if(this.§_-Q-§ == this.§_-Mf§)
         {
            if(this.§_-5Y§ < this.§_-FN§)
            {
               this.§_-5Y§++;
               return;
            }
            this.§_-Q-§ = this.§_-1q§;
            this.§_-5Y§ = 0;
            this.gotoAndPlay("goKraken");
            return;
         }
         if(this.§_-Q-§ == this.§_-1q§)
         {
            if(this.§_-5Y§ < this.§_-2s§)
            {
               this.§_-5Y§++;
               return;
            }
            this.§_-Q-§ = this.§_-Mf§;
            this.§_-5Y§ = 0;
            this.gotoAndStop("waiting");
            return;
         }
      }
      
      public function destroyThis() : void
      {
         this.parent.removeChild(this);
      }
      
      function frame255() : *
      {
         stop();
      }
   }
}
