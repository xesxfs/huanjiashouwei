package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class TutorialIntro extends MovieClip
   {
      
      public static const §_-4Z§:int = 0;
      
      public static const §_-Gm§:int = 1;
      
      public static const §_-9§:int = 2;
      
      public static const §_-4X§:int = 3;
       
      
      public var §_-LQ§:MovieClip;
      
      public var §_-B-§:MovieClip;
      
      public var butNext2:MovieClip;
      
      private var inTime:int = 12;
      
      private var inTimeCounter:int = 0;
      
      private var outTime:int = 18;
      
      private var outTimeCounter:int = 0;
      
      private var §_-Pl§:int;
      
      private var countNex:int = 0;
      
      public var level:Level;
      
      public function TutorialIntro(param1:Point, param2:Level)
      {
         super();
         addFrameScript(12,this.frame13,27,this.frame28,42,this.frame43,54,this.frame55);
         this.x = param1.x;
         this.y = param1.y;
         this.§_-Pl§ = §_-4Z§;
         this.level = param2;
         this.level.game.gameSounds.playGUINotificationOpen();
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      public function init(param1:Event) : void
      {
         this.gotoAndPlay("in");
         this.§_-B-§.gotoAndStop("idle");
         this.butNext2.gotoAndStop("idle");
         this.§_-LQ§.gotoAndStop("idle");
         this.addEventListener(Event.ENTER_FRAME,this.eFrameEvents,false,0,true);
      }
      
      public function eFrameEvents(param1:Event) : void
      {
         if(this.§_-Pl§ == §_-4Z§)
         {
            this.inTimeCounter++;
            if(this.inTimeCounter == this.inTime)
            {
               this.§_-B-§.addEventListener(MouseEvent.CLICK,this.§_-P§,false,0,true);
               this.§_-B-§.addEventListener(MouseEvent.ROLL_OVER,this.§_-6J§,false,0,true);
               this.§_-B-§.addEventListener(MouseEvent.ROLL_OUT,this.§_-2p§,false,0,true);
               this.§_-B-§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-64§,false,0,true);
               this.§_-B-§.addEventListener(MouseEvent.MOUSE_UP,this.§_-SJ§,false,0,true);
               this.butNext2.addEventListener(MouseEvent.CLICK,this.clickNext2,false,0,true);
               this.butNext2.addEventListener(MouseEvent.ROLL_OVER,this.rollOverNext2,false,0,true);
               this.butNext2.addEventListener(MouseEvent.ROLL_OUT,this.rollOutNext2,false,0,true);
               this.butNext2.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownNext2,false,0,true);
               this.butNext2.addEventListener(MouseEvent.MOUSE_UP,this.mouseUpNext2,false,0,true);
               this.§_-LQ§.addEventListener(MouseEvent.CLICK,this.§_-3k§,false,0,true);
               this.§_-LQ§.addEventListener(MouseEvent.ROLL_OVER,this.§_-9o§,false,0,true);
               this.§_-LQ§.addEventListener(MouseEvent.ROLL_OUT,this.§_-Jp§,false,0,true);
               this.§_-LQ§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-OE§,false,0,true);
               this.§_-LQ§.addEventListener(MouseEvent.MOUSE_UP,this.§_-FB§,false,0,true);
               this.§_-Pl§ = §_-Gm§;
            }
            return;
         }
         if(this.§_-Pl§ == §_-9§ || this.§_-Pl§ == §_-4X§)
         {
            this.outTimeCounter++;
            this.destroyThis();
         }
      }
      
      private function §_-3n§() : void
      {
         this.outTimeCounter = 0;
         this.butNext2.removeEventListener(MouseEvent.CLICK,this.clickNext2);
         this.butNext2.removeEventListener(MouseEvent.ROLL_OVER,this.rollOverNext2);
         this.butNext2.removeEventListener(MouseEvent.ROLL_OUT,this.rollOutNext2);
         this.butNext2.removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownNext2);
         this.butNext2.removeEventListener(MouseEvent.MOUSE_UP,this.mouseUpNext2);
         this.gotoAndPlay("out");
      }
      
      public function §_-P§(param1:MouseEvent) : void
      {
         this.countNex++;
         if(this.countNex > 1)
         {
            this.§_-B-§.removeEventListener(MouseEvent.CLICK,this.§_-P§);
            this.§_-B-§.removeEventListener(MouseEvent.ROLL_OVER,this.§_-6J§);
            this.§_-B-§.removeEventListener(MouseEvent.ROLL_OUT,this.§_-2p§);
            this.§_-B-§.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-64§);
            this.§_-B-§.removeEventListener(MouseEvent.MOUSE_UP,this.§_-SJ§);
            this.§_-LQ§.removeEventListener(MouseEvent.ROLL_OVER,this.§_-9o§);
            this.§_-LQ§.removeEventListener(MouseEvent.ROLL_OUT,this.§_-Jp§);
            this.§_-LQ§.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-OE§);
            this.§_-LQ§.removeEventListener(MouseEvent.MOUSE_UP,this.§_-FB§);
         }
         else
         {
            this.level.game.gameSounds.playGUINotificationOpen();
         }
         this.play();
      }
      
      public function §_-6J§(param1:MouseEvent) : void
      {
         this.level.game.gameSounds.playGUINotificationOver();
         this.§_-B-§.buttonMode = true;
         this.§_-B-§.mouseChildren = false;
         this.§_-B-§.useHandCursor = true;
         this.§_-B-§.gotoAndStop("over");
      }
      
      public function §_-2p§(param1:MouseEvent) : void
      {
         this.§_-B-§.useHandCursor = false;
         this.§_-B-§.gotoAndStop("idle");
      }
      
      public function §_-64§(param1:MouseEvent) : void
      {
         this.§_-B-§.gotoAndStop("press");
      }
      
      public function §_-SJ§(param1:MouseEvent) : void
      {
         this.§_-B-§.gotoAndStop("idle");
      }
      
      public function clickNext2(param1:MouseEvent) : void
      {
         this.§_-Pl§ = §_-9§;
         this.§_-3n§();
      }
      
      public function rollOverNext2(param1:MouseEvent) : void
      {
         this.level.game.gameSounds.playGUINotificationOver();
         this.butNext2.buttonMode = true;
         this.butNext2.mouseChildren = false;
         this.butNext2.useHandCursor = true;
         this.butNext2.gotoAndStop("over");
      }
      
      public function rollOutNext2(param1:MouseEvent) : void
      {
         this.butNext2.useHandCursor = false;
         this.butNext2.gotoAndStop("idle");
      }
      
      public function mouseDownNext2(param1:MouseEvent) : void
      {
         this.butNext2.gotoAndStop("press");
      }
      
      public function mouseUpNext2(param1:MouseEvent) : void
      {
         this.butNext2.gotoAndStop("idle");
      }
      
      public function §_-3k§(param1:MouseEvent) : void
      {
         this.§_-Pl§ = §_-9§;
         this.§_-3n§();
      }
      
      public function §_-9o§(param1:MouseEvent) : void
      {
         this.level.game.gameSounds.playGUINotificationOver();
         this.§_-LQ§.buttonMode = true;
         this.§_-LQ§.mouseChildren = false;
         this.§_-LQ§.useHandCursor = true;
         this.§_-LQ§.gotoAndStop("over");
      }
      
      public function §_-Jp§(param1:MouseEvent) : void
      {
         this.§_-LQ§.useHandCursor = false;
         this.§_-LQ§.gotoAndStop("idle");
      }
      
      public function §_-OE§(param1:MouseEvent) : void
      {
         this.§_-LQ§.gotoAndStop("press");
      }
      
      public function §_-FB§(param1:MouseEvent) : void
      {
         this.§_-LQ§.gotoAndStop("idle");
      }
      
      public function destroyThis() : void
      {
         this.level.pause(true);
         this.level.game.gameSounds.§_-Ie§();
         Level1(this.level).§_-FP§ = new SignBuildHere(new Point(253,280),Level1(this.level));
         this.level.bullets.addChild(Level1(this.level).§_-FP§);
         this.removeEventListener(Event.ENTER_FRAME,this.eFrameEvents);
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.level = null;
         this.parent.removeChild(this);
      }
      
      function frame13() : *
      {
         stop();
      }
      
      function frame28() : *
      {
         stop();
      }
      
      function frame43() : *
      {
         stop();
      }
      
      function frame55() : *
      {
         stop();
      }
   }
}
