package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class §_-Rh§ extends MovieClip
   {
       
      
      protected var §_-Q-§:int;
      
      protected var §_-3U§:int = 114;
      
      protected var §_-DT§:int = 140;
      
      protected var §_-5U§:int;
      
      protected var §_-0p§:int;
      
      protected var §_-5Y§:int;
      
      protected const §_-CK§:int = 0;
      
      protected const §_-3X§:int = 1;
      
      protected const §_-IL§:int = 2;
      
      protected const §_-E0§:int = 3;
      
      public function §_-Rh§(param1:Point)
      {
         super();
         this.x = param1.x;
         this.y = param1.y;
         this.§_-0p§ = this.getRandom(400,800);
         this.§_-5U§ = this.getRandom(300,600);
         this.§_-Q-§ = this.§_-CK§;
         this.§_-5Y§ = 0;
         this.gotoAndStop("outside");
      }
      
      public function onFrameUpdate() : void
      {
         if(this.§_-Q-§ == this.§_-CK§)
         {
            if(this.§_-5Y§ < this.§_-0p§)
            {
               this.§_-5Y§++;
               return;
            }
            this.§_-Q-§ = this.§_-3X§;
            this.§_-5Y§ = 0;
            this.gotoAndPlay("goPort");
            return;
         }
         if(this.§_-Q-§ == this.§_-3X§)
         {
            if(this.§_-5Y§ < this.§_-3U§)
            {
               this.§_-5Y§++;
               return;
            }
            this.§_-Q-§ = this.§_-IL§;
            this.§_-5Y§ = 0;
            this.gotoAndStop("onPort");
            return;
         }
         if(this.§_-Q-§ == this.§_-IL§)
         {
            if(this.§_-5Y§ < this.§_-5U§)
            {
               this.§_-5Y§++;
               return;
            }
            this.§_-Q-§ = this.§_-E0§;
            this.§_-5Y§ = 0;
            this.gotoAndPlay("leavePort");
            return;
         }
         if(this.§_-Q-§ == this.§_-E0§)
         {
            if(this.§_-5Y§ < this.§_-DT§)
            {
               this.§_-5Y§++;
               return;
            }
            this.§_-Q-§ = this.§_-CK§;
            this.§_-5Y§ = 0;
            this.gotoAndStop("otside");
            return;
         }
      }
      
      protected function getRandom(param1:*, param2:*) : Number
      {
         var _loc3_:Number = NaN;
         _loc3_ = Math.round(Math.random() * (param2 - param1)) + param1;
         return _loc3_;
      }
      
      public function destroyThis() : void
      {
         this.parent.removeChild(this);
      }
   }
}
