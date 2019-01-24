package
{
   import Playtomic.Log;
   import §_-CI§.§_-EI§;
   import com.reintroducing.sound.SoundManager;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.net.SharedObject;
   import flash.net.URLRequest;
   import flash.net.trace;
   import ironhide.utils.tooltip.TooltipBlack;
   
   public class MainMenu extends MovieClip
   {
       
      
      public var §_-Ob§:MovieClip;
      
      public var §_-MM§:MovieClip;
      
      public var slotsHolder:MovieClip;
      
      public var link_armorgames:MovieClip;
      
      public var §_-TY§:MovieClip;
      
      public var §_-SS§:MovieClip;
      
      public var §_-2V§:MovieClip;
      
      public var §_-9S§:MovieClip;
      
      public var §_-J1§:MovieClip;
      
      private var location:int;
      
      private var §_-SA§:Boolean = false;
      
      private var §_-Lr§:Boolean = false;
      
      private var inTime:int = 46;
      
      private var inCreditsTime:int = 20;
      
      private var inTimeCounter:int = 0;
      
      private var outSlotTime:int = 6;
      
      private var outSlotTimeCounter:int = 0;
      
      private var outTime:int = 12;
      
      private var outTimeCounter:int = 0;
      
      public var menuBlock:MenuBlock;
      
      public var loginWidget:LoginWidget;
      
      public var §_-1J§:MenuPremiumWindow;
      
      public var §_-8o§:ButPremiumContentMainMenu;
      
      private var slotCopy:SaveSlotCopy;
      
      private var errorWarning:MainMenuErrorWarning;
      
      private var slotOnline1:SaveSlotOnline;
      
      private var slotOnline2:SaveSlotOnline;
      
      private var slotOnline3:SaveSlotOnline;
      
      private var readyToGetOnlineData:Boolean = false;
      
      private var gettingOnlineData:Boolean = false;
      
      protected var tooltip:TooltipBlack;
      
      private var slot1:SaveSlotItem;
      
      private var slot2:SaveSlotItem;
      
      private var slot3:SaveSlotItem;
      
      private var selectedSlot:String;
      
      private var §_-FV§:§_-7x§;
      
      private var §_-N§:§_-F6§;
      
      private const §_-5H§:int = 0;
      
      private const §_-QY§:int = 1;
      
      private const §_-Ij§:int = 2;
      
      private const §_-8i§:int = 3;
      
      public function MainMenu()
      {
         this.menuBlock = new MenuBlock();
         super();
         addFrameScript(46,this.frame47,58,this.frame59,74,this.frame75,81,this.frame82);
         this.slot1 = new SaveSlotItem(new Point(46,31),"krslot1",this);
         this.slot2 = new SaveSlotItem(new Point(46,99),"krslot2",this);
         this.slot3 = new SaveSlotItem(new Point(46,167),"krslot3",this);
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      public function init(param1:Event) : void
      {
         this.§_-N§ = new §_-F6§(Defense(this.parent),new Point(15,105));
         this.addChild(this.§_-N§);
         this.§_-FV§ = new §_-7x§(Defense(this.parent),new Point(15,138),true);
         this.addChild(this.§_-FV§);
         SoundManager.getInstance().stopSound("music_main_menu");
         SoundManager.getInstance().stopSound("music_map");
         SoundManager.getInstance().stopSound("music_pre_battle");
         SoundManager.getInstance().stopSound("music_battle");
         SoundManager.getInstance().playSound("music_main_menu",1,0,9999);
         this.gotoAndPlay("in");
         this.§_-SS§.gotoAndStop("idle");
         MovieClip(this.§_-TY§).buttonMode = true;
         MovieClip(this.§_-TY§).mouseChildren = false;
         MovieClip(this.§_-TY§).useHandCursor = true;
         MovieClip(this.§_-TY§).addEventListener(MouseEvent.CLICK,this.§_-QG§,false,0,true);
         MovieClip(this.link_armorgames).buttonMode = true;
         MovieClip(this.link_armorgames).mouseChildren = false;
         MovieClip(this.link_armorgames).useHandCursor = true;
         MovieClip(this.link_armorgames).addEventListener(MouseEvent.CLICK,this.linkArmorGames,false,0,true);
         MovieClip(this.§_-Ob§).buttonMode = true;
         MovieClip(this.§_-Ob§).mouseChildren = false;
         MovieClip(this.§_-Ob§).useHandCursor = true;
         MovieClip(this.§_-Ob§).addEventListener(MouseEvent.CLICK,this.§_-J5§,false,0,true);
         MovieClip(this.§_-MM§).buttonMode = true;
         MovieClip(this.§_-MM§).mouseChildren = false;
         MovieClip(this.§_-MM§).useHandCursor = true;
         MovieClip(this.§_-MM§).addEventListener(MouseEvent.CLICK,this.§_-u§,false,0,true);
         this.§_-J1§.addEventListener(MouseEvent.CLICK,this.§_-52§,false,0,true);
         this.§_-J1§.addEventListener(MouseEvent.ROLL_OVER,this.§_-D3§,false,0,true);
         this.§_-J1§.addEventListener(MouseEvent.ROLL_OUT,this.§_-0w§,false,0,true);
         this.§_-J1§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-OV§,false,0,true);
         this.§_-J1§.addEventListener(MouseEvent.MOUSE_UP,this.§_-Qa§,false,0,true);
         this.§_-9S§.addEventListener(MouseEvent.CLICK,this.facebook,false,0,true);
         this.§_-9S§.addEventListener(MouseEvent.ROLL_OVER,this.§_-S1§,false,0,true);
         this.§_-9S§.addEventListener(MouseEvent.ROLL_OUT,this.§_-AI§,false,0,true);
         this.§_-9S§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-I0§,false,0,true);
         this.§_-9S§.addEventListener(MouseEvent.MOUSE_UP,this.§_-e§,false,0,true);
         this.addEventListener(Event.ENTER_FRAME,this.eFrameEvents,false,0,true);
      }
      
      public function §_-CT§() : void
      {
         if(!this.contains(this.menuBlock))
         {
            this.addChild(this.menuBlock);
         }
         this.menuBlock.show();
      }
      
      public function §_-3S§() : Boolean
      {
         return this.contains(this.menuBlock);
      }
      
      public function §_-B4§() : void
      {
         if(this.contains(this.menuBlock))
         {
            this.menuBlock.hide();
         }
      }
      
      public function showTooltip(param1:String, param2:String) : void
      {
         this.tooltip.loadTooltip(new Point(this.mouseX + 5,this.mouseY - 5),new Point(this.mouseX - 5,this.mouseY - 5),230,{
            "title":param1,
            "text":param2,
            "width":240
         });
         this.addChild(this.tooltip);
      }
      
      public function hideTooltip() : void
      {
         if(this.tooltip != null && this.contains(this.tooltip))
         {
            this.tooltip.hideTooltip();
         }
      }
      
      public function moveTooltip(param1:int) : void
      {
         if(this.tooltip != null)
         {
            this.tooltip.x = this.mouseX + 12 * param1;
            this.tooltip.y = this.mouseY - 8;
         }
      }
      
      public function §_-3j§(param1:Object, param2:Object) : void
      {
         var _loc3_:Tips = null;
         if(this.stage == null)
         {
            return;
         }
         if(param2.Success)
         {
            _loc3_ = new Tips(this.stage.loaderInfo.url,param1.blUrls);
            if(_loc3_.§_-ML§())
            {
               this.addChild(new §_-Th§());
            }
         }
      }
      
      public function eFrameEvents(param1:Event) : void
      {
         if(this.location == this.§_-5H§)
         {
            if(!this.§_-SA§)
            {
               this.inTimeCounter++;
               if(this.inTimeCounter == this.inTime)
               {
                  this.§_-SS§.addEventListener(MouseEvent.CLICK,this.clickEvent,false,0,true);
                  this.§_-SS§.addEventListener(MouseEvent.ROLL_OVER,this.§_-Lx§,false,0,true);
                  this.§_-SS§.addEventListener(MouseEvent.ROLL_OUT,this.§_-HC§,false,0,true);
                  this.§_-SS§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-LS§,false,0,true);
                  this.§_-SS§.addEventListener(MouseEvent.MOUSE_UP,this.§_-4o§,false,0,true);
                  this.§_-SA§ = true;
                  this.inTime = 21;
                  this.inCreditsTime = 1;
                  this.location = this.§_-Ij§;
               }
               if(this.inTimeCounter == this.inCreditsTime)
               {
                  this.§_-2V§.gotoAndStop("idle");
                  this.§_-2V§.visible = true;
                  this.§_-2V§.addEventListener(MouseEvent.CLICK,this.§_-9A§,false,0,true);
                  this.§_-2V§.addEventListener(MouseEvent.ROLL_OVER,this.§_-79§,false,0,true);
                  this.§_-2V§.addEventListener(MouseEvent.ROLL_OUT,this.§_-AB§,false,0,true);
                  this.§_-2V§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-6i§,false,0,true);
                  this.§_-2V§.addEventListener(MouseEvent.MOUSE_UP,this.§_-A3§,false,0,true);
               }
               return;
            }
         }
         if(this.location == this.§_-8i§)
         {
            if(this.outTimeCounter < this.outTime)
            {
               this.outTimeCounter++;
               return;
            }
            this.loadSaveSlots();
            this.location = this.§_-Ij§;
            this.§_-2V§.visible = false;
         }
         if(this.location == this.§_-QY§)
         {
            if(this.outSlotTimeCounter < this.outSlotTime)
            {
               this.outSlotTimeCounter++;
               return;
            }
            this.§_-MA§();
            this.gotoAndPlay("inMenu");
            this.§_-SS§.gotoAndStop("idle");
            this.location = this.§_-5H§;
            this.§_-SA§ = false;
            this.inTimeCounter = 0;
         }
      }
      
      public function §_-D0§() : void
      {
         this.slot1.setCopyHover();
         this.slot2.setCopyHover();
         this.slot3.setCopyHover();
      }
      
      public function §_-7O§() : void
      {
         this.slot1.unSetCopyHover();
         this.slot2.unSetCopyHover();
         this.slot3.unSetCopyHover();
      }
      
      public function §_-GY§() : void
      {
         this.readyToGetOnlineData = true;
      }
      
      public function §_-8J§() : void
      {
         Defense(this.parent).mpc = false;
         this.slotOnline1.blockMe();
         this.slotOnline2.blockMe();
         this.slotOnline3.blockMe();
         this.§_-8o§.§_-Gr§();
      }
      
      public function §_-CP§() : void
      {
         Defense(this.parent).loadGame(this.selectedSlot);
         this.destroyThis();
      }
      
      private function §_-7j§() : void
      {
         this.§_-SS§.removeEventListener(MouseEvent.CLICK,this.clickEvent);
         this.§_-SS§.removeEventListener(MouseEvent.ROLL_OVER,this.§_-Lx§);
         this.§_-SS§.removeEventListener(MouseEvent.ROLL_OUT,this.§_-HC§);
         this.§_-SS§.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-LS§);
         this.§_-SS§.removeEventListener(MouseEvent.MOUSE_UP,this.§_-4o§);
         this.§_-2V§.removeEventListener(MouseEvent.CLICK,this.§_-9A§);
         this.§_-2V§.removeEventListener(MouseEvent.ROLL_OVER,this.§_-79§);
         this.§_-2V§.removeEventListener(MouseEvent.ROLL_OUT,this.§_-AB§);
         this.§_-2V§.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-6i§);
         this.§_-2V§.removeEventListener(MouseEvent.MOUSE_UP,this.§_-A3§);
      }
      
      private function loadSaveSlots() : void
      {
         this.gotoAndPlay("inSave");
         this.slotsHolder.addChild(this.slot1);
         this.slotsHolder.addChild(this.slot2);
         this.slotsHolder.addChild(this.slot3);
         this.slotsHolder.butBack.addEventListener(MouseEvent.CLICK,this.§_-s§,false,0,true);
         this.slotsHolder.butBack.addEventListener(MouseEvent.ROLL_OVER,this.§else §,false,0,true);
         this.slotsHolder.butBack.addEventListener(MouseEvent.ROLL_OUT,this.§_-CE§,false,0,true);
         this.slotsHolder.butBack.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-Ox§,false,0,true);
         this.slotsHolder.butBack.addEventListener(MouseEvent.MOUSE_UP,this.§_-JT§,false,0,true);
         this.slotsHolder.butBack.gotoAndStop("idle");
      }
      
      private function §_-MA§() : void
      {
         if(this.slotsHolder != null)
         {
            this.slotsHolder.removeChild(this.slot1);
            this.slotsHolder.removeChild(this.slot2);
            this.slotsHolder.removeChild(this.slot3);
         }
      }
      
      public function initGame(param1:String) : void
      {
         Log.Play();
         this.selectedSlot = param1;
         Defense(this.parent).showTransition(null,null,this);
      }
      
      public function initOnlineGame(param1:String, param2:Object, param3:int) : void
      {
         Log.Play();
         this.selectedSlot = param1;
         Defense(this.parent).onlineData = param2;
         Defense(this.parent).onlineSlotNumber = param3;
         Defense(this.parent).showTransition(null,null,this);
      }
      
      private function §_-n§(param1:Number, param2:Number) : Boolean
      {
         if(param1 > 700 || param1 < 0 || (param2 < 0 || param2 > 600))
         {
            return true;
         }
         return false;
      }
      
      private function getOnlineData(param1:Object) : void
      {
         var _loc2_:Object = null;
         if(this.errorWarning == null)
         {
            return;
         }
         this.gettingOnlineData = false;
         if(param1.success)
         {
            if(this.slotsHolder != null)
            {
               if(this.contains(this.errorWarning))
               {
                  this.removeChild(this.errorWarning);
               }
               _loc2_ = param1.data;
               if(_loc2_.kingdomRushPremiumContentEnabled == null || _loc2_.kingdomRushPremiumContentEnabled != 2)
               {
                  Defense(this.parent).mpc = false;
               }
               else if(_loc2_.kingdomRushPremiumContentEnabled == 2)
               {
                  Defense(this.parent).mpc = true;
               }
               this.§_-8o§.§_-4v§(_loc2_.kingdomRushPremiumContentEnabled);
               this.slotOnline1.loadSlotSavedData(_loc2_.slot1);
               this.slotOnline2.loadSlotSavedData(_loc2_.slot2);
               this.slotOnline3.loadSlotSavedData(_loc2_.slot3);
               if(this.§_-1J§ != null && this.contains(this.§_-1J§))
               {
                  this.§_-1J§.updatePC(Defense(this.parent).mpc);
               }
            }
         }
         else
         {
            this.§_-8J§();
            this.errorWarning.action = "get_data";
            if(this.§_-1J§ != null && this.contains(this.§_-1J§))
            {
               this.§_-B4§();
               this.§_-1J§.destroyThis();
            }
            if(!this.contains(this.errorWarning))
            {
               this.addChild(this.errorWarning);
            }
            else
            {
               this.errorWarning.§_-HR§();
            }
         }
      }
      
      public function §_-Gl§() : void
      {
      }
      
      public function §_-6x§() : void
      {
      }
      
      public function §_-GD§() : void
      {
      }
      
      public function §_-Cf§() : Boolean
      {
         var § 0§:SharedObject = null;
         var § 1§:SharedObject = null;
         var § 2§:SharedObject = null;
         try
         {
            § 0§ = SharedObject.getLocal("krslot1");
            if(§ 0§.data.levels != undefined)
            {
               § 0§.close();
               return true;
            }
            § 0§.close();
         }
         catch(err:Error)
         {
         }
         try
         {
            § 1§ = SharedObject.getLocal("krslot2");
            if(§ 1§.data.levels != undefined)
            {
               § 1§.close();
               return true;
            }
            § 0§.close();
         }
         catch(err:Error)
         {
         }
         try
         {
            § 2§ = SharedObject.getLocal("krslot3");
            if(§ 2§.data.levels != undefined)
            {
               § 2§.close();
               return true;
            }
            § 0§.close();
         }
         catch(err:Error)
         {
         }
         return false;
      }
      
      public function clickEvent(param1:MouseEvent) : void
      {
         this.§_-7j§();
         this.gotoAndPlay("out");
         this.location = this.§_-8i§;
         this.outTimeCounter = 0;
         SoundManager.getInstance().stopSound("gui_button_common");
         SoundManager.getInstance().playSound("gui_button_common",1,0,0);
      }
      
      public function §_-Lx§(param1:MouseEvent) : void
      {
         SoundManager.getInstance().stopSound("gui_mouse_over_tower_common");
         SoundManager.getInstance().playSound("gui_mouse_over_tower_common",1,0,0);
         this.§_-SS§.buttonMode = true;
         this.§_-SS§.mouseChildren = false;
         this.§_-SS§.useHandCursor = true;
         this.§_-SS§.gotoAndStop("over");
      }
      
      public function §_-HC§(param1:MouseEvent) : void
      {
         this.§_-SS§.useHandCursor = false;
         this.§_-SS§.gotoAndStop("idle");
      }
      
      public function §_-LS§(param1:MouseEvent) : void
      {
         this.§_-SS§.gotoAndStop("press");
      }
      
      public function §_-4o§(param1:MouseEvent) : void
      {
         this.§_-SS§.gotoAndStop("idle");
      }
      
      public function §_-LF§() : void
      {
         Defense(this.parent).§_-Bm§();
         this.destroyThis();
      }
      
      public function §_-9A§(param1:MouseEvent) : void
      {
         this.§_-7j§();
         Defense(this.parent).showTransition(null,null,null,null,this);
         SoundManager.getInstance().stopSound("gui_button_common");
         SoundManager.getInstance().playSound("gui_button_common",1,0,0);
      }
      
      public function §_-79§(param1:MouseEvent) : void
      {
         SoundManager.getInstance().stopSound("gui_mouse_over_tower_common");
         SoundManager.getInstance().playSound("gui_mouse_over_tower_common",1,0,0);
         this.§_-2V§.buttonMode = true;
         this.§_-2V§.mouseChildren = false;
         this.§_-2V§.useHandCursor = true;
         this.§_-2V§.gotoAndStop("over");
      }
      
      public function §_-AB§(param1:MouseEvent) : void
      {
         this.§_-2V§.useHandCursor = false;
         this.§_-2V§.gotoAndStop("idle");
      }
      
      public function §_-6i§(param1:MouseEvent) : void
      {
         this.§_-2V§.gotoAndStop("press");
      }
      
      public function §_-A3§(param1:MouseEvent) : void
      {
         this.§_-2V§.gotoAndStop("idle");
      }
      
      public function §_-9U§() : void
      {
         if(this.slotsHolder != null)
         {
            this.slotsHolder.butBack.removeEventListener(MouseEvent.CLICK,this.§_-s§);
            this.slotsHolder.butBack.removeEventListener(MouseEvent.ROLL_OVER,this.§else §);
            this.slotsHolder.butBack.removeEventListener(MouseEvent.ROLL_OUT,this.§_-CE§);
            this.slotsHolder.butBack.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-Ox§);
            this.slotsHolder.butBack.removeEventListener(MouseEvent.MOUSE_UP,this.§_-JT§);
         }
      }
      
      public function §_-s§(param1:MouseEvent) : void
      {
         SoundManager.getInstance().stopSound("gui_button_common");
         SoundManager.getInstance().playSound("gui_button_common",1,0,0);
         this.§_-9U§();
         this.gotoAndPlay("outSave");
         this.location = this.§_-QY§;
         this.outSlotTimeCounter = 0;
      }
      
      public function §else §(param1:MouseEvent) : void
      {
         SoundManager.getInstance().stopSound("gui_mouse_over_tower_common");
         SoundManager.getInstance().playSound("gui_mouse_over_tower_common",1,0,0);
         this.slotsHolder.butBack.buttonMode = true;
         this.slotsHolder.butBack.mouseChildren = false;
         this.slotsHolder.butBack.useHandCursor = true;
         this.slotsHolder.butBack.gotoAndStop("over");
      }
      
      public function §_-CE§(param1:MouseEvent) : void
      {
         this.slotsHolder.butBack.useHandCursor = false;
         this.slotsHolder.butBack.gotoAndStop("idle");
      }
      
      public function §_-Ox§(param1:MouseEvent) : void
      {
         this.slotsHolder.butBack.gotoAndStop("press");
      }
      
      public function §_-JT§(param1:MouseEvent) : void
      {
         this.slotsHolder.butBack.gotoAndStop("idle");
      }
      
      private function §_-QG§(param1:MouseEvent) : void
      {
         Log.CustomMetric("Link Ironhide","MainMenu",true);
         Log.ForceSend();
         var _loc2_:String = §_-EI§.§_-7r§(861,825);
         var _loc3_:URLRequest = new URLRequest(_loc2_);
         trace(_loc3_,"_blank");
      }
      
      private function linkArmorGames(param1:MouseEvent) : void
      {
         Log.CustomMetric("Link ArmorGames","MainMenu",true);
         Log.ForceSend();
         var _loc2_:String = §_-EI§.§_-7r§(862,826);
         var _loc3_:URLRequest = new URLRequest(_loc2_);
         trace(_loc3_,"_blank");
      }
      
      private function §_-u§(param1:MouseEvent) : void
      {
         Log.CustomMetric("Link App Store Iphone","MainMenu",true);
         Log.ForceSend();
         var _loc3_:URLRequest = new URLRequest("http://itunes.apple.com/cn/app/kingdom-rush/id516378985?ls=1&mt=8");
         trace(_loc3_,"_blank");
      }
      
      private function §_-J5§(param1:MouseEvent) : void
      {
         Log.CustomMetric("Link App Store Ipad","MainMenu",true);
         Log.ForceSend();
         var _loc3_:URLRequest = new URLRequest("http://itunes.apple.com/cn/app/kingdom-rush/id489265199?ls=1&mt=8");
         trace(_loc3_,"_blank");
      }
      
      protected function facebook(param1:MouseEvent) : void
      {
         SoundManager.getInstance().stopSound("gui_button_common");
         SoundManager.getInstance().playSound("gui_button_common",1,0,0);
         Log.CustomMetric("Link Weibo","MainMenu",true);
         Log.ForceSend();
         var _loc3_:URLRequest = new URLRequest("http://www.weibo.com/u/2843581860");
         trace(_loc3_,"_blank");
      }
      
      protected function §_-S1§(param1:MouseEvent) : void
      {
         SoundManager.getInstance().stopSound("gui_mouse_over_tower_common");
         SoundManager.getInstance().playSound("gui_mouse_over_tower_common",1,0,0);
         this.§_-9S§.buttonMode = true;
         this.§_-9S§.mouseChildren = false;
         this.§_-9S§.useHandCursor = true;
         this.§_-9S§.gotoAndStop("over");
      }
      
      protected function §_-AI§(param1:MouseEvent) : void
      {
         this.§_-9S§.useHandCursor = false;
         this.§_-9S§.gotoAndStop("idle");
      }
      
      protected function §_-I0§(param1:MouseEvent) : void
      {
         this.§_-9S§.gotoAndStop("press");
      }
      
      protected function §_-e§(param1:MouseEvent) : void
      {
         this.§_-9S§.gotoAndStop("idle");
      }
      
      protected function §_-52§(param1:MouseEvent) : void
      {
         SoundManager.getInstance().stopSound("gui_button_common");
         SoundManager.getInstance().playSound("gui_button_common",1,0,0);
         Log.CustomMetric("Link Tencent","MainMenu",true);
         Log.ForceSend();
         var _loc3_:URLRequest = new URLRequest("http://t.qq.com/kingdom-rush");
         trace(_loc3_,"_blank");
      }
      
      protected function §_-D3§(param1:MouseEvent) : void
      {
         SoundManager.getInstance().stopSound("gui_mouse_over_tower_common");
         SoundManager.getInstance().playSound("gui_mouse_over_tower_common",1,0,0);
         this.§_-J1§.buttonMode = true;
         this.§_-J1§.mouseChildren = false;
         this.§_-J1§.useHandCursor = true;
         this.§_-J1§.gotoAndStop("over");
      }
      
      protected function §_-0w§(param1:MouseEvent) : void
      {
         this.§_-J1§.useHandCursor = false;
         this.§_-J1§.gotoAndStop("idle");
      }
      
      protected function §_-OV§(param1:MouseEvent) : void
      {
         this.§_-J1§.gotoAndStop("press");
      }
      
      protected function §_-Qa§(param1:MouseEvent) : void
      {
         this.§_-J1§.gotoAndStop("idle");
      }
      
      public function destroyThis() : void
      {
         if(this.tooltip != null)
         {
            this.tooltip.destroyThis();
         }
         this.tooltip = null;
         this.§_-FV§.destroyThis();
         this.§_-FV§ = null;
         this.§_-N§.destroyThis();
         this.§_-N§ = null;
         if(this.§_-TY§ != null)
         {
            this.§_-J1§.removeEventListener(MouseEvent.CLICK,this.§_-52§);
            this.§_-J1§.removeEventListener(MouseEvent.ROLL_OVER,this.§_-D3§);
            this.§_-J1§.removeEventListener(MouseEvent.ROLL_OUT,this.§_-0w§);
            this.§_-J1§.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-OV§);
            this.§_-J1§.removeEventListener(MouseEvent.MOUSE_UP,this.§_-Qa§);
            this.§_-9S§.removeEventListener(MouseEvent.CLICK,this.facebook);
            this.§_-9S§.removeEventListener(MouseEvent.ROLL_OVER,this.§_-S1§);
            this.§_-9S§.removeEventListener(MouseEvent.ROLL_OUT,this.§_-AI§);
            this.§_-9S§.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-I0§);
            this.§_-9S§.removeEventListener(MouseEvent.MOUSE_UP,this.§_-e§);
         }
         this.removeEventListener(Event.ENTER_FRAME,this.eFrameEvents);
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.§_-9U§();
         this.§_-MA§();
         this.§_-B4§();
         this.menuBlock = null;
         this.parent.removeChild(this);
      }
      
      function frame47() : *
      {
         stop();
      }
      
      function frame59() : *
      {
         stop();
      }
      
      function frame75() : *
      {
         stop();
      }
      
      function frame82() : *
      {
         stop();
      }
   }
}
