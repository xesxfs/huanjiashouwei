package
{
   import fl.lang.Locale;
   import fl.transitions.Tween;
   import fl.transitions.TweenEvent;
   import fl.transitions.easing.Strong;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class §_-Dw§ extends MovieClip
   {
       
      
      public var btnContinue:MovieClip;
      
      public var §_-5R§:TextField;
      
      public var btnRestart:MovieClip;
      
      protected var §_-44§:Tween;
      
      protected var §_-0h§:Tween;
      
      protected var cRoot:Level;
      
      public function §_-Dw§(param1:Level)
      {
         super();
         this.cRoot = param1;
         this.cRoot.game.gameSounds.§_-3t§();
         this.cRoot.game.gameSounds.§_-84§();
         this.x = 350;
         this.§_-44§ = new Tween(this,"y",Strong.easeOut,-550,0,0.5,true);
         this.§_-5R§.text = Locale.loadStringEx("TIP_TITLE",Locale.getDefaultLang()) + this.cRoot.getTip();
         this.btnRestart.gotoAndStop("idle");
         this.btnContinue.gotoAndStop("idle");
         this.btnRestart.addEventListener(MouseEvent.CLICK,this.restart,false,0,true);
         this.btnRestart.addEventListener(MouseEvent.ROLL_OVER,this.§_-HA§,false,0,true);
         this.btnRestart.addEventListener(MouseEvent.ROLL_OUT,this.§_-SL§,false,0,true);
         this.btnRestart.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-QV§,false,0,true);
         this.btnRestart.addEventListener(MouseEvent.MOUSE_UP,this.§_-Ew§,false,0,true);
         this.btnContinue.addEventListener(MouseEvent.CLICK,this.§_-JJ§,false,0,true);
         this.btnContinue.addEventListener(MouseEvent.ROLL_OVER,this.§_-1h§,false,0,true);
         this.btnContinue.addEventListener(MouseEvent.ROLL_OUT,this.§_-M3§,false,0,true);
         this.btnContinue.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-9Z§,false,0,true);
         this.btnContinue.addEventListener(MouseEvent.MOUSE_UP,this.§_-1w§,false,0,true);
      }
      
      protected function §_-JJ§(param1:MouseEvent) : void
      {
         this.btnContinue.removeEventListener(MouseEvent.CLICK,this.§_-JJ§);
         this.cRoot.game.main.showTransition(null,this.cRoot);
      }
      
      protected function restart(param1:MouseEvent) : void
      {
         this.btnRestart.removeEventListener(MouseEvent.CLICK,this.restart);
         this.cRoot.game.restartLevel(this.cRoot,this.cRoot.mode);
         this.§_-0h§ = new Tween(this,"y",Strong.easeOut,this.y,-550,0.5,false);
         this.§_-0h§.addEventListener(TweenEvent.MOTION_FINISH,this.resumeFinish,false,0,true);
      }
      
      protected function clickEvent(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
         param1.preventDefault();
      }
      
      public function resumeFinish(param1:TweenEvent) : *
      {
         this.destroyThis();
      }
      
      protected function §_-HA§(param1:MouseEvent) : void
      {
         this.cRoot.game.gameSounds.§_-Dh§();
         this.btnRestart.buttonMode = true;
         this.btnRestart.mouseChildren = false;
         this.btnRestart.useHandCursor = true;
         this.btnRestart.gotoAndStop("over");
      }
      
      protected function §_-SL§(param1:MouseEvent) : void
      {
         this.btnRestart.useHandCursor = false;
         this.btnRestart.gotoAndStop("idle");
      }
      
      protected function §_-QV§(param1:MouseEvent) : void
      {
         this.btnRestart.gotoAndStop("press");
      }
      
      protected function §_-Ew§(param1:MouseEvent) : void
      {
         this.btnRestart.gotoAndStop("idle");
      }
      
      protected function §_-1h§(param1:MouseEvent) : void
      {
         this.cRoot.game.gameSounds.§_-Dh§();
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
      
      protected function destroyThis() : void
      {
         this.btnRestart.removeEventListener(MouseEvent.CLICK,this.restart);
         this.btnRestart.removeEventListener(MouseEvent.ROLL_OVER,this.§_-HA§);
         this.btnRestart.removeEventListener(MouseEvent.ROLL_OUT,this.§_-SL§);
         this.btnRestart.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-QV§);
         this.btnRestart.removeEventListener(MouseEvent.MOUSE_UP,this.§_-Ew§);
         this.btnContinue.removeEventListener(MouseEvent.ROLL_OVER,this.§_-1h§);
         this.btnContinue.removeEventListener(MouseEvent.ROLL_OUT,this.§_-M3§);
         this.btnContinue.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-9Z§);
         this.btnContinue.removeEventListener(MouseEvent.MOUSE_UP,this.§_-1w§);
         this.parent.removeChild(this);
      }
   }
}
