package
{
   import com.reintroducing.sound.SoundManager;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class SaveSlotDeleteButton extends MovieClip
   {
       
      
      protected var slot:MovieClip;
      
      public function SaveSlotDeleteButton(param1:Point, param2:MovieClip)
      {
         super();
         this.slot = param2;
         this.x = param1.x;
         this.y = param1.y;
         this.addEventListener(MouseEvent.CLICK,this.click,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OVER,this.rollOver,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,this.rollOut,false,0,true);
         this.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDown,false,0,true);
         this.addEventListener(MouseEvent.MOUSE_UP,this.mouseUp,false,0,true);
      }
      
      protected function click(param1:MouseEvent) : void
      {
         SoundManager.getInstance().stopSound("gui_button_common");
         SoundManager.getInstance().playSound("gui_button_common",1,0,0);
         this.removeEventListener(MouseEvent.CLICK,this.click);
         this.execAction();
      }
      
      protected function execAction() : void
      {
      }
      
      protected function rollOver(param1:MouseEvent) : void
      {
         SoundManager.getInstance().playSound("gui_mouse_over_tower_common",1,0,0);
         this.buttonMode = true;
         this.mouseChildren = false;
         this.useHandCursor = true;
         this.gotoAndStop("over");
      }
      
      protected function rollOut(param1:MouseEvent) : void
      {
         SoundManager.getInstance().stopSound("gui_mouse_over_tower_common");
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
         this.slot = null;
         this.removeEventListener(MouseEvent.CLICK,this.click);
         this.removeEventListener(MouseEvent.ROLL_OVER,this.rollOver);
         this.removeEventListener(MouseEvent.ROLL_OUT,this.rollOut);
         this.removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseDown);
         this.removeEventListener(MouseEvent.MOUSE_UP,this.mouseUp);
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
   }
}
