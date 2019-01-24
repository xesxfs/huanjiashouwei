package
{
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class BackgroundElementBubble extends §_-Bx§
   {
       
      
      private var jumpTime:int;
      
      private var jumpTimeCounter:int;
      
      public function BackgroundElementBubble(param1:Point)
      {
         addFrameScript(48,this.frame49);
         super(param1);
         this.jumpTime = this.getRandom(150,400);
         this.jumpTimeCounter = 0;
         this.gotoAndStop("popEnd");
         if(Math.random() > 0.5)
         {
            this.scaleX = -1;
         }
         this.addEventListener(MouseEvent.CLICK,this.clickEvents,false,0,true);
      }
      
      override public function clickEvents(param1:MouseEvent) : void
      {
         this.cRoot.freeMenues();
      }
      
      override public function onFrameUpdate() : void
      {
         if(this.jumpTimeCounter < this.jumpTime)
         {
            this.jumpTimeCounter++;
            return;
         }
         this.jumpTimeCounter = 0;
         this.gotoAndPlay("pop");
      }
      
      override public function pause() : void
      {
         this.stop();
      }
      
      override public function unPause() : void
      {
         if(this.currentFrame != this.totalFrames)
         {
            this.play();
         }
      }
      
      override protected function destroyThis() : void
      {
         this.cRoot = null;
         this.removeEventListener(MouseEvent.ROLL_OVER,rollOver);
         this.removeEventListener(MouseEvent.ROLL_OUT,rollOut);
         this.removeEventListener(MouseEvent.CLICK,this.clickEvents);
         this.removeEventListener(Event.ADDED_TO_STAGE,init);
         this.parent.removeChild(this);
      }
      
      function frame49() : *
      {
         stop();
      }
   }
}
