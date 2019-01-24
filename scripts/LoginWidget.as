package
{
   import com.reintroducing.sound.SoundManager;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.net.URLRequest;
   import flash.text.TextField;
   
   public class LoginWidget extends MovieClip
   {
       
      
      public var portrait:MovieClip;
      
      public var username:TextField;
      
      protected var getPcNext:Boolean;
      
      protected var §_-T7§:Loader;
      
      protected var §_-4U§:Defense;
      
      protected var cRoot:MainMenu;
      
      public function LoginWidget(param1:Point, param2:MainMenu)
      {
         super();
         this.cRoot = param2;
         this.x = param1.x;
         this.y = param1.y;
         this.addEventListener(MouseEvent.CLICK,this.click,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OVER,this.rollOver,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,this.rollOut,false,0,true);
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      public function init(param1:Event) : void
      {
         this.removeImage();
         this.§_-4U§ = Defense(this.cRoot.parent);
         if(this.§_-4U§.agi.isLoggedIn())
         {
            this.showLoggedIn();
         }
         else
         {
            this.showLoggedOut();
         }
      }
      
      protected function showLoggedIn() : void
      {
         this.gotoAndStop("loggedIn");
         this.loadUserData();
      }
      
      protected function showLoggedOut() : void
      {
         if(this.§_-T7§ != null && this.portrait.contains(this.§_-T7§))
         {
            this.portrait.removeChild(this.§_-T7§);
         }
         this.cRoot.§_-8J§();
         this.cRoot.§_-6x§();
         this.gotoAndStop("loggedOut");
      }
      
      public function removeImage() : void
      {
         if(this.§_-T7§ != null && this.portrait.contains(this.§_-T7§))
         {
            this.portrait.removeChild(this.§_-T7§);
         }
      }
      
      protected function loadUserData() : void
      {
         var _loc1_:Object = this.§_-4U§.agi.getUserData();
         var _loc2_:URLRequest = new URLRequest(_loc1_.avatar_url);
         this.§_-T7§ = new Loader();
         this.§_-T7§.load(_loc2_);
         this.§_-T7§.contentLoaderInfo.addEventListener(Event.COMPLETE,this.loadImageComplete,false,0,true);
         this.username.text = _loc1_.username;
         this.cRoot.§_-GY§();
      }
      
      protected function loadImageComplete(param1:Event) : void
      {
         this.§_-T7§.width = 36;
         this.§_-T7§.scaleY = this.§_-T7§.scaleX;
         this.portrait.addChild(this.§_-T7§);
      }
      
      protected function click(param1:MouseEvent) : void
      {
         this.tryToLogin();
      }
      
      public function tryToLogin(param1:Boolean = false) : void
      {
         this.getPcNext = param1;
         this.§_-4U§.agi.showLogin(this.afterLogin);
      }
      
      protected function rollOver(param1:MouseEvent) : void
      {
         SoundManager.getInstance().playSound("gui_mouse_over_tower_common",1,0,0);
         this.buttonMode = true;
         this.mouseChildren = false;
         this.useHandCursor = true;
      }
      
      protected function rollOut(param1:MouseEvent) : void
      {
         SoundManager.getInstance().stopSound("gui_mouse_over_tower_common");
         this.useHandCursor = false;
      }
      
      private function afterLogin(param1:Object) : void
      {
         if(param1.success)
         {
            if(param1.loggedIn)
            {
               this.showLoggedIn();
               if(this.getPcNext)
               {
                  this.cRoot.§_-8o§.openPc(true);
               }
            }
            else
            {
               this.showLoggedOut();
            }
         }
      }
      
      protected function §_-JO§() : void
      {
         this.§_-4U§ = null;
         this.cRoot = null;
         this.removeEventListener(MouseEvent.CLICK,this.click);
         this.removeEventListener(MouseEvent.ROLL_OVER,this.rollOver);
         this.removeEventListener(MouseEvent.ROLL_OUT,this.rollOut);
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
      }
      
      protected function destroyThis() : void
      {
         this.§_-JO§();
         this.parent.removeChild(this);
      }
   }
}
