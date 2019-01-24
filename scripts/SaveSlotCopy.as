package
{
   import com.reintroducing.sound.SoundManager;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.net.SharedObject;
   
   public class SaveSlotCopy extends MovieClip
   {
       
      
      protected var §_-Pt§:Boolean;
      
      protected var native:Boolean;
      
      protected var §_-36§:int = 90;
      
      protected var §_-Ig§:int;
      
      protected var error:Boolean;
      
      protected var slotWarning:SaveSlotWarningOverride;
      
      public var isBlocked:Boolean;
      
      protected var §_-4U§:Defense;
      
      protected var cRoot:MainMenu;
      
      public function SaveSlotCopy(param1:MainMenu, param2:Defense)
      {
         super();
         this.cRoot = param1;
         this.§_-4U§ = param2;
         this.x = 187;
         this.y = 105;
         this.gotoAndStop("idle");
         this.addEventListener(MouseEvent.CLICK,this.click,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OVER,this.rollOver,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,this.rollOut,false,0,true);
         this.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDown,false,0,true);
         this.addEventListener(MouseEvent.MOUSE_UP,this.mouseUp,false,0,true);
         this.addEventListener(Event.ENTER_FRAME,this.eFrameEvents,false,0,true);
      }
      
      public function eFrameEvents(param1:Event) : void
      {
         if(!this.§_-Pt§)
         {
            return;
         }
         this.§_-Ig§++;
         if(this.§_-Ig§ < this.§_-36§)
         {
            return;
         }
         if(this.native)
         {
            this.§_-Pt§ = false;
            if(!this.error)
            {
               this.slotWarning.destroyThis();
            }
            else
            {
               this.slotWarning.showError();
            }
         }
      }
      
      protected function click(param1:MouseEvent) : void
      {
         if(this.isBlocked)
         {
            return;
         }
         this.cRoot.hideTooltip();
         this.gotoAndStop("idle");
         this.isBlocked = true;
         this.slotWarning = new SaveSlotWarningOverride(this);
         this.cRoot.addChild(this.slotWarning);
      }
      
      public function §_-6F§() : void
      {
         this.error = false;
         this.§_-Pt§ = true;
         this.native = false;
         this.§_-Ig§ = 0;
         this.§set §("krslot1","slot1");
      }
      
      public function §_-AH§(param1:Object) : void
      {
         if(!param1.success)
         {
            this.error = true;
         }
         this.§set §("krslot2","slot2");
      }
      
      public function saveOnlineCallback2(param1:Object) : void
      {
         if(!param1.success)
         {
            this.error = true;
         }
         this.§set §("krslot3","slot3");
      }
      
      public function saveOnlineCallback3(param1:Object) : void
      {
         if(!param1.success)
         {
            this.error = true;
         }
         if(!this.error)
         {
            this.cRoot.§_-GY§();
         }
         else
         {
            this.cRoot.§_-8J§();
         }
         this.native = true;
         this.isBlocked = false;
      }
      
      protected function §set §(param1:String, param2:String) : void
      {
         var § 3§:SharedObject = null;
         var § 4§:int = 0;
         var § 0§:String = param1;
         var § 1§:String = param2;
         var § 2§:Object = new Object();
         try
         {
            § 3§ = SharedObject.getLocal(§ 0§);
            if(§ 3§.data.levels != undefined)
            {
               § 2§.levels = [];
               § 4§ = 0;
               while(§ 4§ < § 3§.data.levels.length)
               {
                  § 2§.levels.push({
                     "index":§ 4§,
                     "status":§ 3§.data.levels[§ 4§].status,
                     "stars":§ 3§.data.levels[§ 4§].stars,
                     "heroicView":§ 3§.data.levels[§ 4§].heroicView,
                     "ironView":§ 3§.data.levels[§ 4§].ironView,
                     "heroic":§ 3§.data.levels[§ 4§].heroic,
                     "iron":§ 3§.data.levels[§ 4§].iron,
                     "campaignDifficulty":§ 3§.data.levels[§ 4§].campaignDifficulty,
                     "heroicDifficulty":§ 3§.data.levels[§ 4§].heroicDifficulty,
                     "ironDifficulty":§ 3§.data.levels[§ 4§].ironDifficulty
                  });
                  § 4§++;
               }
               § 2§.starsWon = § 3§.data.starsWon;
               § 2§.stars = § 3§.data.stars;
               § 2§.difficulty = § 3§.data.difficulty;
               § 2§.earnFacebookStar = § 3§.data.earnFacebookStar;
               § 2§.earnTwitterStar = § 3§.data.earnTwitterStar;
               if(§ 3§.data.achievements == null)
               {
                  § 2§.achievements = new Object();
               }
               else
               {
                  § 2§.achievements = § 3§.data.achievements;
               }
               if(§ 3§.data.upgrades == null)
               {
                  § 2§.upgrades = new Object();
               }
               else
               {
                  § 2§.upgrades = § 3§.data.upgrades;
               }
               if(§ 3§.data.encyclopedia == null)
               {
                  § 2§.encyclopedia = new Object();
               }
               else
               {
                  § 2§.encyclopedia = § 3§.data.encyclopedia;
               }
               if(this.§_-4U§.mpc)
               {
                  § 2§.pcAlreadyGot = false;
                  § 2§.pcExtraReinforcement = true;
                  § 2§.pcHasGold = true;
                  § 2§.pcLightning = true;
                  § 2§.pcSelectedReinforcement = GameSettings.§_-8-§;
               }
               § 3§.close();
               switch(§ 1§)
               {
                  case "slot1":
                     this.§_-4U§.agi.submitUserData(§ 1§,§ 2§,this.§_-AH§);
                     break;
                  case "slot2":
                     this.§_-4U§.agi.submitUserData(§ 1§,§ 2§,this.saveOnlineCallback2);
                     break;
                  case "slot3":
                     this.§_-4U§.agi.submitUserData(§ 1§,§ 2§,this.saveOnlineCallback3);
               }
               return;
            }
         }
         catch(err:Error)
         {
         }
         switch(§ 1§)
         {
            case "slot1":
               this.§set §("krslot2","slot2");
               break;
            case "slot2":
               this.§set §("krslot3","slot3");
               break;
            case "slot3":
               this.cRoot.§_-GY§();
               this.native = true;
               this.isBlocked = false;
         }
      }
      
      protected function rollOver(param1:MouseEvent) : void
      {
         if(this.isBlocked)
         {
            return;
         }
         this.cRoot.showTooltip("Copy Slots","Copy your local saves to your online save slots.");
         SoundManager.getInstance().playSound("gui_mouse_over_tower_common",1,0,0);
         this.buttonMode = true;
         this.mouseChildren = false;
         this.useHandCursor = true;
         this.gotoAndStop("over");
         this.cRoot.§_-D0§();
      }
      
      protected function rollOut(param1:MouseEvent) : void
      {
         if(this.isBlocked)
         {
            return;
         }
         this.cRoot.hideTooltip();
         SoundManager.getInstance().stopSound("gui_mouse_over_tower_common");
         this.useHandCursor = false;
         this.gotoAndStop("idle");
         this.cRoot.§_-7O§();
      }
      
      protected function mouseDown(param1:MouseEvent) : void
      {
         if(this.isBlocked)
         {
            return;
         }
         this.gotoAndStop("over");
      }
      
      protected function mouseUp(param1:MouseEvent) : void
      {
         if(this.isBlocked)
         {
            return;
         }
         this.gotoAndStop("over");
         this.cRoot.§_-7O§();
      }
      
      public function destroyThis() : void
      {
         this.§_-4U§ = null;
         this.cRoot = null;
         this.removeEventListener(Event.ENTER_FRAME,this.eFrameEvents);
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
