package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class MainMenuErrorWarning extends MovieClip
   {
       
      
      public var btnContinue:MovieClip;
      
      public var §_-K9§:MovieClip;
      
      public var action:String;
      
      public var cRoot:MainMenu;
      
      public function MainMenuErrorWarning(param1:MainMenu)
      {
         super();
         addFrameScript(0,this.frame1);
         this.cRoot = param1;
         this.x = 0;
         this.y = 0;
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      protected function init(param1:Event) : void
      {
         this.§_-HR§();
      }
      
      public function §_-HR§() : void
      {
         this.gotoAndStop(1);
         this.btnContinue.gotoAndStop("idle");
         this.§_-K9§.gotoAndStop("idle");
         this.btnContinue.txt.text = "TRY AGAIN";
         this.§_-K9§.txt.text = "CANCEL";
         this.§_-NT§();
      }
      
      public function §_-NT§() : void
      {
         this.btnContinue.addEventListener(MouseEvent.CLICK,this.§_-v§,false,0,true);
         this.btnContinue.addEventListener(MouseEvent.ROLL_OVER,this.§_-1h§,false,0,true);
         this.btnContinue.addEventListener(MouseEvent.ROLL_OUT,this.§_-M3§,false,0,true);
         this.btnContinue.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-9Z§,false,0,true);
         this.btnContinue.addEventListener(MouseEvent.MOUSE_UP,this.§_-1w§,false,0,true);
         this.§_-K9§.addEventListener(MouseEvent.CLICK,this.§_-3k§,false,0,true);
         this.§_-K9§.addEventListener(MouseEvent.ROLL_OVER,this.§_-9o§,false,0,true);
         this.§_-K9§.addEventListener(MouseEvent.ROLL_OUT,this.§_-Jp§,false,0,true);
         this.§_-K9§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-OE§,false,0,true);
         this.§_-K9§.addEventListener(MouseEvent.MOUSE_UP,this.§_-FB§,false,0,true);
      }
      
      public function removeListeners() : void
      {
         if(this.btnContinue != null && this.btnContinue.hasEventListener(MouseEvent.CLICK))
         {
            this.btnContinue.removeEventListener(MouseEvent.CLICK,this.§_-v§);
            this.btnContinue.removeEventListener(MouseEvent.ROLL_OVER,this.§_-1h§);
            this.btnContinue.removeEventListener(MouseEvent.ROLL_OUT,this.§_-M3§);
            this.btnContinue.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-9Z§);
            this.btnContinue.removeEventListener(MouseEvent.MOUSE_UP,this.§_-1w§);
            this.§_-K9§.removeEventListener(MouseEvent.CLICK,this.§_-3k§);
            this.§_-K9§.removeEventListener(MouseEvent.ROLL_OVER,this.§_-9o§);
            this.§_-K9§.removeEventListener(MouseEvent.ROLL_OUT,this.§_-Jp§);
            this.§_-K9§.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-OE§);
            this.§_-K9§.removeEventListener(MouseEvent.MOUSE_UP,this.§_-FB§);
         }
      }
      
      protected function §_-v§(param1:MouseEvent) : void
      {
         this.btnContinue.removeEventListener(MouseEvent.CLICK,this.§_-v§);
         this.cRoot.§_-GY§();
         this.removeListeners();
         this.gotoAndStop(2);
      }
      
      protected function §_-1h§(param1:MouseEvent) : void
      {
         this.btnContinue.buttonMode = true;
         this.btnContinue.mouseChildren = false;
         this.btnContinue.useHandCursor = true;
         this.btnContinue.gotoAndStop("over");
      }
      
      protected function §_-M3§(param1:MouseEvent) : void
      {
         this.btnContinue.useHandCursor = false;
         this.btnContinue.gotoAndStop("idle");
      }
      
      protected function §_-9Z§(param1:MouseEvent) : void
      {
         this.btnContinue.gotoAndStop("press");
      }
      
      protected function §_-1w§(param1:MouseEvent) : void
      {
         this.btnContinue.gotoAndStop("idle");
      }
      
      protected function §_-3k§(param1:MouseEvent) : void
      {
         this.§_-K9§.removeEventListener(MouseEvent.CLICK,this.§_-3k§);
         this.destroyThis();
      }
      
      protected function §_-9o§(param1:MouseEvent) : void
      {
         this.§_-K9§.buttonMode = true;
         this.§_-K9§.mouseChildren = false;
         this.§_-K9§.useHandCursor = true;
         this.§_-K9§.gotoAndStop("over");
      }
      
      protected function §_-Jp§(param1:MouseEvent) : void
      {
         this.§_-K9§.useHandCursor = false;
         this.§_-K9§.gotoAndStop("idle");
      }
      
      protected function §_-OE§(param1:MouseEvent) : void
      {
         this.§_-K9§.gotoAndStop("press");
      }
      
      protected function §_-FB§(param1:MouseEvent) : void
      {
         this.§_-K9§.gotoAndStop("idle");
      }
      
      public function destroyThis() : void
      {
         this.cRoot = null;
         this.removeListeners();
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      function frame1() : *
      {
         stop();
      }
   }
}
