package
{
   import com.reintroducing.sound.SoundManager;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.net.SharedObject;
   import flash.text.TextField;
   
   public class SaveSlotItem extends MovieClip
   {
       
      
      public var slotName:TextField;
      
      public var slotIrons:TextField;
      
      public var slotStars:TextField;
      
      public var slotHeroics:TextField;
      
      protected var slotStatus:Boolean;
      
      protected var slotOnConfirm:Boolean;
      
      protected var slotStarsVar:int;
      
      protected var slotAllreadyPremium:Boolean;
      
      protected var heroicsWin:int = 0;
      
      protected var ironsWin:int = 0;
      
      protected var §_-PR§:String;
      
      protected var endLabel:String;
      
      protected var deleteButton:§_-5D§;
      
      protected var §_-4r§:SaveSlotDeleteButtonOk;
      
      protected var §_-8T§:SaveSlotDeleteButtonCancel;
      
      protected var cRoot:MainMenu;
      
      public function SaveSlotItem(param1:Point, param2:String, param3:MainMenu)
      {
         super();
         this.cRoot = param3;
         this.x = param1.x;
         this.y = param1.y;
         this.§_-PR§ = param2;
         this.loadSlotSavedData();
         this.addEventListener(MouseEvent.CLICK,this.click,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OVER,this.rollOver,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,this.rollOut,false,0,true);
         this.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDown,false,0,true);
         this.addEventListener(MouseEvent.MOUSE_UP,this.mouseUp,false,0,true);
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      public function init(param1:Event) : void
      {
         this.loadInitSettings();
      }
      
      public function loadSlotSavedData() : void
      {
         var my_so:SharedObject = null;
         var i:int = 0;
         this.heroicsWin = 0;
         this.ironsWin = 0;
         try
         {
            my_so = SharedObject.getLocal(this.§_-PR§);
            if(my_so.data.levels == undefined)
            {
               this.slotStatus = false;
               this.slotStarsVar = 0;
               this.endLabel = "New";
            }
            else
            {
               this.slotStatus = true;
               this.slotStarsVar = my_so.data.starsWon;
               this.slotAllreadyPremium = my_so.data.pcAlreadyGot;
               if(my_so.data.levels != undefined)
               {
                  i = 0;
                  while(i < my_so.data.levels.length)
                  {
                     if(my_so.data.levels[i].heroic == true)
                     {
                        this.heroicsWin++;
                     }
                     if(my_so.data.levels[i].iron == true)
                     {
                        this.ironsWin++;
                     }
                     i++;
                  }
               }
               this.endLabel = "";
            }
            my_so.close();
            return;
         }
         catch(err:Error)
         {
            this.slotStatus = false;
            this.slotStarsVar = 0;
            this.endLabel = "New";
            return;
         }
      }
      
      public function loadInitSettings() : void
      {
         this.gotoAndStop("idle" + this.endLabel);
         if(this.slotStatus)
         {
            switch(this.§_-PR§)
            {
               case "krslot1":
                  MovieClip(this).slotName.text = "存档 1";
                  break;
               case "krslot2":
                  MovieClip(this).slotName.text = "存档 2";
                  break;
               case "krslot3":
                  MovieClip(this).slotName.text = "存档 3";
            }
            if(!this.slotAllreadyPremium)
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
      
      public function setCopyHover() : void
      {
         if(this.slotStatus)
         {
            this.gotoAndStop("move");
         }
      }
      
      public function unSetCopyHover() : void
      {
         if(this.slotStatus)
         {
            this.gotoAndStop("idle");
         }
      }
      
      protected function click(param1:MouseEvent) : void
      {
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
         this.cRoot.initGame(this.§_-PR§);
      }
      
      protected function rollOver(param1:MouseEvent) : void
      {
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
         if(this.slotOnConfirm)
         {
            return;
         }
         this.gotoAndStop("over" + this.endLabel);
      }
      
      protected function mouseUp(param1:MouseEvent) : void
      {
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
         var my_so:SharedObject = null;
         this.deleteButton.removeEventListener(MouseEvent.CLICK,this.§_-Cx§);
         this.deleteButton.removeEventListener(MouseEvent.ROLL_OVER,this.§_-Mo§);
         this.deleteButton.removeEventListener(MouseEvent.ROLL_OUT,this.§_-3A§);
         this.deleteButton.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-BT§);
         this.deleteButton.removeEventListener(MouseEvent.MOUSE_UP,this.§_-Ph§);
         this.deleteButton = null;
         this.§_-4r§.destroyThis();
         this.§_-8T§.destroyThis();
         try
         {
            my_so = SharedObject.getLocal(this.§_-PR§);
            my_so.clear();
            my_so.close();
         }
         catch(err:Error)
         {
         }
         this.slotOnConfirm = false;
         this.slotStatus = false;
         this.gotoAndStop("idleNew");
         this.endLabel = "New";
         this.cRoot.§_-Gl§();
      }
      
      public function cancelDeleteSlot() : void
      {
         this.parent.addChild(this.deleteButton);
         this.§_-4r§.destroyThis();
         this.§_-8T§.destroyThis();
         this.slotOnConfirm = false;
         this.endLabel = "";
         this.loadSlotSavedData();
         this.loadInitSettings();
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
