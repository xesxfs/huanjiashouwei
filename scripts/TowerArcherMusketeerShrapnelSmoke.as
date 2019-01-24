package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class TowerArcherMusketeerShrapnelSmoke extends MovieClip
   {
       
      
      private var §_-0j§:int;
      
      private var §_-1A§:int;
      
      private var §_-61§:int;
      
      private var sName:String;
      
      private var cRoot:Level;
      
      public function TowerArcherMusketeerShrapnelSmoke(param1:Point, param2:Point, param3:Level)
      {
         super();
         addFrameScript(11,this.frame12);
         var _loc4_:Number = 0;
         var _loc5_:Number = 0;
         var _loc6_:Number = 0;
         var _loc7_:Number = 0;
         var _loc8_:Number = 0;
         this.x = param1.x;
         this.y = param1.y;
         this.§_-0j§ = 30;
         this.§_-1A§ = 0;
         this.§_-61§ = 5;
         _loc4_ = param2.y - this.y;
         _loc5_ = param2.x - this.x;
         _loc8_ = Math.atan2(_loc4_,_loc5_);
         _loc6_ = Math.sin(_loc8_) * this.§_-61§;
         _loc7_ = Math.cos(_loc8_) * this.§_-61§;
         this.x = this.x + _loc7_;
         this.y = this.y + _loc6_;
         this.cRoot = param3;
         this.sName = Math.random().toString();
         this.cRoot.game.gameSounds.§_-BY§(this.sName);
         this.rotation = 360 - Math.atan2(-_loc6_,_loc7_) * 180 / Math.PI;
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
         this.cRoot.game.gameSounds.removeSound(this.sName);
         this.cRoot = null;
         this.parent.removeChild(this);
      }
      
      function frame12() : *
      {
         stop();
      }
   }
}
