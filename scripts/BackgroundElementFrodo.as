package
{
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class BackgroundElementFrodo extends §_-Bx§
   {
       
      
      private var §_-DV§;
      
      private var freeTime = 129;
      
      private var freeTimeCounter = 0;
      
      private var §_-0B§:int;
      
      public function BackgroundElementFrodo(param1:Point)
      {
         addFrameScript(9,this.frame10,139,this.frame140);
         super(param1);
         this.§_-0B§ = 0;
         this.gotoAndStop("hit");
         this.addEventListener(MouseEvent.CLICK,this.clickEvents,false,0,true);
      }
      
      override public function onFrameUpdate() : void
      {
         if(this.§_-DV§)
         {
            this.freeTimeCounter++;
            if(this.freeTimeCounter >= this.freeTime)
            {
               this.cRoot.game.gameAchievement.helpFredo(this.cRoot);
               this.destroyThis();
            }
            return;
         }
      }
      
      override public function unPause() : void
      {
         switch(this.currentFrameLabel)
         {
            case "hitEnd":
               this.gotoAndStop("hit");
               break;
            case "freeEnd":
               break;
            default:
               this.play();
         }
      }
      
      override public function clickEvents(param1:MouseEvent) : void
      {
         this.cRoot.freeMenues();
         this.§_-0B§++;
         if(this.§_-0B§ == 10)
         {
            this.removeEventListener(MouseEvent.CLICK,this.clickEvents);
            this.§_-DV§ = true;
            this.gotoAndPlay("free");
         }
         else
         {
            this.gotoAndPlay("hit");
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
      
      function frame10() : *
      {
         gotoAndStop("hit");
      }
      
      function frame140() : *
      {
         stop();
      }
   }
}
