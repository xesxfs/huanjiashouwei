package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   public class Decal extends MovieClip
   {
       
      
      public var durationTimeCounter:int = 0;
      
      public var durationTime:int;
      
      private var §_-Hd§:String;
      
      public function Decal(param1:Number, param2:Number, param3:String, param4:int, param5:Number)
      {
         super();
         this.scaleX = this.scaleY = param5;
         this.x = param1;
         this.y = param2;
         this.durationTime = param4;
         this.§_-Hd§ = param3;
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      private function init(param1:Event) : void
      {
         this.gotoAndStop(this.§_-Hd§);
         if(Math.random() * 100 < 50)
         {
            this.scaleX = this.scaleX * -1;
         }
      }
      
      public function onFrameUpdate() : void
      {
         this.alpha = (this.durationTime - this.durationTimeCounter) / this.durationTime;
         this.durationTimeCounter++;
         if(this.durationTimeCounter == this.durationTime)
         {
            this.destroyThis();
         }
      }
      
      public function pause() : void
      {
      }
      
      public function unPause() : void
      {
      }
      
      public function destroyThis() : void
      {
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.parent.removeChild(this);
      }
   }
}
