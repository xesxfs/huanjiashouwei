package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.getQualifiedClassName;
   
   public class Notification extends MovieClip
   {
      
      protected static const §_-4Z§:int = 0;
      
      protected static const §_-Gm§:int = 1;
      
      protected static const §_-9§:int = 2;
       
      
      protected var level:Level;
      
      protected var §_-Eo§:Boolean;
      
      protected var inTime:int = 34;
      
      protected var inTimeCounter:int = 0;
      
      protected var outTime:int = 15;
      
      protected var outTimeCounter:int = 0;
      
      protected var §_-Pl§:int;
      
      public function Notification(param1:Level, param2:Boolean = true)
      {
         super();
         this.§_-Pl§ = §_-4Z§;
         this.§_-Eo§ = param2;
         this.level = param1;
         this.level.freeMenues();
         this.level.cancelAllOnKeyPress();
         this.level.game.gameSounds.playGUINotificationOpen();
         this.level.game.gameAchievement.viewNotification(param1,getQualifiedClassName(this));
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      public function init(param1:Event) : void
      {
         this.gotoAndPlay("in");
         this.addEventListener(Event.ENTER_FRAME,this.eFrameEvents,false,0,true);
      }
      
      public function eFrameEvents(param1:Event) : void
      {
         if(this.§_-Pl§ == §_-4Z§)
         {
            this.inTimeCounter++;
            if(this.inTimeCounter == this.inTime)
            {
               if(this.§_-Eo§)
               {
                  this.onInit();
               }
               MovieClip(this).butClose.addEventListener(MouseEvent.CLICK,this.close,false,0,true);
               MovieClip(this).butClose.addEventListener(MouseEvent.ROLL_OVER,this.butCloseRollOver,false,0,true);
               MovieClip(this).butClose.addEventListener(MouseEvent.ROLL_OUT,this.§_-Gq§,false,0,true);
               MovieClip(this).butClose.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-2n§,false,0,true);
               MovieClip(this).butClose.addEventListener(MouseEvent.MOUSE_UP,this.§_-Fr§,false,0,true);
               if(MovieClip(this).butClose.hitTestPoint(stage.mouseX,stage.mouseY))
               {
                  MovieClip(this).butClose.buttonMode = true;
                  MovieClip(this).butClose.mouseChildren = false;
                  MovieClip(this).butClose.useHandCursor = true;
                  MovieClip(this).butClose.gotoAndStop("over");
               }
               this.§_-Pl§ = §_-Gm§;
            }
            return;
         }
         if(this.§_-Pl§ == §_-9§)
         {
            this.outTimeCounter++;
            if(this.outTimeCounter == this.outTime)
            {
               this.level.pause(true);
               this.destroyThis();
            }
         }
      }
      
      protected function butCloseRollOver(param1:MouseEvent) : void
      {
         this.level.game.gameSounds.playGUINotificationOver();
         MovieClip(this).butClose.buttonMode = true;
         MovieClip(this).butClose.mouseChildren = false;
         MovieClip(this).butClose.useHandCursor = true;
         MovieClip(this).butClose.gotoAndStop("over");
      }
      
      protected function §_-Gq§(param1:MouseEvent) : void
      {
         MovieClip(this).butClose.useHandCursor = false;
         MovieClip(this).butClose.gotoAndStop("idle");
      }
      
      protected function §_-2n§(param1:MouseEvent) : void
      {
         MovieClip(this).butClose.gotoAndStop("press");
      }
      
      protected function §_-Fr§(param1:MouseEvent) : void
      {
         MovieClip(this).butClose.gotoAndStop("over");
      }
      
      protected function onInit() : void
      {
      }
      
      protected function onExit() : void
      {
      }
      
      protected function close(param1:MouseEvent) : void
      {
         this.level.game.gameSounds.§_-Ie§();
         this.onExit();
         MovieClip(this).butClose.removeEventListener(MouseEvent.CLICK,this.close);
         MovieClip(this).butClose.removeEventListener(MouseEvent.ROLL_OVER,this.butCloseRollOver);
         MovieClip(this).butClose.removeEventListener(MouseEvent.ROLL_OUT,this.§_-Gq§);
         MovieClip(this).butClose.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-2n§);
         MovieClip(this).butClose.removeEventListener(MouseEvent.MOUSE_UP,this.§_-Fr§);
         this.§_-Pl§ = §_-9§;
         this.gotoAndPlay("out");
         if(this.stage != null)
         {
            this.stage.focus = this.stage;
         }
      }
      
      protected function destroyThis() : void
      {
         this.level = null;
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.removeEventListener(Event.ENTER_FRAME,this.eFrameEvents);
         this.parent.removeChild(this);
      }
   }
}
