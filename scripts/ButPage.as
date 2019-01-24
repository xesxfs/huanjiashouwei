package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextField;
   
   public class ButPage extends MovieClip
   {
       
      
      public var §_-07§:TextField;
      
      private var §_-J8§:int;
      
      private var game:Game;
      
      private var §_-L-§:Boolean;
      
      public function ButPage(param1:Point, param2:int, param3:int, param4:Game)
      {
         super();
         addFrameScript(0,this.frame1);
         this.x = param1.x;
         this.y = param1.y;
         this.§_-J8§ = param2;
         this.game = param4;
         if(param2 == param3)
         {
            this.gotoAndStop("selected");
            this.§_-L-§ = false;
         }
         else
         {
            this.gotoAndStop("idle");
            this.§_-L-§ = true;
         }
         this.§_-07§.text = param2.toString();
         this.addEventListener(MouseEvent.MOUSE_DOWN,this.click,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OVER,this.rollOverEvents,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,this.rollOutEvents,false,0,true);
         this.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDown,false,0,true);
         this.addEventListener(MouseEvent.MOUSE_UP,this.mouseUp,false,0,true);
      }
      
      public function click(param1:MouseEvent) : void
      {
         if(!this.§_-L-§)
         {
            return;
         }
         this.game.gameSounds.playGUIButtonCommon();
         MovieClip(this.parent.parent).changePage(this.§_-J8§);
      }
      
      public function rollOverEvents(param1:MouseEvent) : void
      {
         if(!this.§_-L-§)
         {
            return;
         }
         this.gotoAndStop("over");
         this.buttonMode = true;
         this.mouseChildren = false;
         this.useHandCursor = true;
      }
      
      public function rollOutEvents(param1:MouseEvent) : void
      {
         if(!this.§_-L-§)
         {
            return;
         }
         this.gotoAndStop("idle");
         this.useHandCursor = false;
      }
      
      protected function mouseDown(param1:MouseEvent) : void
      {
         if(!this.§_-L-§)
         {
            return;
         }
         this.gotoAndStop("press");
      }
      
      protected function mouseUp(param1:MouseEvent) : void
      {
         if(!this.§_-L-§)
         {
            return;
         }
         this.gotoAndStop("over");
      }
      
      public function destroyThis() : void
      {
         this.removeEventListener(MouseEvent.MOUSE_DOWN,this.click);
         this.removeEventListener(MouseEvent.ROLL_OVER,this.rollOverEvents);
         this.removeEventListener(MouseEvent.ROLL_OUT,this.rollOutEvents);
         this.removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseDown);
         this.removeEventListener(MouseEvent.MOUSE_UP,this.mouseUp);
         this.parent.removeChild(this);
      }
      
      function frame1() : *
      {
         stop();
      }
   }
}
