package
{
   import fl.transitions.Tween;
   import fl.transitions.TweenEvent;
   import fl.transitions.easing.Strong;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class MenuCongratz extends MovieClip
   {
       
      
      public var butClose:MovieClip;
      
      private var yTween:Tween;
      
      private var alphaTween:Tween;
      
      private var game:Game;
      
      public function MenuCongratz(param1:Game)
      {
         super();
         this.x = 52;
         this.y = 45;
         this.game = param1;
         this.game.gameSounds.playGUIButtonCommon();
         this.butClose.gotoAndStop("idle");
         this.butClose.addEventListener(MouseEvent.CLICK,this.close,false,0,true);
         this.butClose.addEventListener(MouseEvent.ROLL_OVER,this.§_-Sv§,false,0,true);
         this.butClose.addEventListener(MouseEvent.ROLL_OUT,this.§_-A-§,false,0,true);
         this.butClose.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-Py§,false,0,true);
         this.butClose.addEventListener(MouseEvent.MOUSE_UP,this.§_-Rs§,false,0,true);
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      public function init(param1:Event) : void
      {
         this.yTween = new Tween(this,"y",Strong.easeOut,this.y - 50,this.y,0.7,true);
         this.alphaTween = new Tween(this,"alpha",Strong.easeOut,0,1,0.7,true);
      }
      
      protected function close(param1:MouseEvent) : void
      {
         this.butClose.removeEventListener(MouseEvent.CLICK,this.close);
         this.game.gameSounds.playGUIButtonCommon();
         Map(this.parent).§_-Gg§();
         this.yTween = new Tween(this,"y",Strong.easeOut,this.y,this.y - 50,0.7,true);
         this.alphaTween = new Tween(this,"alpha",Strong.easeOut,1,0,0.7,true);
         this.yTween.addEventListener(TweenEvent.MOTION_FINISH,this.hideFinish,false,0,true);
      }
      
      public function hideFinish(param1:TweenEvent) : *
      {
         this.destroyThis();
      }
      
      protected function §_-Sv§(param1:MouseEvent) : void
      {
         this.game.gameSounds.playGUIMouseOverCommon();
         this.butClose.buttonMode = true;
         this.butClose.mouseChildren = false;
         this.butClose.useHandCursor = true;
         this.butClose.gotoAndStop("over");
      }
      
      protected function §_-A-§(param1:MouseEvent) : void
      {
         this.game.gameSounds.stopGUIMouseOverCommon();
         this.butClose.useHandCursor = false;
         this.butClose.gotoAndStop("idle");
      }
      
      protected function §_-Py§(param1:MouseEvent) : void
      {
         this.butClose.gotoAndStop("press");
      }
      
      protected function §_-Rs§(param1:MouseEvent) : void
      {
         this.butClose.gotoAndStop("idle");
      }
      
      public function destroyThis() : void
      {
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.yTween.removeEventListener(TweenEvent.MOTION_FINISH,this.hideFinish);
         this.butClose.removeEventListener(MouseEvent.CLICK,this.close);
         this.butClose.removeEventListener(MouseEvent.ROLL_OVER,this.§_-Sv§);
         this.butClose.removeEventListener(MouseEvent.ROLL_OUT,this.§_-A-§);
         this.butClose.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-Py§);
         this.butClose.removeEventListener(MouseEvent.MOUSE_UP,this.§_-Rs§);
         this.yTween = null;
         this.alphaTween = null;
         this.game = null;
         this.parent.removeChild(this);
      }
   }
}
