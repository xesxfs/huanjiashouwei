package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class SaveSlotWarningOverride extends MovieClip
   {
       
      
      public var btnContinue:MovieClip;
      
      public var §_-K9§:MovieClip;
      
      protected var slotCopy:SaveSlotCopy;
      
      protected var §_-4r§:SaveSlotDeleteButtonOk;
      
      protected var §_-8T§:SaveSlotDeleteButtonCancel;
      
      public function SaveSlotWarningOverride(param1:SaveSlotCopy)
      {
         super();
         addFrameScript(0,this.frame1,2,this.frame3);
         this.slotCopy = param1;
         this.x = 0;
         this.y = 0;
         this.§_-Ml§();
         this.gotoAndStop(1);
      }
      
      public function showError() : void
      {
         this.gotoAndStop(3);
         this.btnContinue.gotoAndStop("idle");
         this.btnContinue.gotoAndStop("idle");
         this.btnContinue.txt.text = "TRY AGAIN";
         this.§_-K9§.txt.text = "CANCEL";
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
      
      public function §_-4d§() : void
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
      
      public function §_-Ml§() : void
      {
         this.§_-4r§ = new SaveSlotDeleteButtonOk(new Point(236,470),this);
         this.§_-8T§ = new SaveSlotDeleteButtonCancel(new Point(405,470),this);
         this.§_-4r§.scaleX = 2;
         this.§_-4r§.scaleY = 2;
         this.§_-8T§.scaleX = 2;
         this.§_-8T§.scaleY = 2;
         this.addChild(this.§_-4r§);
         this.addChild(this.§_-8T§);
      }
      
      public function confirmDeleteSlot() : void
      {
         this.gotoAndStop(2);
         this.slotCopy.§_-6F§();
         this.§_-4r§.destroyThis();
         this.§_-8T§.destroyThis();
      }
      
      public function cancelDeleteSlot() : void
      {
         this.§_-4r§.destroyThis();
         this.§_-8T§.destroyThis();
         this.slotCopy.isBlocked = false;
         this.destroyThis();
      }
      
      protected function §_-v§(param1:MouseEvent) : void
      {
         this.btnContinue.removeEventListener(MouseEvent.CLICK,this.§_-v§);
         this.§_-4d§();
         this.confirmDeleteSlot();
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
         this.slotCopy = null;
         this.parent.removeChild(this);
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame3() : *
      {
         stop();
      }
   }
}
