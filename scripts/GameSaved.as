package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   public class GameSaved extends MovieClip
   {
       
      
      public function GameSaved()
      {
         super();
         this.x = 246;
         this.y = 10;
         this.addEventListener(Event.ENTER_FRAME,this.eFrameEvents,false,0,true);
      }
      
      public function eFrameEvents(param1:Event) : void
      {
         if(this.currentFrame == this.totalFrames)
         {
            this.destroyThis();
         }
      }
      
      public function destroyThis() : void
      {
         this.removeEventListener(Event.ENTER_FRAME,this.eFrameEvents);
         this.parent.removeChild(this);
      }
   }
}
