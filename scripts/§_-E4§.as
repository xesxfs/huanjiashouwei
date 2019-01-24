package
{
   import fl.transitions.Tween;
   import fl.transitions.easing.Strong;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public class §_-E4§ extends MovieClip
   {
       
      
      protected var §_-44§:Tween;
      
      protected var §_-0h§:Tween;
      
      protected var cRoot:Level;
      
      public function §_-E4§(param1:Level, param2:Boolean = true)
      {
         super();
         this.cRoot = param1;
         this.x = 670;
         this.gotoAndStop("idle");
         if(param2)
         {
            this.§_-44§ = new Tween(this,"y",Strong.easeOut,-20,10,0.5,true);
         }
         this.addEventListener(MouseEvent.CLICK,this.§_-Nt§,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OVER,this.rollOver,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,this.rollOut,false,0,true);
         this.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDown,false,0,true);
         this.addEventListener(MouseEvent.MOUSE_UP,this.mouseUp,false,0,true);
      }
      
      public function goOut() : void
      {
         this.§_-44§ = new Tween(this,"y",Strong.easeOut,this.y,-50,0.5,true);
      }
      
      protected function §_-Nt§(param1:MouseEvent) : void
      {
         if(this.cRoot.§_-D4§ != Level.LEVEL_NORMAL)
         {
            return;
         }
         this.gotoAndStop("idle");
         this.cRoot.pause(true);
         this.cRoot.game.gameSounds.playGUIButtonCommon();
         this.cRoot.addChild(new MenuOptions(this.cRoot));
         param1.stopImmediatePropagation();
         param1.preventDefault();
      }
      
      protected function rollOver(param1:MouseEvent) : void
      {
         this.cRoot.game.gameSounds.playGUIMouseOverCommon();
         this.buttonMode = true;
         this.mouseChildren = false;
         this.useHandCursor = true;
         this.gotoAndStop("over");
      }
      
      protected function rollOut(param1:MouseEvent) : void
      {
         this.cRoot.game.gameSounds.stopGUIMouseOverCommon();
         this.useHandCursor = false;
         this.gotoAndStop("idle");
      }
      
      protected function mouseDown(param1:MouseEvent) : void
      {
         this.gotoAndStop("press");
      }
      
      protected function mouseUp(param1:MouseEvent) : void
      {
         this.gotoAndStop("over");
      }
      
      public function destroyThis() : void
      {
         this.§_-44§ = null;
         this.§_-0h§ = null;
         this.cRoot = null;
         this.removeEventListener(MouseEvent.CLICK,this.§_-Nt§);
         this.removeEventListener(MouseEvent.ROLL_OVER,this.rollOver);
         this.removeEventListener(MouseEvent.ROLL_OUT,this.rollOut);
         this.removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseDown);
         this.removeEventListener(MouseEvent.MOUSE_UP,this.mouseUp);
         this.parent.removeChild(this);
      }
   }
}
