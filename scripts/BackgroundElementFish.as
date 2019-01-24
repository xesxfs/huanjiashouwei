package
{
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class BackgroundElementFish extends §_-Bx§
   {
       
      
      private var jumpTime:int;
      
      private var jumpTimeCounter:int;
      
      public function BackgroundElementFish(param1:Point)
      {
         addFrameScript(22,this.frame23);
         super(param1);
         this.jumpTime = this.getRandom(150,300);
         this.jumpTimeCounter = 0;
         this.gotoAndStop("jumpEnd");
         if(Math.random() > 0.5)
         {
            this.scaleX = -1;
         }
         this.addEventListener(MouseEvent.CLICK,this.clickEvents,false,0,true);
      }
      
      override public function clickEvents(param1:MouseEvent) : void
      {
         this.cRoot.freeMenues();
         this.cRoot.game.gameAchievement.catchAFish(this.cRoot);
         Level(this.parent.parent).game.gameSounds.playTeslaChargedBolt();
      }
      
      override public function onFrameUpdate() : void
      {
         if(this.jumpTimeCounter < this.jumpTime)
         {
            this.jumpTimeCounter++;
            return;
         }
         this.jumpTimeCounter = 0;
         this.gotoAndPlay("jump");
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
      
      function frame23() : *
      {
         stop();
      }
   }
}
