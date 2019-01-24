package
{
   import com.reintroducing.sound.SoundManager;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public class §_-SN§ extends MovieClip
   {
       
      
      public function §_-SN§()
      {
         super();
         this.gotoAndStop("idle");
         this.addEventListener(MouseEvent.ROLL_OVER,this.rollOver,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,this.rollOut,false,0,true);
      }
      
      protected function rollOver(param1:MouseEvent) : void
      {
         this.loadTooltip();
         SoundManager.getInstance().playSound("gui_mouse_over_tower_common",1,0,0);
         this.buttonMode = true;
         this.mouseChildren = false;
         this.useHandCursor = true;
         this.gotoAndStop("over");
      }
      
      protected function loadTooltip() : void
      {
      }
      
      protected function rollOut(param1:MouseEvent) : void
      {
         MainMenu(this.parent.parent).hideTooltip();
         SoundManager.getInstance().stopSound("gui_mouse_over_tower_common");
         this.useHandCursor = false;
         this.gotoAndStop("idle");
      }
      
      public function destroyThis() : void
      {
         this.removeEventListener(MouseEvent.ROLL_OVER,this.rollOver);
         this.removeEventListener(MouseEvent.ROLL_OUT,this.rollOut);
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
   }
}
