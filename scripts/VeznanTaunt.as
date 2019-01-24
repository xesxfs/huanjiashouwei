package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class VeznanTaunt extends MovieClip
   {
       
      
      public var animation:MovieClip;
      
      private var §_-Bk§:int;
      
      private var §_-Td§:int;
      
      public function VeznanTaunt(param1:Point, param2:int)
      {
         super();
         addFrameScript(0,this.frame1);
         this.x = param1.x;
         this.y = param1.y;
         this.§_-Bk§ = 120;
         this.§_-Td§ = 0;
         this.gotoAndStop(param2);
      }
      
      public function onFrameUpdate() : void
      {
         if(this.§_-Td§ < this.§_-Bk§)
         {
            this.§_-Td§++;
            return;
         }
         this.destroyThis();
      }
      
      public function pause() : void
      {
         this.animation.stop();
      }
      
      public function unPause() : void
      {
         this.animation.play();
      }
      
      public function destroyThis() : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      function frame1() : *
      {
         stop();
      }
   }
}
