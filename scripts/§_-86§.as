package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class §_-86§ extends MovieClip
   {
       
      
      public var butClose:MovieClip;
      
      public function §_-86§(param1:Point)
      {
         super();
         this.x = param1.x;
         this.y = param1.y;
         this.butClose.gotoAndStop("idle");
         this.butClose.addEventListener(MouseEvent.CLICK,this.close,false,0,true);
         this.butClose.addEventListener(MouseEvent.ROLL_OVER,this.§_-Sv§,false,0,true);
         this.butClose.addEventListener(MouseEvent.ROLL_OUT,this.§_-A-§,false,0,true);
         this.butClose.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-Py§,false,0,true);
         this.butClose.addEventListener(MouseEvent.MOUSE_UP,this.§_-Rs§,false,0,true);
      }
      
      protected function close(param1:MouseEvent) : void
      {
         this.butClose.removeEventListener(MouseEvent.CLICK,this.close);
         this.destroyThis();
      }
      
      protected function §_-Sv§(param1:MouseEvent) : void
      {
         this.butClose.buttonMode = true;
         this.butClose.mouseChildren = false;
         this.butClose.useHandCursor = true;
         this.butClose.gotoAndStop("over");
      }
      
      protected function §_-A-§(param1:MouseEvent) : void
      {
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
         this.butClose.removeEventListener(MouseEvent.CLICK,this.close);
         this.butClose.removeEventListener(MouseEvent.ROLL_OVER,this.§_-Sv§);
         this.butClose.removeEventListener(MouseEvent.ROLL_OUT,this.§_-A-§);
         this.butClose.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-Py§);
         this.butClose.removeEventListener(MouseEvent.MOUSE_UP,this.§_-Rs§);
         this.parent.removeChild(this);
      }
   }
}
