package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class TowerArcherMusketeerSmoke extends MovieClip
   {
       
      
      private var §_-0j§:int;
      
      private var §_-1A§:int;
      
      private var §_-61§:int;
      
      public function TowerArcherMusketeerSmoke(param1:Point, param2:Point)
      {
         super();
         addFrameScript(11,this.frame12);
         var _loc3_:Number = 0;
         var _loc4_:Number = 0;
         var _loc5_:Number = 0;
         var _loc6_:Number = 0;
         var _loc7_:Number = 0;
         this.x = param1.x;
         this.y = param1.y;
         this.§_-0j§ = 13;
         this.§_-1A§ = 0;
         this.§_-61§ = 10;
         _loc3_ = param2.y - this.y;
         _loc4_ = param2.x - this.x;
         _loc7_ = Math.atan2(_loc3_,_loc4_);
         _loc5_ = Math.sin(_loc7_) * this.§_-61§;
         _loc6_ = Math.cos(_loc7_) * this.§_-61§;
         this.x = this.x + _loc6_;
         this.y = this.y + _loc5_;
         this.rotation = 360 - Math.atan2(-_loc5_,_loc6_) * 180 / Math.PI;
      }
      
      public function onFrameUpdate() : void
      {
         if(this.§_-1A§ < this.§_-0j§)
         {
            this.§_-1A§++;
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
         if(this.currentFrameLabel != "smokeEnd")
         {
            this.play();
         }
      }
      
      private function destroyThis() : void
      {
         this.parent.removeChild(this);
      }
      
      function frame12() : *
      {
         stop();
      }
   }
}
