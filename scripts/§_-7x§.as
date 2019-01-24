package
{
   import com.reintroducing.sound.SoundManager;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class §_-7x§ extends MovieClip
   {
       
      
      public var §_-EX§:MovieClip;
      
      protected var mainMenu:Boolean;
      
      protected var main:Defense;
      
      public function §_-7x§(param1:Defense, param2:Point, param3:Boolean = false)
      {
         super();
         this.main = param1;
         this.x = param2.x;
         this.y = param2.y;
         this.mainMenu = param3;
         this.addEventListener(MouseEvent.CLICK,this.click,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OVER,this.rollOver,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,this.rollOut,false,0,true);
         this.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDown,false,0,true);
         this.addEventListener(MouseEvent.MOUSE_UP,this.mouseUp,false,0,true);
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      public function init(param1:Event) : void
      {
         this.gotoAndStop("idle");
         this.§_-Cd§();
      }
      
      protected function click(param1:MouseEvent) : void
      {
         this.gotoAndStop("idle");
         SoundManager.getInstance().stopSound("gui_button_common");
         SoundManager.getInstance().playSound("gui_button_common",1,0,0);
         SoundManager.getInstance().stopSound("music_main_menu");
         SoundManager.getInstance().stopSound("music_map");
         if(this.main.soundMusicStatus)
         {
            this.main.soundMusicStatus = false;
            SoundManager.getInstance().muteMusic();
         }
         else
         {
            this.main.soundMusicStatus = true;
            SoundManager.getInstance().unMuteMusic();
            if(this.mainMenu)
            {
               SoundManager.getInstance().playSound("music_main_menu",0.6,0,9999);
            }
            else
            {
               SoundManager.getInstance().playSound("music_map",0.6,0,9999);
            }
         }
         this.§_-Cd§();
      }
      
      protected function rollOver(param1:MouseEvent) : void
      {
         SoundManager.getInstance().stopSound("gui_mouse_over_tower_common");
         SoundManager.getInstance().playSound("gui_mouse_over_tower_common",1,0,0);
         this.buttonMode = true;
         this.mouseChildren = false;
         this.useHandCursor = true;
         this.gotoAndStop("over");
      }
      
      protected function rollOut(param1:MouseEvent) : void
      {
         this.useHandCursor = false;
         this.gotoAndStop("idle");
      }
      
      protected function mouseDown(param1:MouseEvent) : void
      {
         this.gotoAndStop("over");
      }
      
      protected function mouseUp(param1:MouseEvent) : void
      {
         this.gotoAndStop("idle");
      }
      
      protected function §_-Cd§() : void
      {
         if(this.main.soundMusicStatus == true)
         {
            this.§_-EX§.visible = false;
         }
         else
         {
            this.§_-EX§.visible = true;
         }
      }
      
      public function destroyThis() : void
      {
         this.main = null;
         this.removeEventListener(MouseEvent.CLICK,this.click);
         this.removeEventListener(MouseEvent.ROLL_OVER,this.rollOver);
         this.removeEventListener(MouseEvent.ROLL_OUT,this.rollOut);
         this.removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseDown);
         this.removeEventListener(MouseEvent.MOUSE_UP,this.mouseUp);
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.parent.removeChild(this);
      }
   }
}
