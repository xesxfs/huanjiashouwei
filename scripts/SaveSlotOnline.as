package
{
   import com.reintroducing.sound.SoundManager;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextField;
   
   public class SaveSlotOnline extends MovieClip
   {
       
      
      public var slotName:TextField;
      
      public var slotIrons:TextField;
      
      public var slotStars:TextField;
      
      public var slotHeroics:TextField;
      
      protected var slotEnabled:Boolean;
      
      protected var slotStatus:Boolean;
      
      protected var slotOnConfirm:Boolean;
      
      protected var slotStarsVar:int;
      
      protected var heroicsWin:int = 0;
      
      protected var ironsWin:int = 0;
      
      protected var data:Object;
      
      protected var endLabel:String;
      
      protected var deleteButton:§_-5D§;
      
      protected var slotNumber:int;
      
      protected var §_-4r§:SaveSlotDeleteButtonOk;
      
      protected var §_-8T§:SaveSlotDeleteButtonCancel;
      
      protected var cRoot:MainMenu;
      
      public function SaveSlotOnline(param1:Point, param2:int, param3:MainMenu)
      {
         super();
         this.cRoot = param3;
         this.x = param1.x;
         this.y = param1.y;
         this.slotNumber = param2;
         this.addEventListener(MouseEvent.CLICK,this.click,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OVER,this.rollOver,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,this.rollOut,false,0,true);
         this.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDown,false,0,true);
         this.addEventListener(MouseEvent.MOUSE_UP,this.mouseUp,false,0,true);
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      public function init(param1:Event) : void
      {
         if(Defense(this.cRoot.parent).agi.isLoggedIn())
         {
            this.§_-Do§();
         }
         else
         {
            this.blockMe();
         }
      }
      
      public function §_-Do§() : void
      {
         this.slotEnabled = false;
         this.gotoAndStop("loading");
         this.§_-PC§();
      }
      
      public function blockMe() : void
      {
         this.slotEnabled = false;
         this.alpha = 0.3;
         this.gotoAndStop("idleNew");
         this.§_-PC§();
      }
      
      public function §_-2N§() : void
      {
         this.slotEnabled = true;
         this.alpha = 1;
      }
      
      public function loadSlotSavedData(param1:Object) : void
      {
         var _loc2_:int = 0;
         if(this.parent == null)
         {
            return;
         }
         this.data = param1;
         this.§_-2N§();
         this.heroicsWin = 0;
         this.ironsWin = 0;
         if(this.data == null || this.data.levels == null)
         {
            this.slotStatus = false;
            this.slotStarsVar = 0;
            this.endLabel = "New";
         }
         else
         {
            this.slotStatus = true;
            this.slotStarsVar = this.data.starsWon;
            if(param1.levels != null)
            {
               _loc2_ = 0;
               while(_loc2_ < this.data.levels.length)
               {
                  if(this.data.levels[_loc2_].heroic == true)
                  {
                     this.heroicsWin++;
                  }
                  if(this.data.levels[_loc2_].iron == true)
                  {
                     this.ironsWin++;
                  }
                  _loc2_++;
               }
            }
            this.endLabel = "";
         }
         this.loadInitSettings();
      }
      
      public function loadInitSettings() : void
      {
         this.gotoAndStop("idle" + this.endLabel);
         if(this.slotStatus)
         {
            switch(this.slotNumber)
            {
               case 1:
                  MovieClip(this).slotName.text = "Online Slot 1";
                  break;
               case 2:
                  MovieClip(this).slotName.text = "Online Slot 2";
                  break;
               case 3:
                  MovieClip(this).slotName.text = "Online Slot 3";
            }
            if(!Defense(this.cRoot.parent).mpc)
            {
               MovieClip(this).slotStars.text = this.slotStarsVar.toString() + "/62";
            }
            else
            {
               MovieClip(this).slotStars.text = this.slotStarsVar.toString() + "/87";
            }
            MovieClip(this).slotHeroics.text = this.heroicsWin.toString();
            MovieClip(this).slotIrons.text = this.ironsWin.toString();
            if(this.deleteButton == null || !this.parent.contains(this.deleteButton))
            {
               if(this.deleteButton == null)
               {
                  this.deleteButton = new §_-5D§();
                  this.deleteButton.x = this.x + 138;
                  this.deleteButton.y = this.y + 11;
                  this.deleteButton.scaleX = 0.7;
                  this.deleteButton.scaleY = 0.7;
               }
               this.parent.addChild(this.deleteButton);
               this.deleteButton.gotoAndStop("idle");
               this.deleteButton.addEventListener(MouseEvent.CLICK,this.§_-Cx§,false,0,true);
               this.deleteButton.addEventListener(MouseEvent.ROLL_OVER,this.§_-Mo§,false,0,true);
               this.deleteButton.addEventListener(MouseEvent.ROLL_OUT,this.§_-3A§,false,0,true);
               this.deleteButton.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-BT§,false,0,true);
               this.deleteButton.addEventListener(MouseEvent.MOUSE_UP,this.§_-Ph§,false,0,true);
            }
         }
      }
      
      protected function click(param1:MouseEvent) : void
      {
         if(!this.slotEnabled)
         {
            return;
         }
         if(this.slotOnConfirm)
         {
            return;
         }
         this.gotoAndStop("idle" + this.endLabel);
         this.removeEventListener(MouseEvent.CLICK,this.click);
         this.removeEventListener(MouseEvent.ROLL_OVER,this.rollOver);
         this.removeEventListener(MouseEvent.ROLL_OUT,this.rollOut);
         this.removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseDown);
         this.removeEventListener(MouseEvent.MOUSE_UP,this.mouseUp);
         if(this.deleteButton != null)
         {
            this.deleteButton.removeEventListener(MouseEvent.CLICK,this.§_-Cx§);
         }
         SoundManager.getInstance().stopSound("gui_button_common");
         SoundManager.getInstance().playSound("gui_button_common",1,0,0);
         this.cRoot.initOnlineGame("online_slot",this.data,this.slotNumber);
      }
      
      protected function rollOver(param1:MouseEvent) : void
      {
         if(!this.slotEnabled)
         {
            return;
         }
         if(this.slotOnConfirm)
         {
            return;
         }
         SoundManager.getInstance().playSound("gui_mouse_over_tower_common",1,0,0);
         this.buttonMode = true;
         this.mouseChildren = false;
         this.useHandCursor = true;
         this.gotoAndStop("over" + this.endLabel);
      }
      
      protected function rollOut(param1:MouseEvent) : void
      {
         if(!this.slotEnabled)
         {
            return;
         }
         if(this.slotOnConfirm)
         {
            return;
         }
         SoundManager.getInstance().stopSound("gui_mouse_over_tower_common");
         this.useHandCursor = false;
         this.gotoAndStop("idle" + this.endLabel);
      }
      
      protected function mouseDown(param1:MouseEvent) : void
      {
         if(!this.slotEnabled)
         {
            return;
         }
         if(this.slotOnConfirm)
         {
            return;
         }
         this.gotoAndStop("over" + this.endLabel);
      }
      
      protected function mouseUp(param1:MouseEvent) : void
      {
         if(!this.slotEnabled)
         {
            return;
         }
         if(this.slotOnConfirm)
         {
            return;
         }
         this.gotoAndStop("over" + this.endLabel);
      }
      
      protected function §_-Cx§(param1:MouseEvent) : void
      {
         this.deleteButton.gotoAndStop("idle");
         SoundManager.getInstance().stopSound("gui_button_common");
         SoundManager.getInstance().playSound("gui_button_common",1,0,0);
         this.slotOnConfirm = true;
         this.endLabel = "Confirm";
         this.gotoAndStop("idleConfirm");
         this.§_-Ds§();
      }
      
      public function confirmDeleteSlot() : void
      {
         this.deleteButton.removeEventListener(MouseEvent.CLICK,this.§_-Cx§);
         this.deleteButton.removeEventListener(MouseEvent.ROLL_OVER,this.§_-Mo§);
         this.deleteButton.removeEventListener(MouseEvent.ROLL_OUT,this.§_-3A§);
         this.deleteButton.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-BT§);
         this.deleteButton.removeEventListener(MouseEvent.MOUSE_UP,this.§_-Ph§);
         this.deleteButton = null;
         this.§_-4r§.destroyThis();
         this.§_-8T§.destroyThis();
         var _loc1_:Object = new Object();
         this.§_-Do§();
         this.data = null;
         Defense(this.cRoot.parent).agi.deleteUserData("slot" + this.slotNumber.toString(),this.§_-Co§);
      }
      
      public function §_-PC§() : void
      {
         if(this.deleteButton != null)
         {
            if(this.parent.contains(this.deleteButton))
            {
               this.parent.removeChild(this.deleteButton);
            }
            this.deleteButton.removeEventListener(MouseEvent.CLICK,this.§_-Cx§);
            this.deleteButton.removeEventListener(MouseEvent.ROLL_OVER,this.§_-Mo§);
            this.deleteButton.removeEventListener(MouseEvent.ROLL_OUT,this.§_-3A§);
            this.deleteButton.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-BT§);
            this.deleteButton.removeEventListener(MouseEvent.MOUSE_UP,this.§_-Ph§);
            this.deleteButton = null;
         }
         if(this.§_-4r§ != null)
         {
            this.§_-4r§.destroyThis();
         }
         if(this.§_-8T§ != null)
         {
            this.§_-8T§.destroyThis();
         }
      }
      
      public function §_-Co§(param1:Object) : void
      {
         if(!param1.success)
         {
         }
         this.§_-2N§();
         this.slotOnConfirm = false;
         this.slotStatus = false;
         this.gotoAndStop("idleNew");
         this.endLabel = "New";
      }
      
      public function cancelDeleteSlot() : void
      {
         this.parent.addChild(this.deleteButton);
         this.§_-4r§.destroyThis();
         this.§_-8T§.destroyThis();
         this.slotOnConfirm = false;
         this.endLabel = "";
         this.loadSlotSavedData(this.data);
      }
      
      protected function §_-Mo§(param1:MouseEvent) : void
      {
         SoundManager.getInstance().playSound("gui_mouse_over_tower_common",1,0,0);
         this.deleteButton.buttonMode = true;
         this.deleteButton.mouseChildren = false;
         this.deleteButton.useHandCursor = true;
         this.deleteButton.gotoAndStop("over");
      }
      
      protected function §_-3A§(param1:MouseEvent) : void
      {
         SoundManager.getInstance().stopSound("gui_mouse_over_tower_common");
         this.deleteButton.useHandCursor = false;
         this.deleteButton.gotoAndStop("idle");
      }
      
      protected function §_-BT§(param1:MouseEvent) : void
      {
         this.deleteButton.gotoAndStop("over");
      }
      
      protected function §_-Ph§(param1:MouseEvent) : void
      {
         this.deleteButton.gotoAndStop("over");
      }
      
      protected function §_-Ds§() : void
      {
         this.parent.removeChild(this.deleteButton);
         this.§_-4r§ = new SaveSlotDeleteButtonOk(new Point(this.x + 42,this.y + 26),this);
         this.§_-8T§ = new SaveSlotDeleteButtonCancel(new Point(this.x + 98,this.y + 26),this);
         this.parent.addChild(this.§_-4r§);
         this.parent.addChild(this.§_-8T§);
      }
      
      protected function destroyThis() : void
      {
         this.cRoot = null;
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.removeEventListener(MouseEvent.CLICK,this.click);
         this.removeEventListener(MouseEvent.ROLL_OVER,this.rollOver);
         this.removeEventListener(MouseEvent.ROLL_OUT,this.rollOut);
         this.removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseDown);
         this.removeEventListener(MouseEvent.MOUSE_UP,this.mouseUp);
         if(this.slotStatus)
         {
            this.deleteButton.removeEventListener(MouseEvent.CLICK,this.§_-Cx§);
            this.deleteButton.removeEventListener(MouseEvent.ROLL_OVER,this.§_-Mo§);
            this.deleteButton.removeEventListener(MouseEvent.ROLL_OUT,this.§_-3A§);
            this.deleteButton.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-BT§);
            this.deleteButton.removeEventListener(MouseEvent.MOUSE_UP,this.§_-Ph§);
            this.parent.removeChild(this.deleteButton);
            this.deleteButton = null;
         }
         this.parent.removeChild(this);
      }
   }
}
