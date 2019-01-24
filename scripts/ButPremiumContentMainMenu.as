package
{
   import com.reintroducing.sound.SoundManager;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class ButPremiumContentMainMenu extends MovieClip
   {
       
      
      protected var §_-4U§:Defense;
      
      protected var cRoot:MainMenu;
      
      public function ButPremiumContentMainMenu(param1:MainMenu, param2:Defense)
      {
         super();
         addFrameScript(0,this.frame1);
         this.cRoot = param1;
         this.§_-4U§ = param2;
         this.x = -158;
         this.y = 118;
         if(this.§_-4U§.mpc)
         {
            this.gotoAndStop("idleActive");
         }
         else
         {
            this.gotoAndStop("idle");
         }
         this.addEventListener(MouseEvent.CLICK,this.click,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OVER,this.rollOver,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,this.rollOut,false,0,true);
         this.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDown,false,0,true);
         this.addEventListener(MouseEvent.MOUSE_UP,this.mouseUp,false,0,true);
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      public function init(param1:Event) : void
      {
         this.§_-Gr§();
      }
      
      protected function click(param1:MouseEvent) : void
      {
         if(!this.§_-4U§.agi.isLoggedIn())
         {
            this.cRoot.loginWidget.tryToLogin(true);
         }
         else
         {
            this.openPc();
         }
      }
      
      protected function rollOver(param1:MouseEvent) : void
      {
         SoundManager.getInstance().stopSound("gui_mouse_over_tower_common");
         SoundManager.getInstance().playSound("gui_mouse_over_tower_common",1,0,0);
         this.buttonMode = true;
         this.mouseChildren = false;
         this.useHandCursor = true;
         if(this.§_-4U§.mpc)
         {
            this.gotoAndStop("overActive");
         }
         else
         {
            this.gotoAndStop("over");
         }
      }
      
      protected function rollOut(param1:MouseEvent) : void
      {
         this.useHandCursor = false;
         if(this.§_-4U§.mpc)
         {
            this.gotoAndStop("idleActive");
         }
         else
         {
            this.gotoAndStop("idle");
         }
      }
      
      protected function mouseDown(param1:MouseEvent) : void
      {
         if(this.§_-4U§.mpc)
         {
            this.gotoAndStop("pressActive");
         }
         else
         {
            this.gotoAndStop("press");
         }
      }
      
      protected function mouseUp(param1:MouseEvent) : void
      {
         if(this.§_-4U§.mpc)
         {
            this.gotoAndStop("overActive");
         }
         else
         {
            this.gotoAndStop("over");
         }
      }
      
      public function openPc(param1:Boolean = false) : void
      {
         this.cRoot.§_-CT§();
         this.cRoot.§_-1J§ = new MenuPremiumWindow(null,this.cRoot,param1,"HOME");
         this.cRoot.addChild(this.cRoot.§_-1J§);
      }
      
      public function §_-4v§(param1:int) : void
      {
         if(param1 == 2)
         {
            this.gotoAndStop("idleActive");
         }
         else
         {
            this.gotoAndStop("idle");
         }
      }
      
      public function §_-Gr§(param1:Boolean = false) : void
      {
         if(!param1)
         {
            if(!this.§_-4U§.agi.isLoggedIn())
            {
               this.gotoAndStop("idle");
            }
            else
            {
               this.§_-4U§.agi.retrieveUserData(this.getOnlineData,"kingdomRushPremiumContentEnabled");
            }
         }
         else
         {
            this.§_-4U§.agi.retrieveUserData(this.getOnlineData,"kingdomRushPremiumContentEnabled");
         }
      }
      
      protected function getOnlineData(param1:Object) : void
      {
         var _loc2_:int = 0;
         if(param1.success)
         {
            _loc2_ = param1.data;
            this.§_-4v§(_loc2_);
         }
         else
         {
            this.gotoAndStop("idle");
         }
      }
      
      public function destroyThis() : void
      {
         this.cRoot = null;
         this.§_-4U§ = null;
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
