package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class VeznanSoulController extends MovieClip
   {
       
      
      private var initTime:int = 1;
      
      private var initTimeCounter:int = 0;
      
      private var §_-Q8§:Point;
      
      private var §_-3G§:int;
      
      private var §_-Gy§:int;
      
      private var §_-A0§:int;
      
      private var §_-Hx§:int;
      
      private var §_-Ss§:int;
      
      private var §_-§:int;
      
      private var cRoot:Level;
      
      public function VeznanSoulController(param1:Point)
      {
         super();
         this.§_-Q8§ = param1;
         this.§_-3G§ = 60;
         this.§_-Gy§ = 0;
         this.§_-A0§ = 330;
         this.§_-Hx§ = 230;
         this.§_-Ss§ = 10;
         this.§_-§ = 10;
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
      }
      
      public function onFrameUpdate() : void
      {
         if(this.initTimeCounter < this.initTime)
         {
            this.initTimeCounter++;
            return;
         }
         if(this.§_-3G§ == this.§_-Gy§)
         {
            return;
         }
         if(this.§_-§ < this.§_-Ss§)
         {
            this.§_-§++;
            return;
         }
         if(Math.random() > 0.75)
         {
            this.cRoot.bullets.addChild(new VeznanSoul(this.§_-Q8§,this.getRandom(this.§_-Hx§,this.§_-A0§)));
         }
         this.cRoot.bullets.addChild(new VeznanSoul(this.§_-Q8§,this.getRandom(this.§_-Hx§,this.§_-A0§)));
         this.§_-Gy§++;
         this.§_-§ = 0;
         if(this.§_-Ss§ >= 2)
         {
            this.§_-Ss§ = this.§_-Ss§ - 1;
         }
      }
      
      public function pause() : void
      {
      }
      
      public function unPause() : void
      {
      }
      
      public function getRandom(param1:*, param2:*) : Number
      {
         var _loc3_:Number = NaN;
         _loc3_ = Math.round(Math.random() * (param2 - param1)) + param1;
         return _loc3_;
      }
      
      public function destroyThis() : void
      {
         this.cRoot = null;
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.parent.removeChild(this);
      }
   }
}
