package
{
   import fl.transitions.Tween;
   import fl.transitions.easing.Strong;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class §_-Pg§ extends MovieClip
   {
       
      
      public var §_-SH§:Sprite;
      
      protected var alphaTweenIn:Tween;
      
      protected var §_-Ja§:§_-5a§;
      
      protected var cRoot:Level;
      
      public function §_-Pg§(param1:Level)
      {
         this.§_-Ja§ = new §_-5a§();
         super();
         this.cRoot = param1;
         this.cRoot.freeMenues();
         this.cRoot.cancelAllOnKeyPress();
         this.§_-Ja§.x = 250;
         this.§_-Ja§.y = 240;
         this.§_-SH§ = new Sprite();
         this.§_-SH§.graphics.beginFill(0);
         this.§_-SH§.graphics.drawRect(0,0,700,600);
         this.§_-SH§.graphics.endFill();
         this.§_-SH§.x = 0;
         this.§_-SH§.y = 0;
         this.§_-SH§.alpha = 0;
         this.addChild(this.§_-SH§);
         this.alphaTweenIn = new Tween(this.§_-SH§,"alpha",Strong.easeOut,0,0.25,13,false);
         this.cRoot.game.gameSounds.stopAllMusics();
         this.addChild(this.§_-Ja§);
         this.addEventListener(MouseEvent.MOUSE_DOWN,this.clickEvent);
         this.§_-SH§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-E2§,false,0,true);
         this.§_-Ja§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-8n§,false,0,true);
      }
      
      public function §_-St§() : void
      {
         this.§_-Ja§.§_-3q§.visible = true;
      }
      
      public function §_-62§() : void
      {
         this.§_-Ja§.§_-3q§.visible = false;
      }
      
      protected function clickEvent(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
         param1.preventDefault();
         this.cRoot.§_-9P§();
      }
      
      protected function §_-E2§(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
         param1.preventDefault();
         this.cRoot.§_-9P§();
      }
      
      protected function §_-8n§(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
         param1.preventDefault();
         this.cRoot.§_-9P§();
      }
      
      public function destroyThis() : void
      {
         this.alphaTweenIn = null;
         this.cRoot.game.gameSounds.§_-CS§();
         this.cRoot = null;
         this.removeEventListener(MouseEvent.MOUSE_DOWN,this.clickEvent);
         this.§_-SH§.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-E2§);
         this.§_-Ja§.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-8n§);
         this.parent.removeChild(this);
      }
   }
}
